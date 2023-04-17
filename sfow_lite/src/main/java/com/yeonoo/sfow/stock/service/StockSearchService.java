package com.yeonoo.sfow.stock.service;

import java.util.List;

import com.yeonoo.sfow.stock.domain.Stock;

public interface StockSearchService {
	public List<Stock> search(Stock search);
	public void updateStock(Stock stock);
	public List<Stock> search2(Stock search2);
}
