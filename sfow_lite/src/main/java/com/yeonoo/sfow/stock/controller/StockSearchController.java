package com.yeonoo.sfow.stock.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yeonoo.sfow.stock.domain.Stock;
import com.yeonoo.sfow.stock.service.StockSearchServiceImpl;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class StockSearchController {
	

	private final StockSearchServiceImpl stockSearchService;
	
	@GetMapping("/test2")
	public String testFull() {
	    
	    return "/stock/test2";
	}
	
	
	//기본 페이지 불러오기
	@GetMapping("/stockSearch")
	public String stockSearch(Model model) {
	System.out.println("의정이 바보똥개 컨트롤러 성공");
	model.addAttribute("data", "This is some data.");
		return "stock/stockSearch";
	}
	
	
	//네가지 키워드 검색
    @GetMapping("/search")
    @ResponseBody
    public List<Stock> search(Model model,Stock search){
    	List<Stock> results = stockSearchService.search(search);
        return results;
    }//search() 끝
    
    
    @GetMapping("/search2")
    @ResponseBody
    public List<Stock> search2(Model model,Stock search2){
    	System.out.println("search2"+search2);
    	List<Stock> results = stockSearchService.search2(search2);
        return results;
    }//search() 끝
    
    
    
    //재고수정
    @PutMapping("/updateStock")
    @ResponseBody
    public void updateStock(@RequestBody Stock rowData) {
    	System.out.println("행데이타"+rowData);
    	stockSearchService.updateStock(rowData);
   
    }
    
    

   
    
    
    
}//stockSearchController
	
	

