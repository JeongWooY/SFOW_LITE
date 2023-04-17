package com.yeonoo.poRequest.repository;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;


import com.yeonoo.poRequest.domain.FMpi;
import com.yeonoo.poRequest.domain.FMpr;


public interface FMpiRepository {

	//전체 목록 조회
	public List<FMpi>  getFMpiAllList(FMpi fMpi) throws DataAccessException;
	
	//수정하기
	public int updateFMpi(FMpi fMpi) throws DataAccessException;
}








