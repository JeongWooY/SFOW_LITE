package com.yeonoo.stock.service;

import java.util.List;

import com.yeonoo.stock.domain.Stock;

public interface StockByItemService {

	//그리드 조회
	public List<Stock> stockByItemSearch(String companyCode); 
	
	//검색어조회
	public List<Stock> stockByItemSearchByKeyword(Stock stock, String companyCode);
	
	//그리드 수정
	/*public void stockByItemUpdate(Stock stock);*/
}
