package com.yeonoo.ppOrder.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yeonoo.ppOrder.domain.PPOrder;
import com.yeonoo.ppOrder.repository.PPOrderRepository;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class PPOrderServiceImpl implements PPOrderService{

	@Autowired
	PPOrderRepository ppOrderRepository;
	

	//전체 목록 조회(검색)
	@Override
	public List<PPOrder> getPPOrderAllList(PPOrder ppOrder) throws Exception {
		return ppOrderRepository.getPPOrderAllList(ppOrder);
	}

	// 등록하기
	@Override
	@Transactional
	public int insertPPOrder(PPOrder elements) throws Exception{
		 System.out.println("서비스 전"+elements);
		 int cnt = ppOrderRepository.insertPPOrder(elements);
		 System.out.println("서비스 후"+elements);
		 return cnt;
		
	}
	
	//수정하기
	public int updatePPOrder(PPOrder ppOrder) throws Exception{
		System.out.println("서비스 전"+ppOrder);
		int cnt = ppOrderRepository.updatePPOrder(ppOrder);
		System.out.println("서비스 후"+cnt);
		return cnt;
	}
	
	//삭제하기
	 @Override
	 @Transactional
	public int deletePPOrder(String ppOrder) throws Exception{
		System.out.println("서비스 전"+ppOrder);
		int cnt = ppOrderRepository.deletePPOrder(ppOrder);
		System.out.println("서비스 후"+cnt);
		return cnt;
	}


}
