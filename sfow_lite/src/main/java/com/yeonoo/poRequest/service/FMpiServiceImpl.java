package com.yeonoo.poRequest.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.yeonoo.poRequest.domain.FMpi;
import com.yeonoo.poRequest.repository.FMpiRepository;


@Service
public class FMpiServiceImpl implements FMpiService{

	@Autowired
	FMpiRepository fMpiRepository;
	

	//전체 목록 조회
	@Override
	public List<FMpi> getFMpiAllList(FMpi fMpi) throws Exception {
		return fMpiRepository.getFMpiAllList(fMpi);
	}

	//수정하기
	public int updateFMpi(FMpi fMpi) throws Exception{
		return fMpiRepository.updateFMpi(fMpi);
	}

}
