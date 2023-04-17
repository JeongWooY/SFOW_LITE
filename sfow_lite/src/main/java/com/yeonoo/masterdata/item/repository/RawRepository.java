package com.yeonoo.masterdata.item.repository;

import java.util.List;
import java.util.Map;

import com.yeonoo.masterdata.item.domain.RawDTO;

public interface RawRepository {

	
	// 전체 조회
	public List<RawDTO> rawList(RawDTO dto, String companyCode);

	// 반제품 등록
	public int insertRaw(RawDTO dto, String companyCode);
	 
	// 반제품 정보 수정
	public int updateRaw(RawDTO dto, String companyCode);
	
	// 반제품 삭제
	public int deleteRaw(String itemCode, String companyCode);
	
	// --------------Modal -----------------
	
	//거래처 모달 데이터처리
	public List<Map<String, Object>> getModalClient();

	// 유형 모달 데이터처리
	public List<Map<String, Object>> getModalType();

	// 규격 모달 데이터처리
	public List<Map<String, Object>> getModalSpecification();
	
	// 재고단위 모달 데이터처리
	public List<Map<String, Object>> getModalStockUnit();
	
}
