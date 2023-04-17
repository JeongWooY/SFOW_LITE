package com.yeonoo.so.repository;


import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import com.yeonoo.so.domain.ShipOut;
import com.yeonoo.so.domain.ItemShipOutDTO;
import com.yeonoo.so.domain.LotShipOutDTO;
import com.yeonoo.so.domain.SearchDTO;
import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class ShipOutRepositoryImpl implements ShipOutRepository {

	private final SqlSession sqlSession;
	private final Logger logger = LoggerFactory.getLogger(ShipOutRepositoryImpl.class);
	
	// 전체조회
	@Override
	public List<ShipOut> getList(SearchDTO searchDTO, String companyCode) {	

		Map<String, Object> map = new HashedMap();
		map.put("searchDTO", searchDTO);
		map.put("companyCode", companyCode);
		System.out.println("map 정보 = " + map.toString());
		
		return sqlSession.selectList("mapper.shipout.getList", map);
	}

	// Modal Item조회
	@Override
	public List<Map<String, Object>> getModalItem() {
		
		return sqlSession.selectList("mapper.shipout.getModalItem");
	}
	
	// 삭제여부 상태변경
	@Override
	public int deleteStatus(String outCode) {
		
		return sqlSession.update("mapper.shipout.deleteStatus", outCode);
	}

	// 등록
	@Override
	public int writeShipOut(ShipOut elements) {

		return sqlSession.update("mapper.shipout.writeShipout", elements);
	}

	// 특정 수주번호에 있는 ITEM 정보조회
	@Override
	public List<ItemShipOutDTO> selectItem(String orderNumber) {
		
		return sqlSession.selectList("mapper.shipout.getOrderNumber", orderNumber);
	}

	// 특정 수주번호에 있는 ITEM 코드의 LOT 정보조회
	@Override
	public List<LotShipOutDTO> selectLot(String orderNumber) {
		
		return sqlSession.selectList("mapper.shipout.getLot", orderNumber);
	}

	// 상태 변경
	@Override
	public int statusUpdate(String outCode) {
		logger.info("출하번호 = " + outCode);
		return sqlSession.update("mapper.shipout.statusUpdate", outCode);
	}

	// 출하정보 수정
	@Override
	public int updateShipOut(ShipOut elements) {
		
		return sqlSession.update("mapper.shipout.updateShipOut", elements);
	}

}
