package com.yeonoo.so.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.so.domain.ShipOut;
import com.yeonoo.sfow.basicinfo.domain.UserInfo;
import com.yeonoo.so.domain.ItemShipOutDTO;
import com.yeonoo.so.domain.LotShipOutDTO;
import com.yeonoo.so.domain.SearchDTO;
import com.yeonoo.so.service.ShipOutService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/shipout/")
@RequiredArgsConstructor
public class ShipOutController {

	private final ShipOutService shipOutService;
	private final Logger logger = LoggerFactory.getLogger(ShipOutController.class);
	
	// 메인화면
	@RequestMapping(value="main")
	public String main() {
		
		return "so/shipOutMain";
	}
	
	// modal Item창
	@RequestMapping(value="modalItem")
	public String modalItem() {
		
		return "so/modalItem";
	}
	
	// modal Item값 조회
	@RequestMapping(value="getModalItem")
	@ResponseBody
	public List<Map<String, Object>> getModalItem() {
		
		List<Map<String, Object>> result = shipOutService.getModalItem();
		
		return result;
	}

	// 전체조회
	@ResponseBody
	@RequestMapping(value="list", method=RequestMethod.POST)
	public List<ShipOut> getList(@RequestBody SearchDTO searchDTO, HttpSession session) {
		
		System.out.println("검색할 단어 DTO = " + searchDTO);
		
		UserInfo user = (UserInfo) session.getAttribute("AUTHUSER");
		String companyCode = user.getCompanyCode();
		System.out.println("로그인유저의 companyCode = " + companyCode);
		
		List<ShipOut> shipOutList = shipOutService.getList(searchDTO, companyCode);
		System.out.println("조회한 shipOutList = " + shipOutList);
		
		return shipOutList;
	}
	
	// 출하정보 삭제(삭제여부 상태 업데이트됨)
	@ResponseBody
	@RequestMapping(value="deleteShipOut", method=RequestMethod.PUT)
	public int deleteStatus(@RequestBody List<ShipOut> shipout) {

		Iterator<ShipOut> iterator = shipout.iterator();
		int updateCnt = 0;
		
		while(iterator.hasNext()) {
			ShipOut elements = iterator.next();
			updateCnt = shipOutService.deleteStatus(elements.getOutCode());			
		}
		
		return updateCnt;
	}

	// 등록
	@ResponseBody
	@RequestMapping(value="write", method=RequestMethod.POST)
	public List<ShipOut> shipOutWrite(@RequestBody List<ShipOut> shipout, HttpSession session) {

		UserInfo userInfo = (UserInfo) session.getAttribute("AUTHUSER");
		String userId = userInfo.getId();
		
		Iterator<ShipOut> iterator = shipout.iterator();
		
		while(iterator.hasNext()) {
			ShipOut elements = iterator.next();
			elements.setCreateUser(userId);
			
			int writeCnt = shipOutService.writeShipOut(elements);
			logger.info("등록된 row개수 : " + writeCnt);
		}
		
		return shipout;
	}
	
	// 특정 수주번호에 있는 ITEM 정보조회
	@ResponseBody
	@RequestMapping(value="selectItems", method=RequestMethod.POST)
	public List<ItemShipOutDTO> selectItem(@RequestBody List<ShipOut> shipOutList) {	
		
		List<ItemShipOutDTO> itemShipOutList = new ArrayList<ItemShipOutDTO>();
		Iterator<ShipOut> iterator = shipOutList.iterator();
		
		while(iterator.hasNext()) {
			ShipOut elements = iterator.next();
			
			List<ItemShipOutDTO> itemShipOut = shipOutService.selectItem(elements.getOrderNumber());
			
			Iterator<ItemShipOutDTO> iterator2 = itemShipOut.iterator();
			
			while(iterator2.hasNext()) {
				ItemShipOutDTO itemElements = iterator2.next();
				
				itemShipOutList.add(itemElements);
			}	
		}
		
		return itemShipOutList; 
	}

	// 특정 수주번호에 있는 ITEM 코드의 LOT 정보조회
	@ResponseBody
	@RequestMapping(value="selectLots", method=RequestMethod.POST)
	public List<LotShipOutDTO> selectLot(@RequestBody List<ShipOut> shipOutList) {	
		
		List<LotShipOutDTO> lotShipOutList = new ArrayList<LotShipOutDTO>();
		Iterator<ShipOut> iterator = shipOutList.iterator();
		
		while(iterator.hasNext()) {
			ShipOut elements = iterator.next();

			List<LotShipOutDTO> lotShipOut = shipOutService.selectLot(elements.getOrderNumber());
			
			Iterator<LotShipOutDTO> iterator2 = lotShipOut.iterator();
			
			while(iterator2.hasNext()) {
				LotShipOutDTO itemElements = iterator2.next();
				
				lotShipOutList.add(itemElements);
			}
		}
		
		return lotShipOutList; 
	}

	// 상태 변경
	@ResponseBody
	@RequestMapping(value="statusUpdate", method=RequestMethod.PUT)
	public int statusUpdate(@RequestBody List<ShipOut> shipout) {

		logger.info("선택한 shipout 정보 = " + shipout);
		
		Iterator<ShipOut> iterator = shipout.iterator();
		int statuseCnt = 0;
		
		while(iterator.hasNext()) {
			ShipOut elements = iterator.next();
			logger.info("하나의 ShipOut 객체정보 = " + elements + ",  그리고 출하번호 = " + elements.getOutCode());	
			statuseCnt = shipOutService.statusUpdate(elements.getOutCode());
		}
		
		return statuseCnt;
	}

	// 출하정보 수정
	@ResponseBody
	@RequestMapping(value="updateShipOut", method=RequestMethod.PATCH)
	public int updateShipOut(@RequestBody List<ShipOut> shipout, HttpSession session) {

		UserInfo userInfo = (UserInfo) session.getAttribute("AUTHUSER");
		String userId = userInfo.getId();
		
		Iterator<ShipOut> iterator = shipout.iterator();
		int updateCnt = 0;
		
		while(iterator.hasNext()) {
			ShipOut elements = iterator.next();
			
			elements.setUpdateUser(userId);
			
			updateCnt = shipOutService.updateShipOut(elements);
		}
		
		return updateCnt;
	}
}
