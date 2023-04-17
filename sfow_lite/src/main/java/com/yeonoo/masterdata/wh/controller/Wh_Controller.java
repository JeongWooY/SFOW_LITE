package com.yeonoo.masterdata.wh.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yeonoo.masterdata.wh.service.WhService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class Wh_Controller {
	
	@Autowired
	WhService whService;
		
		//창고폼 보여주기
		  @RequestMapping(method = {RequestMethod.GET,RequestMethod.POST}, value="/warehouse/whinfo")
		   public String whForm() {
		      
		      return "warehouse/whForm";
		   }
		   
			/*
			 * //area 보여주기
			 * 
			 * @PostMapping("/warehouse/whArea") public String getAreaList() throws
			 * Exception {
			 * 
			 * //전체 목록 조회
			 * 
			 * return "/warehouse/whForm"; }
			 */
		    
	    
	    
	   
	    
	    
	    
	    
	    
	    

	
	
}
