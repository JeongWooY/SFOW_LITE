package com.yeonoo.masterdata.item.service;

import java.util.List;

import com.yeonoo.masterdata.item.domain.ItemProduct;
import com.yeonoo.masterdata.item.domain.PriceDTO;
import com.yeonoo.masterdata.item.domain.SemiDTO;




public interface PriceService {

	// 전체 조회
	public List<PriceDTO> priceList(PriceDTO dto,String companyCode);
	
	// 등록
	public int insertPrice(PriceDTO elements,String companyCode);

	//  수정
	public int updatePrice(PriceDTO elements,String companyCode);

	//  삭제(상태업데이트)
	public int deletePrice(String itemCode,String companyCode);
	
	
	//거래처명 목록
	public List<PriceDTO> companycodeSelectAjax() throws Exception;
	//아이템코드 목록
	public List<PriceDTO> itemcodeSelectAjax() throws Exception;

}
