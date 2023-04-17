package com.yeonoo.sfow.ppPerform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.sfow.basicinfo.domain.UserInfo;
import com.yeonoo.sfow.ppPerform.domain.BOM;
import com.yeonoo.sfow.ppPerform.domain.Order;
import com.yeonoo.sfow.ppPerform.domain.Perform;
import com.yeonoo.sfow.ppPerform.service.PerformService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
public class PerformController {
		
	private final PerformService performService;
	
	//페이지로 이동
	@RequestMapping("/perform")
	public String StockByItem() {
		return "product/perform";
	
	}
		
	@RequestMapping("/selectOrder")
	@ResponseBody
	public List<Order> selectOrder(Order order, HttpSession com, HttpServletRequest request) {
		UserInfo user = (UserInfo) com.getAttribute("AUTHUSER");
		String comCode=user.getCompanyCode();
		order.setCompany_code(comCode);
		List<Order> result=performService.selectOrder(order);
		return result;
	}
	
	@PutMapping("/updateOrder")
	@ResponseBody
	public void updateOrder(@RequestBody Order order) {
		performService.updateOrder(order);
	}
	
	@GetMapping("/selectPerform")
	@ResponseBody
	public List<Perform> selectPerform(String pp_no,HttpSession com){
		UserInfo user = (UserInfo) com.getAttribute("AUTHUSER");
		String comCode=user.getCompanyCode();
		Perform perform = new Perform();
		
		perform.setCompany_code(comCode);
		perform.setPp_no(pp_no);
		System.out.println("pp_no"+pp_no);
		List<Perform> result=performService.selectPerform(perform);
		return result;
		
	}
	
	
	@PutMapping("/selectBOM")
	@ResponseBody
	public List<BOM> selectBOM(@RequestBody Perform perform,HttpSession com) {
		UserInfo user = (UserInfo) com.getAttribute("AUTHUSER");
		String comCode=user.getCompanyCode();
		perform.setCompany_code(comCode);
		List<BOM> bom=performService.selectBOM(perform);
		return bom;
	}
	
	@GetMapping("/insertPerform")
	@ResponseBody
	public Map<String, Object> insertPerform(Perform perform,HttpSession com) {
		UserInfo user = (UserInfo) com.getAttribute("AUTHUSER");
		String comCode=user.getCompanyCode();
		
		perform.setCompany_code(comCode);
		
		Boolean isSuccess=performService.insetPerform(perform);
		int sum=performService.selectQty(perform.getPp_no());
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		    if(isSuccess) {
		    	resultMap.put("result", "success");
		    } else {
		        resultMap.put("result", "failure");
		    }
		    
		return resultMap;
	}
	
	@GetMapping("/selectWorker")
	@ResponseBody
	public List<Perform> selectWorker(Perform worker,HttpSession com) {
		UserInfo user = (UserInfo) com.getAttribute("AUTHUSER");
		String comCode=user.getCompanyCode();
		
		worker.setCompany_code(comCode);
		
		
		List<Perform> workers=performService.selectWorker(worker);
		
		return workers;
	}
	
	@PutMapping("/deletePerform")
	@ResponseBody
	public Map<String, Object> deletePerform(@RequestBody Perform perform,HttpSession com) {
		UserInfo user = (UserInfo) com.getAttribute("AUTHUSER");
		String comCode=user.getCompanyCode();
		perform.setCompany_code(comCode);
		Boolean isSuccess= performService.deletePerform(perform);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
	    if(isSuccess) {
	    	resultMap.put("result", "success");
	    } else {
	        resultMap.put("result", "failure");
	    }
		return resultMap;
	}
	
	
	
}