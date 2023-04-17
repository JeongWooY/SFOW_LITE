package com.yeonoo.so.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yeonoo.so.controller.ShipOutController;
import com.yeonoo.so.domain.ShipOut;
import com.yeonoo.so.domain.ItemShipOutDTO;
import com.yeonoo.so.domain.LotShipOutDTO;
import com.yeonoo.so.domain.SearchDTO;
import com.yeonoo.so.repository.ShipOutRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ShipOutServiceImpl implements ShipOutService {

	private final ShipOutRepository shipOutRepository;
	private final Logger logger = LoggerFactory.getLogger(ShipOutServiceImpl.class);
	
	// 전체조회
	@Override
	public List<ShipOut> getList(SearchDTO searchDTO, String companyCode) {	

		return shipOutRepository.getList(searchDTO, companyCode);
	}

	// Modal Item조회
	@Override
	public List<Map<String, Object>> getModalItem() {
		
		return shipOutRepository.getModalItem();
	}
	
	// 삭제여부 상태변경
	@Override
	@Transactional
	public int deleteStatus(String outCode) {
		
		return shipOutRepository.deleteStatus(outCode);
	}

	// 등록
	@Override
	@Transactional
	public int writeShipOut(ShipOut elements) {
		
		return shipOutRepository.writeShipOut(elements);
	}

	// 특정 수주번호에 있는 ITEM 정보조회
	@Override
	public List<ItemShipOutDTO> selectItem(String orderNumber) {
		
		return shipOutRepository.selectItem(orderNumber);
	}

	// 특정 수주번호에 있는 ITEM 코드의 LOT 정보조회
	@Override
	public List<LotShipOutDTO> selectLot(String orderNumber) {
		
		return shipOutRepository.selectLot(orderNumber);
	}

	// 상태 변경
	@Override
	@Transactional
	public int statusUpdate(String outCode) {
		
		return shipOutRepository.statusUpdate(outCode);
	}
	
	// 출하정보 수정
	@Override
	@Transactional
	public int updateShipOut(ShipOut elements) {
		
		return shipOutRepository.updateShipOut(elements);
	}
}
