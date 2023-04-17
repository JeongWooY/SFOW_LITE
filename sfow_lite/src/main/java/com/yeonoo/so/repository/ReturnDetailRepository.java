package com.yeonoo.so.repository;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.yeonoo.so.domain.ReturnAdd;
import com.yeonoo.so.domain.ReturnDetail;

public interface ReturnDetailRepository {

	//선택한 행으로 세부항목 조회
	public List<ReturnDetail> getReturnDetail(String returnNumber) throws DataAccessException;
	
	//저장
	void insertDetailAdd(Map<String, Object> data);
	
	//수정
	void updateDetailAdd(Map<String, Object> data);
	
	//삭제
	void deleteReturnDetail(List<Integer> sorder);
	
	//아이템조회
	public List<Map<String, String>> getItem(String company_code);
	
	//확정조회
	public List<Map<String, Object>> getReturnInfo(String company_code);
	
	//클라이언트 코드로 조회
	public List<Map<String, Object>> getReturnInfoByClient(String company_code, String client_code) throws DataAccessException;
}
