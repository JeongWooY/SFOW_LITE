package com.yeonoo.masterdata.item.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.yeonoo.masterdata.item.domain.ItemProduct;
import com.yeonoo.masterdata.item.domain.PriceDTO;
import com.yeonoo.masterdata.item.domain.SemiDTO;

public interface PriceRepository {

	
	// 전체 조회
	public List<PriceDTO> priceList(PriceDTO dto, String companyCode);
	
	//  등록
	public int insertPrice(PriceDTO price, String companyCode);
		
	//  수정
	public int updatePrice(PriceDTO elements, String companyCode);
		
	//  삭제(상태업데이트)
	public int deletePrice(String itemCode, String companyCode);
	
	
	//거래처명 목록
	public List<PriceDTO> companycodeSelectAjax() throws DataAccessException;
	//아이템코드 목록
	public List<PriceDTO> itemcodeSelectAjax() throws DataAccessException;
	
	

}
