package com.yeonoo.masterdata.item.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.yeonoo.masterdata.item.domain.ItemProduct;
import com.yeonoo.masterdata.item.domain.ItemSpecification;
import com.yeonoo.masterdata.item.domain.ItemStockUnit;
import com.yeonoo.masterdata.item.domain.ItemType;

@Repository
public class ItemRepositoryImpl implements ItemRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	//품목유형등록 목록
	public List<ItemType> getItemTypeList(String company_code) throws DataAccessException{
		List<ItemType> itemtype = sqlSession.selectList("mapper.item.getItemType",company_code);
		return itemtype;
	}	
	//품목유형등록 등록
	public int insertItemType(ItemType itemtype) throws DataAccessException {
		int cnt = sqlSession.insert("mapper.item.insertItemType",itemtype);
		return cnt;
	}
	//품목유형등록 삭제
	public int deleteItemType(ItemType itemtype) throws DataAccessException {
		int cnt = sqlSession.delete("mapper.item.deleteItemType", itemtype);
		return cnt;
	}
	//품목유형등록 조회
	public ItemType getItemType(String item_category) throws DataAccessException {
		return (ItemType)sqlSession.selectOne("mapper.item.readItemType",item_category);
	}
	//품목유형등록 검색
	public List<ItemType> getItemTypeSearchList(ItemType itemtype) throws DataAccessException {
		List<ItemType> itemtypelist = sqlSession.selectList("mapper.item.getItemTypeSearch",itemtype);
		return itemtypelist;
	}
	//품목등록(제품) 목록
	public List<ItemProduct> productList(String company_code) throws DataAccessException {
		List<ItemProduct> itemproduct = sqlSession.selectList("mapper.item.getItemProduct",company_code);
		return itemproduct;
	}
	//품목등록(제품) 등록
	public int insertProduct(ItemProduct itemproduct) throws DataAccessException {
		int cnt = sqlSession.insert("mapper.item.insertProduct",itemproduct);
		return cnt;
	}
	//품목등록(제품) 수정
	public int updateProduct(ItemProduct itemproduct) throws DataAccessException {
		int cnt = sqlSession.update("mapper.item.updateProduct",itemproduct);
		return cnt;
	}
	//품목등록(제품) 삭제
	public int deleteProduct(ItemProduct itemproduct) throws DataAccessException {
		//int cnt = sqlSession.delete("mapper.item.deleteProduct", itemproduct);	
		int cnt = sqlSession.update("mapper.item.updelProduct",itemproduct);
		return cnt;
	}
	//품목등록(제품) 검색
	public List<ItemProduct> getItemProductListSearchAjax(ItemProduct itemproduct) throws DataAccessException {
		List<ItemProduct> itemproductlist = sqlSession.selectList("mapper.item.getItemProductSearch",itemproduct);
		return itemproductlist;
		}
	//품목유형등록(제품) 목록
	public List<ItemType> selectItemTypeList(String company_code) throws DataAccessException{
		List<ItemType> itemtype = sqlSession.selectList("mapper.item.selectItemType",company_code);
		return itemtype;
	}
	//재고단위 목록
	public List<ItemStockUnit> stockunitListAjax(String company_code) throws DataAccessException{
		List<ItemStockUnit> itemstockunit = sqlSession.selectList("mapper.item.stockunitList",company_code);
		return itemstockunit;
	}
	//재고단위 등록
	public int StockUnitInsert(ItemStockUnit itemstockunit) throws DataAccessException{
		int cnt = sqlSession.insert("mapper.item.StockUnitInsert",itemstockunit);
		return cnt;
	}
	//재고단위 삭제
	public int deleteStockUnit(ItemStockUnit itemstockunit) throws DataAccessException {
		int cnt = sqlSession.delete("mapper.item.deleteStockUnit", itemstockunit);	
		return cnt;
	}
	//재고단위 검색
	public List<ItemStockUnit> stockunitSearchAjax(ItemStockUnit itemstockunit) throws DataAccessException{
		List<ItemStockUnit> itemstockunitlist = sqlSession.selectList("mapper.item.ItemStockUnitSearch",itemstockunit);
		return itemstockunitlist;
	}
	//규격 목록
	public List<ItemSpecification> specificationListAjax(String company_code) throws DataAccessException{
		List<ItemSpecification> itemspecificationlist = sqlSession.selectList("mapper.item.spList",company_code);
		return itemspecificationlist;
	}
	//규격 등록
	public int specificationInsert(ItemSpecification itemspecification) throws DataAccessException{
		int cnt = sqlSession.insert("mapper.item.spInsert",itemspecification);
		return cnt;
	}
	//규격 삭제
	public int deleteSpecification(ItemSpecification itemspecification) throws DataAccessException {
		int cnt = sqlSession.delete("mapper.item.deleteSpecification", itemspecification);	
		return cnt;
	}
	//규격 검색
	public List<ItemSpecification> specificationSearchAjax(ItemSpecification itemspecification) throws DataAccessException{
		List<ItemSpecification> itemspecificationlist = sqlSession.selectList("mapper.item.spSearch",itemspecification);
		return itemspecificationlist;
	}
	//품목유형등록(제품) 검색
	public List<ItemType> typeSelectSearchAjax(ItemType itemtype) throws DataAccessException {
		List<ItemType> itemtypeselectsearch = sqlSession.selectList("mapper.item.typeselectsearch",itemtype);
				return itemtypeselectsearch;
	}
}
