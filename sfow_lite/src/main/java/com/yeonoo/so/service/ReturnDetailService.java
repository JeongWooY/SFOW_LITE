package com.yeonoo.so.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.yeonoo.so.domain.ReturnDetail;

public interface ReturnDetailService {

	//입고번호로 세부항목 조회
	public List<ReturnDetail> getReturnDetail(String returnNumber) throws Exception;
	
    //저장
    void insertDetailAdd(List<Map<String, Object>> createRows) throws Exception;
    
    //수정
    void updateDetailAdd(List<Map<String, Object>> updateRows) throws Exception;
	
    //삭제
    void deleteReturnDetail(List<Integer> sorder);
    
    //아이템조회
    public List<Map<String, String>> getItem(String company_code) throws Exception;
    
    //확정조회
    public List<Map<String, Object>> getReturnInfo(String company_code) throws Exception;
    
    //클라이언트 코드로 조회
    public List<Map<String, Object>> getReturnInfoByClient(String company_code, String client_code) throws Exception;
}
