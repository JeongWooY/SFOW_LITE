package com.yeonoo.masterdata.wh.repository;

import java.util.List;


import org.springframework.dao.DataAccessException;

import com.yeonoo.masterdata.wh.domain.WH;
import com.yeonoo.masterdata.wh.domain.WH_detail;


public interface WhRepository {

	//전체목록 가져오기
	public List<WH> getWhAllList(String company_code) throws DataAccessException;

	//수정하기
	public int updateWH(WH wh) throws DataAccessException;
	
	//구역 정보 가져오기
	public List<WH_detail> WHarea(String warehouse_code) throws DataAccessException;

	//새로운 데이터 입력하기 
	public int insertWH(WH elements) throws DataAccessException ;

	
}
