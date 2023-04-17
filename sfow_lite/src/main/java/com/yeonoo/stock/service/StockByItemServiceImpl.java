package com.yeonoo.stock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeonoo.stock.domain.Stock;
import com.yeonoo.stock.repository.StockByItemRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StockByItemServiceImpl implements StockByItemService{
	
	@Autowired
    private StockByItemRepository stockByItemRepository;
	
	//그리드 조회
	public List<Stock> stockByItemSearch(String companyCode) {
		return stockByItemRepository.stockByItemSearch(companyCode);
	}
	
	//검색어조회
	public List<Stock> stockByItemSearchByKeyword(Stock stock, String companyCode){
		List<Stock> result =  stockByItemRepository.stockByItemSearchByKeyword(stock,companyCode);
		return result;
	}
	
	//그리드 수정
	/*public void stockByItemUpdate(Stock stock) {
		stockByItemRepository.stockByItemUpdate(stock);
	}
	*/
}
