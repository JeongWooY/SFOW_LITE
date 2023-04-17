package com.yeonoo.masterdata.wh.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yeonoo.masterdata.wh.domain.WH;
import com.yeonoo.masterdata.wh.domain.WH_detail;
import com.yeonoo.masterdata.wh.repository.WhRepositoryImpl;

@Service
public class WhServiceImpl implements WhService {

	@Autowired
	private WhRepositoryImpl whRepository; 
	
	@Override
	public List<WH> getWhAllList(String company_code) throws Exception{
		
		return whRepository.getWhAllList(company_code);
	}
	@Override
	public List<WH> searchWH(WH searchwh) throws Exception {
		
		return whRepository.getsearchWH(searchwh);
	}
	@Override
	public List<WH_detail> WHarea(String warehouse_code) throws Exception {
		
		return whRepository.WHarea(warehouse_code);
	}
	
	//수정하기 update(insert와같은버튼)
	@Override
	public int updateWH(WH wh) throws Exception {
		int cnt = whRepository.updateWH(wh);
		return cnt;
	}
	//insert 등록
	@Override
	@Transactional
	public int insertWH(WH elements) throws Exception{
		
		int cnt = whRepository.insertWH(elements);
		return cnt;
		
	}
	//체크된 행 삭제하기 (수정)
	public int deleteWH(WH wh) throws Exception {
		int cnt =whRepository.deleteWH(wh);
		return cnt;
	}
	//Area 구역 인서트 
	@Override
	@Transactional
	public int insertDetail(WH_detail elements) {
		
		int cnt = whRepository.insertDetail(elements);
		
		return cnt;
	}
	
	
}
