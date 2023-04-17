package com.yeonoo.poRequest.service;

import java.util.List;


import com.yeonoo.poRequest.domain.FMpr;
import com.yeonoo.ppOrder.domain.PPOrder;


public interface FMprService {

	
	//전체 목록 조회(검색)
	public List<FMpr>  getFMprAllList(FMpr fMpr) throws Exception;
	
	//등록하기
	public int insertFMpr(FMpr elements)throws Exception;

	//수정하기
	public int updateFMpr(FMpr fMpr) throws Exception;
}

