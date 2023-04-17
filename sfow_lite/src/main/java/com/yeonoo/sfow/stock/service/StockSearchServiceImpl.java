package com.yeonoo.sfow.stock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeonoo.sfow.stock.domain.Stock;
import com.yeonoo.sfow.stock.repository.StockSearchRepositoryImpl;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StockSearchServiceImpl implements StockSearchService {

    @Autowired
    private StockSearchRepositoryImpl stockSearchRepository;
    
    @Override
    public List<Stock> search(Stock stock) {
        return stockSearchRepository.search(stock);
    }
   
    @Override
	public void updateStock(Stock rowData) {
		stockSearchRepository.updateStock(rowData);
	}
    @Override
	public List<Stock> search2(Stock stock) {
		return stockSearchRepository.search2(stock);
	}
}
