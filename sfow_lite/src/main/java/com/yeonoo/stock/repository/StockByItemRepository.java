package com.yeonoo.stock.repository;

import java.util.List;

import com.yeonoo.stock.domain.Stock;

public interface StockByItemRepository {

	//그리드 조회
	public List<Stock> stockByItemSearch(String companyCode); 
	
	//검색어조회
	public List<Stock> stockByItemSearchByKeyword(Stock stock, String companyCode);
	
	//그리드 수정
	/*public void stockByItemUpdate(Stock stock);*/
}
