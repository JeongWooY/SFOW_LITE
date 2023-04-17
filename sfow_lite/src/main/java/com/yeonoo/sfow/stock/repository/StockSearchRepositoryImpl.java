package com.yeonoo.sfow.stock.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.yeonoo.sfow.stock.domain.Stock;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class StockSearchRepositoryImpl implements StockSearchRepository{
	
	private final SqlSession sqlSession;
	
	@Override
	public List<Stock> search(Stock stock) {
		if(stock.getItem_code()==null&&stock.getItem_name()==null&&stock.getItem_type()==null&&stock.getWarehouse_name()==null) {
        List<Stock> result=sqlSession.selectList("mapper.stock.allStockList");
        return result;
        }else {
        List<Stock> result=sqlSession.selectList("mapper.stock.searchStockList",stock);
        return result;
        }
    }

	@Override
	public List<Stock> search2(Stock stock) {
		List<Stock> result=sqlSession.selectList("mapper.stock.allStockList2",stock);
		return result;
	}

	@Override
	public void updateStock(Stock itemName) {
		sqlSession.update("mapper.stock.updateStock",itemName);
	}



}
