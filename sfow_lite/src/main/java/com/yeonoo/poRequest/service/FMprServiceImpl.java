package com.yeonoo.poRequest.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yeonoo.poRequest.domain.FMpr;
import com.yeonoo.poRequest.repository.FMprRepository;
import com.yeonoo.ppOrder.domain.PPOrder;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class FMprServiceImpl implements FMprService{

	@Autowired
	FMprRepository fMprRepository;
	

	//전체 목록 조회(검색)
	@Override
	public List<FMpr> getFMprAllList(FMpr fMpr) throws Exception {
		return fMprRepository.getFMprAllList(fMpr);
	}
	
	// 등록하기
	@Override
	@Transactional
	public int insertFMpr(FMpr elements) throws Exception{
		 System.out.println("서비스 전"+elements);
		 int cnt = fMprRepository.insertFMpr(elements);
		 System.out.println("서비스 후"+elements);
		 return cnt;
		
	}

	//수정하기
	public int updateFMpr(FMpr fMpr) throws Exception{
		return fMprRepository.updateFMpr(fMpr);
	}

}
