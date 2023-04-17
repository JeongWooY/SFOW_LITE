package com.yeonoo.so.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.yeonoo.so.controller.ReturnDetailController;
import com.yeonoo.so.domain.ReturnAdd;
import com.yeonoo.so.domain.ReturnDetail;

import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
public class ReturnDetailRepositoryImpl implements ReturnDetailRepository {

	@Autowired
	private SqlSession sqlSession;
	
	//날짜로 반품조회
	public List<ReturnDetail> getReturnDetail(String returnNumber) throws DataAccessException{
		 List<ReturnDetail> list = sqlSession.selectList("so_return_view.getReturnDetail", returnNumber);
		return list;
	}
	
	//저장
	public void insertDetailAdd(Map<String, Object> data) {
		sqlSession.insert("so_return_detail.insertReturnDetail", data);
	}
	
	//수정
	public void updateDetailAdd(Map<String, Object> data) {
		sqlSession.update("so_return_detail.updateReturnDetail", data);
	}
	
	//삭제
	public void deleteReturnDetail(List<Integer> sorder) {
		log.info("Deleting return details with sorders from repository: {}", sorder);
        int result = sqlSession.delete("so_return_detail.deleteReturnDetail", sorder);
        System.out.println(result);
    }
	
    //아이템조회
	public List<Map<String, String>> getItem(String company_code) throws DataAccessException{
	    List<Map<String, String>> result = sqlSession.selectList("so_return_detail.getItem", company_code);
	    System.out.println("아이템조회: " + result);
	    return result;
	}
	
    //반품확정조회
	public List<Map<String, Object>> getReturnInfo(String company_code) throws DataAccessException{
	    List<Map<String, Object>> result = sqlSession.selectList("so_return_detail.getReturnInfo", company_code);
	    System.out.println("Result from sqlSession: " + result);
	    return result;
	}
	
    //클라이언트 코드로 반품조회
	public List<Map<String, Object>> getReturnInfoByClient(String company_code, String client_code) throws DataAccessException{
	    Map<String, Object> params = new HashMap<>();
	    params.put("client_code", client_code);
	    params.put("company_code", company_code); 
		List<Map<String, Object>> result = sqlSession.selectList("so_return_detail.getReturnInfoByClient", params);
	    System.out.println("Result from sqlSession: " + result);
	    return result;
	}
}
