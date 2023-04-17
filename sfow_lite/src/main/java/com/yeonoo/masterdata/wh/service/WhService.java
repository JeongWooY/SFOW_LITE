package com.yeonoo.masterdata.wh.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.yeonoo.masterdata.wh.domain.WH;
import com.yeonoo.masterdata.wh.domain.WH_detail;

@Service
public interface WhService {

	
	
	//전체 목록 조회
	
		public List<WH> getWhAllList(String company_code) throws Exception;
	/*
		//insert
		public void insertwhService(WH wh) throws Exception;
	*/
		
	//수정 update

	public List<WH> searchWH(WH searchwh) throws Exception;

	public int updateWH(WH wh) throws Exception ;

	// 행 추가 등록하기 
	public int insertWH(WH elements) throws Exception ;

	public int deleteWH(WH wh) throws Exception;

	public List<WH_detail> WHarea(String warehouse_code) throws Exception ;

	public int insertDetail(WH_detail element);
		
	
	
}
