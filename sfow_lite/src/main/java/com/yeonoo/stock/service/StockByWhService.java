package com.yeonoo.stock.service;

import java.util.List;

import com.yeonoo.sfow.basicinfo.domain.UserInfo;
import com.yeonoo.stock.domain.Stock;

public interface StockByWhService {
	
	public List<Stock> searchAll(String company_code) throws Exception;
		
	public void updateStock(Stock data) throws Exception;

	public List<Stock> searchWhStock(Stock data, String company_code)  throws Exception;

	public List<Stock> searchWhList() throws Exception;
	
	public List<Stock> searchWh(Stock data) throws Exception;
}
