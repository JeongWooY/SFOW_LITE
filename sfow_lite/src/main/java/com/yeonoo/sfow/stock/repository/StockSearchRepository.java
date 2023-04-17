package com.yeonoo.sfow.stock.repository;

import java.util.List;

import com.yeonoo.sfow.stock.domain.Stock;

public interface StockSearchRepository {
	
	public List<Stock> search(Stock search);
	public List<Stock> search2(Stock stock);
	public void updateStock(Stock itemName);
}
