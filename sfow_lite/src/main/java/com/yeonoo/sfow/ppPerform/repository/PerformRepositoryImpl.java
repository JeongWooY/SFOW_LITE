package com.yeonoo.sfow.ppPerform.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yeonoo.sfow.ppPerform.domain.BOM;
import com.yeonoo.sfow.ppPerform.domain.Order;
import com.yeonoo.sfow.ppPerform.domain.PerStock;
import com.yeonoo.sfow.ppPerform.domain.Perform;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class PerformRepositoryImpl implements PerformRepository{
	
	private final SqlSession sqlSession;
	
	@Override
	public List<Order> selectOrder(Order order) {
		List<Order> result;
		if(order.getPp_no()==""){
			if(order.getPp_date().isEmpty()||order.getEnd_date().isEmpty()) {
	        result = sqlSession.selectList("mapper.perform.selectOrder2",order);
			}else {
				  result = sqlSession.selectList("mapper.perform.selectOrder",order);
			}
	    }else {
	    	if(order.getPp_date()==""||order.getPp_no()==null||order.getEnd_date()==""||order.getEnd_date()==null) {
	        order.setPp_date(null);
	        order.setEnd_date(null);
	        result = sqlSession.selectList("mapper.perform.selectOrder",order);
	        }else {
	        	result = sqlSession.selectList("mapper.perform.selectOrder",order);
	        }
	    }
	    return result;
	}

	@Override
	public void updateOrder(Order order) {
		if(order.getPp_date()=="") {
			order.setPp_date(null);
		}
		if(order.getEnd_date()=="") {
			order.setEnd_date(null);
		}
		
		sqlSession.update("mapper.perform.updateOrder",order);
	}

	@Override
	public List<Perform> selectPerform(Perform perform) {
		List<Perform> result=sqlSession.selectList("mapper.perform.selectPerform",perform);
		return result;
	}

	@Override
	public List<BOM> selectBOM(Perform perform) {
		Perform result = sqlSession.selectOne("mapper.perform.selectPerformByLot",perform);
		
		result.setCompany_code(perform.getCompany_code());
		List<BOM> bom = sqlSession.selectList("mapper.perform.selectBOM",result);
		return bom;
	}

	@Override
	public Boolean insertPerform(Perform perform) {
		
		Order order=sqlSession.selectOne("mapper.perform.selectOrderOne", perform);
		
		
		
		
		if(order.getPp_date()==null||order.getPp_date()=="") {
			sqlSession.update("mapper.perform.updatePerformStart",order);
		}
		
		int validQuantity=sqlSession.selectOne("mapper.perform.selectPerformSum",perform);
		int qty =Integer.parseInt(order.getPp_quantity());
		int performQty =Integer.parseInt(perform.getPer_quantity());
		
		List<BOM> bomSitem = sqlSession.selectList("mapper.perform.bomSitemListSelect",order);
		
		for (int i = 0; i < bomSitem.size(); i++) {
		    BOM bom = bomSitem.get(i);
		    
		    String sitemCd = bom.getSitem_cd();
		    String itemQtya = bom.getItem_qty();
		    int itemQty = Integer.parseInt(itemQtya);//완제품에 필요한 자식 개수
		    int quantity = bom.getQuantity();
		    int ppQuantity = Integer.parseInt(perform.getPer_quantity());
		    int updatedQuantity = quantity -(itemQty * ppQuantity);

		    if (updatedQuantity < 0) {
		    } else {
		        PerStock bomStockUpdate = new PerStock();
		        bomStockUpdate.setItem_code(sitemCd);
		        bomStockUpdate.setQuantity(updatedQuantity);
		        bomStockUpdate.setCompany_code(order.getCompany_code());
		        
		        sqlSession.update("mapper.perform.updateStockQuantity",bomStockUpdate);
		    }
		}
		
		//if() {}
		
		if(qty==validQuantity || qty < validQuantity+performQty){
			return false;	
		
		}else {
		
		int bomNo = sqlSession.selectOne("mapper.perform.selectBOMOne",order);
		
		Perform insertPerform = new Perform();
		insertPerform.setPp_no(order.getPp_no());
		insertPerform.setBomdno(bomNo);
		insertPerform.setItem_code(order.getItem_code());
		insertPerform.setItem_name(order.getItem_name());
		insertPerform.setPer_sTime(perform.getPer_sTime());
		insertPerform.setPer_eTime(perform.getPer_eTime());
		insertPerform.setPer_quantity(perform.getPer_quantity());
		insertPerform.setUser_name(perform.getUser_name());
		insertPerform.setUser_code(perform.getUser_code());
		insertPerform.setCompany_code(perform.getCompany_code());
		
		
		int result=sqlSession.insert("mapper.perform.insertPerform", insertPerform);
		
		int validQuantity2=sqlSession.selectOne("mapper.perform.selectPerformSum",order);
		
		if(validQuantity2==qty) {
			sqlSession.update("mapper.perform.updatePerformEnd",order);
		}
		if(result==1) {
			PerStock performStock=sqlSession.selectOne("mapper.perform.selectPerformStock",order);
			if(performStock==null) {
				PerStock perStock = new PerStock();
				//없을 경우 완제품 insert 
				perStock.setCompany_code(order.getCompany_code());
				perStock.setItem_code(order.getItem_code());
				perStock.setWarehouse_name(order.getWarehouse_name());
				perStock.setWarehouse_code(order.getWarehouse_code());
				String lot=sqlSession.selectOne("mapper.perform.selectLastLot");
				perStock.setLot_no(lot);
				int qtyy=Integer.parseInt(insertPerform.getPer_quantity());
				perStock.setQuantity(qtyy);
				sqlSession.insert("mapper.perform.insertPerStock",perStock);
			}else {
				
				//재고 있을 경우 완제품 재고창고 수량 변경
				int originQty=performStock.getQuantity();
				int sumQty=originQty+performQty;
				performStock.setQuantity(sumQty);
				performStock.setCompany_code(order.getCompany_code());
				sqlSession.update("mapper.perform.updatePerformStock",performStock);
			}
			
			return true;
		}else {	
			
			return false;
		}
		
		}
	}

	@Override
	public int selectQty(String pp_no) {
		int sum=sqlSession.selectOne("mapper.perform.selectPerformSum", pp_no);
		return sum;
	}

	@Override
	public List<Perform> selectWorker(Perform worker) {
		if(worker.getUser_code()==null || worker.getUser_code()==""){
		List<Perform> workers = sqlSession.selectList("mapper.perform.selectWorker",worker);
		return workers;
	}else {
		List<Perform> workers = sqlSession.selectList("mapper.perform.selectWorker2",worker);
		return workers;
	}
	}

	@Override
	public Boolean deletePerform(Perform perform) {
		//delete성공여부를 위한 결과값
		int result=sqlSession.delete("mapper.perform.deletePerform", perform);
		
		//날짜값 초기화를 위한 lot들의 수량 합계
		int lotSum=sqlSession.selectOne("mapper.perform.selectPerformSum",perform);
		
		
		if(lotSum==0) {
			sqlSession.update("mapper.perform.updateOrderDate", perform);	
		}else {
			sqlSession.update("mapper.perform.updateOrderDate2", perform);
		}
		
		if(result==1) {
			int itemStock=sqlSession.selectOne("mapper.perform.selectStockForDel", perform);
			int delStock=Integer.parseInt(perform.getPer_quantity());
			int updateStock=itemStock-delStock;
			
			if(updateStock < 0) {
				updateStock=0;
			}
			
			perform.setQty(updateStock);
			sqlSession.update("mapper.perform.updateStockAfterDel",perform);
			return true;
			
		}else {
			
			return false;
		}
	
	}

	
}
