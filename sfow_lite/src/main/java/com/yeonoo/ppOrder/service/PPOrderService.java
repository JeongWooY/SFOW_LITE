package com.yeonoo.ppOrder.service;

import java.util.List;


import com.yeonoo.ppOrder.domain.PPOrder;


public interface PPOrderService {

	
	//전체 목록 조회(검색)
	public List<PPOrder>  getPPOrderAllList(PPOrder ppOrder) throws Exception;
	
	//등록하기
	public int insertPPOrder(PPOrder elements)throws Exception;

	//수정하기
	public int updatePPOrder(PPOrder ppOrder) throws Exception;
	
	//삭제하기
	public int deletePPOrder(String ppOrder) throws Exception;
	
}

