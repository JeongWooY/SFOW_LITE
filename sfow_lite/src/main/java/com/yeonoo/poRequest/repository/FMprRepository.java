package com.yeonoo.poRequest.repository;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;


import com.yeonoo.poRequest.domain.FMpr;
import com.yeonoo.ppOrder.domain.PPOrder;

public interface FMprRepository {

	//전체 목록 조회
	public List<FMpr>  getFMprAllList(FMpr fMpr) throws DataAccessException;
	
	//수정하기
	public int updateFMpr(FMpr fMpr) throws DataAccessException;
	
	//등록하기
	public int insertFMpr(FMpr fMpr) throws DataAccessException;
}








