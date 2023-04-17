package com.yeonoo.stock.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.yeonoo.sfow.basicinfo.domain.UserInfo;
import com.yeonoo.stock.domain.Stock;
import com.yeonoo.stock.repository.StockByWhRepositoryImpl;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StockByWhServiceImpl implements StockByWhService {

    private final StockByWhRepositoryImpl stockRepository;

    @Override
    public List<Stock> searchAll(String company_code) throws Exception{
    	List<Stock> result =  stockRepository.searchAll(company_code);
    	
        //return stockRepository.search();
    	System.out.println("Service result"+result);
        return result;
    }
    
    @Override
	public void updateStock(Stock data) throws Exception{
		stockRepository.updateStock(data);
		
	}
    
    @Override
	public List<Stock> searchWhStock(Stock data, String company_code) throws Exception{
		List<Stock> result =  stockRepository.searchWhStock(data, company_code);
		System.out.println("스톡서비스 리저트"+result);
		return result;
	}

    @Override
	public List<Stock> searchWhList() throws Exception {
    	List<Stock> result = stockRepository.searchWhList();
		return result;
	}

	@Override
	public List<Stock> searchWh(Stock data) throws Exception {
		List<Stock> result = stockRepository.searchWh(data);
		return result;
	}
	
	
	
}
