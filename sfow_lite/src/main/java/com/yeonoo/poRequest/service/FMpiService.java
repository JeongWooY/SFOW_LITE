package com.yeonoo.poRequest.service;

import java.util.List;
import com.yeonoo.poRequest.domain.FMpi;


public interface FMpiService {

	
	//전체 목록 조회(검색)
	public List<FMpi>  getFMpiAllList(FMpi fMpi) throws Exception;

	//수정하기
	public int updateFMpi(FMpi fMpi) throws Exception;
}