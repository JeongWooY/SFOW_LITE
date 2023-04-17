package com.yeonoo.stock.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.sfow.basicinfo.domain.UserInfo;
import com.yeonoo.stock.domain.Stock;
import com.yeonoo.stock.service.StockByWhServiceImpl;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class StockByWhController {
	
	private final StockByWhServiceImpl stockService;
	//insert into user_info(u_number, u_name, u_id, u_pass, u_grade, u_tell, u_gender)
	//values(1, '관리자', 'adminid', '1234', 5, '01042485278', '남' );
	//insert into user_info(u_number, u_name, u_id, u_pass, u_grade, u_tell, u_gender)
	//values(2, '홍길동', 'hongid', '1234', 1, '01088521142', '남' );
	//User authUser = new User(1, "관리자", "adminid", "1234", 999, "01044859948", "남" );
	//User authUser = new User(2, "은하수", "eunid", "1234", 1, "01044859948", "남" );
	//User authUser = new User(2, "홍길동", "hongid", "1234", 1, "01088521142", "남" );
	//request.getSession().setAttribute("AUTHUSER", authUser); //원래 여기에 없는 코드. 추후 취합 시에 삭제 필요
    
    @RequestMapping(value="/stockByWh", method=RequestMethod.GET)
    public String stockSearch() {
    		
    	//return "stock/stockSearch";
    	
    	return "stock/stockByWhMain";
    	//return "stock/NewFile";
    }//stockSearch() 끝 8o

	@ResponseBody
	@RequestMapping(value="/searchAllStock", method=RequestMethod.POST )
	public  List<Stock> search(Model model, HttpSession request) throws Exception {

		
//	  UserInfo authUser = new UserInfo();
//	  request.getSession().setAttribute("AUTHUSER", authUser);
      
	  UserInfo user = (UserInfo)request.getAttribute("AUTHUSER");
      String company_code = user.getCompanyCode();
      System.out.println("컨트롤러 company_code !!!!넘기기전"+company_code);
	  List<Stock> results = stockService.searchAll(company_code);
      
      
      
      
      System.out.println("Controller results"+results);
      //model.addAttribute("results", results);

      return results;
      //return "stock/stockWhDetail";
      //return "stock/main";
  }//search() 끝

  //예상컨데 select해서 이미 한번 받은 데이터가  json형식이라 @RequestBody 어노테이션을 무조건 사용해야 하는듯 하다..
	//@RequestBody  //JSON -> Java Object
	//@ResponseBody  //Java Object -> JSON 
  @ResponseBody
  @RequestMapping(value="/updateStock", method=RequestMethod.PATCH)
  public void updateStock(Model model, @RequestBody Stock data) throws Exception {
  	System.out.println(data);
  	stockService.updateStock(data);
  	  //return a;
	  //return "";
  }
  
  @ResponseBody
  @RequestMapping(value="/searchWhStock", method=RequestMethod.POST)
  public List<Stock> searchWhStock(Model model, Stock data, HttpSession request) throws Exception {
//  public List<Stock> searchWhStock(Model model, 
//		  								@RequestParam String warehouse_code,
//		  								@RequestParam String warehouse_name,
//		  								@RequestParam String lot_no,
//		  								@RequestParam String item_type,
//		  								@RequestParam String item_code,
//		  								@RequestParam String item_name) throws Exception {
//	  Stock data = new Stock();
//	  data.setWarehouse_name(warehouse_name);
//	  data.setWarehouse_code(warehouse_code);
//	  data.setLot_no(lot_no);
//	  data.setItem_code(item_code);
//	  data.setItem_name(item_name);
//	  data.setItem_type(item_type);
//	  System.out.println("data값"+data);
	  
	  UserInfo user = (UserInfo)request.getAttribute("AUTHUSER");
      String company_code = user.getCompanyCode();
      System.out.println("검색 조회 컨트롤러!!!!"+company_code);
	  
	  List<Stock> results = stockService.searchWhStock(data, company_code);
	  
	  System.out.println("컨트롤러 리저트 값"+results);
	  
	  return results;
  }

  
  //창고코드, 창고이름 만 select해서 보여주는 List 하는 controller
  @ResponseBody
  @RequestMapping(value="/searchWhList", method=RequestMethod.POST)
  public List<Stock> searchWhList(Model model) throws Exception{
	  
	  List<Stock> results = stockService.searchWhList();
	  
	  
	  System.out.println("2가지 열의 결과"+results);
	  
	  return results;
  }
  
  //창고코드, 창고이름 만 select 하는 controller
  @ResponseBody
  @RequestMapping(value="/searchWh", method=RequestMethod.POST)
  public List<Stock> searchWh(Model model, Stock data) throws Exception{
	  
	  List<Stock> results = stockService.searchWh(data);
	  System.out.println("modal의 search data"+results);
	  
	  return results;
  }
  
    
}//stockController
	
	

