package com.yeonoo.stock.repository;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.yeonoo.stock.domain.Stock;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class StockByWhRepositoryImpl implements StockByWhRepository{
	
	private final SqlSession sqlSession;
	
//	@Autowired
//	private StockRepositoryImpl(SqlSession sqlSession) {
//		this.sqlSession=sqlSession;
//		
//	}
	
	@Override
	public List<Stock> searchAll(String company_code) throws DataAccessException{
        // 데이터베이스에서 검색 결과를 가져오는 로직을 구현한다.

        // 여기서는 더미 데이터를 사용한다.
     
//		String company_code = authUser.getCompanyCode();
//		Stock stock = new Stock();
//		stock.setCompany_code(company_code);
		System.out.println("company_code !!!!넘기기전"+company_code);
        List<Stock> result=sqlSession.selectList("mapper.stockWh.allStockList", company_code);
                
        System.out.println("result repositoryImpl"+result);
        return result;
    }

	@Override
	public void updateStock(Stock data) throws DataAccessException{
		sqlSession.update("mapper.stockWh.updateStock", data);
		
	}
	
	@Override
	public List<Stock> searchWhStock(Stock data, String company_code) throws DataAccessException {
		System.out.println("보내기전 data"+data);
		if((data.getWarehouse_code()==null||data.getWarehouse_code()=="")&&
				(data.getLot_no()==null||data.getLot_no()=="")&&
				(data.getItem_code()==null||data.getItem_code()=="")&&
				(data.getItem_name()==null||data.getItem_name()=="")&&
				(data.getItem_category()==null||data.getItem_category()=="")&&
				(data.getWarehouse_name()==null||data.getWarehouse_name()=="")) {
			Map<String, Object> map = new HashedMap();
		      map.put("company_code" , company_code);
		      map.put("stock" , data);
			List<Stock> result=sqlSession.selectList("mapper.stockWh.allStockList", company_code);
			System.out.println("스톡리포지토리 리저트1"+result);
			return result;
		}else {
			//모든 input태그의 값이 null 또는 "" 이 아닌 값이 있을 때 동작
		    String warehouseCode = data.getWarehouse_code();	//data라는 객체에 getter로 warehouse_code가져와 String 변수에 저장
		    if (warehouseCode != null && warehouseCode.contains("@N@")) {	//만약 위에 저장한 String 변수의 값이 null이 아니면서 @N@구분자가 포함되어있으면 true
		        String[] warehouseCodes = warehouseCode.split("@N@");
		        System.out.println("warehouseCodes 배열"+warehouseCodes);
		        data.setWarehouse_code(null);
		        List<Stock> result = new ArrayList<>();
		        for (String code : warehouseCodes) {
		            data.setWarehouse_code(code);
		            
					Map<String, Object> map = new HashedMap();
				      map.put("company_code" , company_code);
				      map.put("stock" , data);
				      
		            result.addAll(sqlSession.selectList("mapper.stockWh.searchStockList", map));
		            System.out.println("xml 쿼리 갔다온 후"+result);
		        }
		        return result;
		    } else {
		    	
				Map<String, Object> map = new HashedMap();
			      map.put("company_code" , company_code);
			      map.put("stock" , data);
			      
			List<Stock> result=sqlSession.selectList("mapper.stockWh.searchStockList", map);
			System.out.println("스톡리포지토리 리저트2"+result);
	        return result;
		    }

		}
	}
	

	@Override
	public List<Stock> searchWhList() throws DataAccessException {
		List<Stock> result = sqlSession.selectList("mapper.stockWh.searchWhList");
		return result;
	}

	@Override
	public List<Stock> searchWh(Stock data) throws DataAccessException {
		System.out.println("xml로 넘기기전 data"+data);
		List<Stock> result = sqlSession.selectList("mapper.stockWh.searchWh", data);
		return result;
	}
}
