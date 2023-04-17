package com.yeonoo.masterdata.item.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yeonoo.masterdata.item.domain.PriceDTO;
import com.yeonoo.masterdata.item.domain.PriceDTO;
import com.yeonoo.masterdata.item.repository.PriceRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class PriceServiceImpl implements PriceService{

	
	@Autowired
	PriceRepository priceRepository;
	
	// 조회하기
	@Override
	public List<PriceDTO> priceList( PriceDTO dto, String companyCode) {
		return priceRepository.priceList(dto,companyCode);
	}
	
	// 등록하기
		@Override
		@Transactional
		public int insertPrice(PriceDTO elements , String companyCode) {
			
			return priceRepository.insertPrice(elements ,companyCode);
		}
		
		//수정하기
		@Override
		@Transactional
		public int updatePrice(PriceDTO elements , String companyCode) {
			return priceRepository.updatePrice(elements ,companyCode);
			 
			 

		}
		
		// 삭제하기(상태업데이트)
		@Override
		@Transactional
		public int deletePrice(String itemCode , String companyCode) {
			return priceRepository.deletePrice(itemCode ,companyCode);
		}
	
	
	
	
	
	
	
	//거래처명 목록
	public List<PriceDTO> companycodeSelectAjax() throws Exception {
		List<PriceDTO> companycodelist = priceRepository.companycodeSelectAjax();
		return companycodelist;
	}
	//아이템코드 목록
	public List<PriceDTO> itemcodeSelectAjax() throws Exception {
		List<PriceDTO> itemcodelist = priceRepository.itemcodeSelectAjax();
		return itemcodelist;
	}

}
