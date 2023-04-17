package com.yeonoo.so.repository;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.yeonoo.so.domain.ReturnAdd;

@Repository
public class ReturnAddRepositoryImpl implements ReturnAddRepository {

	@Autowired
	private SqlSession sqlSession;
	
	//전체 반품조회
	public List<ReturnAdd> getReturnAdd(String company_code) throws DataAccessException{
		List<ReturnAdd> list = sqlSession.selectList("so_return.getReturnAdd", company_code);
		return list;
	}

	//날짜로 반품조회
	public List<ReturnAdd> getReturnAddByDate(String return_date, String company_code) throws DataAccessException{
	    Map<String, Object> params = new HashMap<>();
	    params.put("return_date", return_date);
	    params.put("company_code", company_code); 
		List<ReturnAdd> list = sqlSession.selectList("so_return.getReturnAddByDate", params);
		System.out.println(params);
		return list;
	}
	
	//삭제
	public void deleteByReturnNumber(String returnNumber) throws DataAccessException{
		sqlSession.delete("so_return.deleteByReturnNumber", returnNumber);
    }
	
	//저장
	public void insertReturnAdd(Map<String, Object> data) {
		sqlSession.insert("so_return.insertReturnAdd", data);
	}
	
	
	//수정
	public void updateReturnAdd(Map<String, Object> data) {
		sqlSession.update("so_return.updateReturnAdd", data);
	}
	
	//회사 조회
	public List<Map<String, String>> getClient(String company_code) throws DataAccessException{
	    List<Map<String, String>> result = sqlSession.selectList("so_return.getClient", company_code);
	    System.out.println("Result from getClient: " + result);
	    return result;
	}
	
	//상태 확정
	public void conFirmStatus(String return_number, String company_code) throws DataAccessException{
	    Map<String, Object> params = new HashMap<>();
	    params.put("return_number", return_number);
	    params.put("company_code", company_code); 
		sqlSession.update("so_return.conFirmStatus", params);
    }
	
	//상태 저장
	public void cancelStatus(String return_number, String company_code) throws DataAccessException{
	    Map<String, Object> params = new HashMap<>();
	    params.put("return_number", return_number);
	    params.put("company_code", company_code); 
		sqlSession.update("so_return.cancelStatus", params);
    }

	//거래처코드로 반품현황조회
	public List<Map<String, Object>> getInfoByClient(String client_code, String company_code) {
	    Map<String, String> params = new HashMap<>();
	    params.put("client_code", client_code);
	    params.put("company_code", company_code);
	    System.out.println("params = "+params);
	    List<Map<String, Object>> result = sqlSession.selectList("so_return.getInfoByClient", params);
		return result;
	}
	
}
