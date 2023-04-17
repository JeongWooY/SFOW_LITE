package com.yeonoo.so.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeonoo.so.domain.OrderDetailVO;
import com.yeonoo.so.domain.OrderVO;
import com.yeonoo.so.repository.OrderDAO;


@Service
public class OrderService {

	@Autowired 
	private OrderDAO  orderDAO;
	
		//수주서조회
		public List<OrderVO> orderList(String  company_code) throws Exception {
			return orderDAO.orderList(company_code);
		}
		
		//수주서 상세조회
		public List<OrderDetailVO> orderDetail(String order_number) throws Exception {
			return orderDAO.orderDetail(order_number);
		}
		
		//등록
		   public int orderInsert(OrderVO elements) {
		      return orderDAO.orderInsert(elements);
		   }
	  
		   //상세 등록
		   public int orderInsert2(OrderDetailVO elements) {
			   return orderDAO.orderInsert2(elements);
		   }
		   
	    //삭제
		public int orderDelete(String order_number) {
			return orderDAO.orderDelete(order_number);
		}
		//상세 삭제
				public int orderDelete2(int oddNo) {
					return orderDAO.orderDelete2(oddNo);
				}
		
		//상태수정
		public int orderUpdateStatus(String order_number) {
			return orderDAO.orderUpdateStatus(order_number);
		}
	
		//수정
		public int orderUpdate(OrderVO elements) {
			return orderDAO.orderUpdate(elements);
		}
	
		//상세 수정
		public int orderUpdate2(OrderDetailVO elements) {
			return orderDAO.orderUpdate2(elements);
		}
		
		 //아이템조회
		public List<Map<String, Object>> getItem(String company_code) {
		    return orderDAO.getItem(company_code);
		}
	
		//거래처조회
		public List<Map<String, Object>> getClient(String company_code) {
			return orderDAO.getClient(company_code);
		}
	    

		   
}
