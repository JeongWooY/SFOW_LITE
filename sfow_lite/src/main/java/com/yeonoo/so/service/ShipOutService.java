package com.yeonoo.so.service;

import java.util.List;
import java.util.Map;

import com.yeonoo.so.domain.ShipOut;
import com.yeonoo.so.domain.ItemShipOutDTO;
import com.yeonoo.so.domain.LotShipOutDTO;
import com.yeonoo.so.domain.SearchDTO;

public interface ShipOutService {

	List<ShipOut> getList(SearchDTO searchDTO, String companyCode);
	
	List<Map<String, Object>> getModalItem();
	
	int deleteStatus(String outCode);
	
	int writeShipOut(ShipOut elements);
	
	List<ItemShipOutDTO> selectItem(String orderNumber);
	
	List<LotShipOutDTO> selectLot(String orderNumber);
	
	int statusUpdate(String outCode);
	
	int updateShipOut(ShipOut elements);
}
