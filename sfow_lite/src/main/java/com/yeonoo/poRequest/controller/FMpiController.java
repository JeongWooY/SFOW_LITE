package com.yeonoo.poRequest.controller;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.poRequest.domain.FMpi;
import com.yeonoo.poRequest.domain.FMpr;
import com.yeonoo.poRequest.service.FMpiService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequiredArgsConstructor
public class FMpiController  {

	private static final Logger logger = LoggerFactory.getLogger(FMpiController.class);
	
	@Autowired
	FMpiService fMpiService;
	
	   
	   @RequestMapping("/hi") //url주소고
	   public String stock() {
	      
	      return "/fieldmode/FMpi";//보여주고싶은 jsp페이지
	   }

	//화면목록페이지
	@GetMapping("/FMpi")
	@ResponseBody
	public List<FMpi> list(
			 @RequestParam(required = false) String in_number,
	         @RequestParam(required = false) String item_code,
	         @RequestParam(required = false) String in_date,
	         @RequestParam(required = false) String warehouse_code
			
			
			) throws Exception {
		FMpi fMpi = new FMpi();
		fMpi.setIn_number(in_number);
		fMpi.setItem_code(item_code);
		fMpi.setIn_date(in_date);
		fMpi.setWarehouse_code(warehouse_code);
		
		//전체목록조회
		List<FMpi> list = fMpiService.getFMpiAllList(fMpi);
		
	
		//4.View
		return list;
	}
	
	//수정하기
	  @ResponseBody
	  @RequestMapping(value="/updateFMpi", method=RequestMethod.PUT)
	  public void updateFMpi(@RequestBody FMpi data) throws Exception {
	     System.out.println(data);
	     fMpiService.updateFMpi(data);

	  }
	

}//입력처리 끝
	

	
	
    
    











