package com.yeonoo.poRequest.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.yeonoo.poRequest.model.ReqDetailVO;
import com.yeonoo.poRequest.model.ReqModalVO;
import com.yeonoo.poRequest.model.ReqVO;
import com.yeonoo.poRequest.repository.ReqRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReqServiceImpl implements ReqService{
	
	private final ReqRepository reqRepository;
	
	@Override
	public List<ReqVO> reqOrder(ReqVO reqVO,String company_code) throws Exception {
		return reqRepository.reqOrder(reqVO,company_code);
	}
	
	@Override
	public List<ReqModalVO> reqOrder1(ReqModalVO reqModalVO,String company_code) throws Exception {
		return reqRepository.reqOrder1(reqModalVO,company_code);
	}

	@Override
	public List<ReqDetailVO> reqOrderDetail(String request_number) throws Exception {
		return reqRepository.reqOrderDetail(request_number);
	}

	@Override
	public int reqUpdate(ReqVO reqVO) throws Exception {
		return reqRepository.reqUpdate(reqVO);
	}

	@Override
	public void reqDel(String request_number) throws Exception {
		reqRepository.reqDel(request_number);
	}

	@Override
	public int reqDetailUpdate(ReqDetailVO reqDetailVO) throws Exception {
		return reqRepository.reqDetailUpdate(reqDetailVO);
	}

	@Override
	public void reqInsert(ReqVO req) throws Exception {
		System.out.println("insert serv");
		reqRepository.reqInsert(req);
		
	}

	@Override
	public void reqDetailInsert(ReqDetailVO reqD) throws Exception {
		System.out.println("insert serv ReqD");
		reqRepository.reqDetailInsert(reqD);
	}

	@Override
	public List<ReqDetailVO> reqItem(ReqDetailVO reqDetailVO,String company_code) throws Exception {
		System.out.println("reqItem 서비스");
		return reqRepository.reqItem(reqDetailVO,company_code);
	}



}
