package com.yeonoo.ppOrder.repository;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;


import com.yeonoo.ppOrder.domain.PPOrder;

public interface PPOrderRepository {

	//전체 목록 조회
	public List<PPOrder>  getPPOrderAllList(PPOrder ppOrder) throws DataAccessException;
	
	//작업지시 등록
	public int insertPPOrder(PPOrder ppOrder) throws DataAccessException;
	
	//수정하기
	public int updatePPOrder(PPOrder ppOrder) throws DataAccessException;
	
	//삭제하기(업데이트버전)
	public int deletePPOrder(String ppOrder) throws DataAccessException;
	
}








