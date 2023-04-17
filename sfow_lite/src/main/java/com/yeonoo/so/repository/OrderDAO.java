package com.yeonoo.so.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yeonoo.so.domain.OrderDetailVO;
import com.yeonoo.so.domain.OrderVO;



@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final static String NAMESPACE = "orderMapper.";
	
	//수주서목록
	public List<OrderVO> orderList(String company_code) throws Exception {
		return sqlSession.selectList(NAMESPACE+"orderList",company_code);
	}
	
	//수주서상세
	public List<OrderDetailVO> orderDetail(String order_number) throws Exception {
		return sqlSession.selectList(NAMESPACE+"orderDetail",order_number);
	}
	
	//등록
      public int orderInsert(OrderVO elements) {
          
          return sqlSession.update(NAMESPACE + "orderInsert", elements);
       }
      //상세 등록
      public int orderInsert2(OrderDetailVO elements) {
    	  
    	  return sqlSession.update(NAMESPACE + "orderInsert2", elements);
      }
      
      //삭제(수정)
      public int orderDelete(String order_number) {
          return sqlSession.update(NAMESPACE + "orderDelete", order_number);
      }

      //상세 삭제(수정)
      public int orderDelete2(int oddNo) {
    	  return sqlSession.update(NAMESPACE + "orderDelete2", oddNo);
      }
      
      //상태수정
      public int orderUpdateStatus(String order_number) {
		return sqlSession.update(NAMESPACE + "orderUpdateStatus", order_number);
	}
   
      //수정
      public int orderUpdate(OrderVO elements) {
    	  return sqlSession.update(NAMESPACE + "orderUpdate", elements);
      }

      //수정
      public int orderUpdate2(OrderDetailVO elements) {
    	  return sqlSession.update(NAMESPACE + "orderUpdate2", elements);
      }
      
    //아이템조회
      public List<Map<String, Object>> getItem(String company_code) {
          List<Map<String, Object>> result = sqlSession.selectList("orderMapper.getItem",company_code);
          return result;
      }

      //거래처조회
      public List<Map<String, Object>> getClient(String company_code) {
    	  List<Map<String, Object>> result = sqlSession.selectList("orderMapper.getClient",company_code);
    	  return result;
      }
      
}


