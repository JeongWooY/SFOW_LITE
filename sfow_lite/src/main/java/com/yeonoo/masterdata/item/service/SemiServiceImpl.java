package com.yeonoo.masterdata.item.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yeonoo.masterdata.item.domain.ItemType;
import com.yeonoo.masterdata.item.domain.SemiDTO;
import com.yeonoo.masterdata.item.repository.SemiRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class SemiServiceImpl implements SemiService{

	
	@Autowired
	SemiRepository semiRepository;
	
	// 조회하기
	@Override
	public List<SemiDTO> semiList( SemiDTO dto, String companyCode) {
		return semiRepository.semiList(dto,companyCode);
	}
	
	// 등록하기
	@Override
	@Transactional
	public int insertSemi(SemiDTO elements , String companyCode) {
		System.out.println(elements);
		return semiRepository.insertSemi(elements ,companyCode);
	}
	
	//수정하기
	@Override
	@Transactional
	public int updateSemi(SemiDTO elements , String companyCode) {
		return semiRepository.updateSemi(elements ,companyCode);
		 
		 

	}
	
	// 삭제하기(상태업데이트)
	@Override
	@Transactional
	public int deleteSemi(String itemCode , String companyCode) {
		return semiRepository.deleteSemi(itemCode ,companyCode);
	}

	// 거래처 모달 데이터처리
	@Override
	public List<Map<String, Object>> getModalClient() {
		return semiRepository.getModalClient();
	}

	//품목유형등록(제품) 목록
	public List<ItemType> selectItemTypeList() throws Exception {
		List<ItemType> itemtype = semiRepository.selectItemTypeList();
		return itemtype;
	}

	//품목유형등록(제품) 검색
	public List<ItemType> typeSelectSearchAjax(ItemType itemtype) throws Exception {
		List<ItemType> itemtypeselectsearch = semiRepository.typeSelectSearchAjax(itemtype);
		return itemtypeselectsearch;
	}

}
