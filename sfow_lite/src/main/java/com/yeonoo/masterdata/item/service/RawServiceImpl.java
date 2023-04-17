package com.yeonoo.masterdata.item.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yeonoo.masterdata.item.domain.RawDTO;
import com.yeonoo.masterdata.item.repository.RawRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class RawServiceImpl implements RawService{

	
	@Autowired
	RawRepository rawRepository;
	
	// 조회하기
	@Override
	public List<RawDTO> rawList(RawDTO dto, String companyCode) {
		return rawRepository.rawList(dto,companyCode);
	}
	
	// 등록하기
	@Override
	@Transactional
	public int insertRaw(RawDTO elements, String companyCode) {
		return rawRepository.insertRaw(elements,companyCode);
	}
	
	//수정하기
	@Override
	@Transactional
	public int updateRaw(RawDTO dto, String companyCode) {
		return rawRepository.updateRaw(dto,companyCode);
		 
		 

	}
	//삭제하기
	@Override
	@Transactional
	public int deleteRaw(String itemCode, String companyCode) {
		return rawRepository.deleteRaw(itemCode,companyCode);
	}
	
	// 거래처 모달 데이터처리
	@Override
	public List<Map<String, Object>> getModalClient() {
		return rawRepository.getModalClient();
	}
	
	// 유형 모달 데이터처리
	@Override
	public List<Map<String, Object>> getModalType() {
		return rawRepository.getModalType();
	}
	
	// 규격 모달 데이터처리
	@Override
	public List<Map<String, Object>> getModalSpecification() {
		return rawRepository.getModalSpecification();
	}

	// 재고단위 모달 데이터처리
	@Override
	public List<Map<String, Object>> getModalStockUnit() {
		return rawRepository.getModalStockUnit();
	}
}
