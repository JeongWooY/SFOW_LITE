package com.yeonoo.so.repository;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.yeonoo.so.domain.ReturnAdd;

public interface ReturnAddRepository {

	//전체 반품조회
	public List<ReturnAdd> getReturnAdd(String company_code) throws DataAccessException;
	
	//날짜로 반품조회
	public List<ReturnAdd> getReturnAddByDate(String return_date, String company_code) throws DataAccessException;

	//삭제
	public void deleteByReturnNumber(String returnNumber) throws DataAccessException;
	
	//저장
	void insertReturnAdd(Map<String, Object> data);
	
	
	//수정
	void updateReturnAdd(Map<String, Object> data);
	
	//회사 조회
	public List<Map<String, String>> getClient(String company_code) throws DataAccessException;
	
	//상태 확정
	public void conFirmStatus(String return_number, String company_code) throws DataAccessException;
	
	//상태 저장
	public void cancelStatus(String return_number, String company_code) throws DataAccessException;

	public List<Map<String, Object>> getInfoByClient(String client_code, String company_code);
}
