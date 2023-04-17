package com.yeonoo.masterdata.item.repository;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.yeonoo.masterdata.item.domain.ItemProduct;
import com.yeonoo.masterdata.item.domain.ItemSpecification;
import com.yeonoo.masterdata.item.domain.ItemStockUnit;
import com.yeonoo.masterdata.item.domain.ItemType;
import com.yeonoo.masterdata.item.domain.PriceDTO;

public interface ItemRepository {
	//품목유형등록 목록
	public List<ItemType> getItemTypeList(String company_code) throws DataAccessException;
	//품목유형등록 등록
	public int insertItemType(ItemType itemtype) throws DataAccessException;
	//품목유형등록 삭제
	public int deleteItemType(ItemType itemtype) throws DataAccessException;
	//품목유형등록 검색
	public List<ItemType> getItemTypeSearchList(ItemType itemtype) throws DataAccessException;
	//품목등록(제품) 목록
	public List<ItemProduct> productList(String company_code) throws DataAccessException;
	//품목등록(제품) 등록
	public int insertProduct(ItemProduct itemproduct) throws DataAccessException;
	//품목등록(제품) 수정
	public int updateProduct(ItemProduct itemproduct) throws DataAccessException;
	//품목등록(제품) 삭제
	public int deleteProduct(ItemProduct itemproduct) throws DataAccessException;
	//품목등록(제품) 검색
	public List<ItemProduct> getItemProductListSearchAjax(ItemProduct itemproduct) throws DataAccessException;
	//품목유형등록(제품) 목록
	public List<ItemType> selectItemTypeList(String company_code) throws DataAccessException;
	//재고단위 목록
	public List<ItemStockUnit> stockunitListAjax(String company_code) throws DataAccessException;
	//재고단위 등록
	public int StockUnitInsert(ItemStockUnit itemstockunit) throws DataAccessException;
	//재고단위 삭제
	public int deleteStockUnit(ItemStockUnit itemstockunit) throws DataAccessException;
	//재고단위 검색
	public List<ItemStockUnit> stockunitSearchAjax(ItemStockUnit itemstockunit) throws DataAccessException;
	//규격 목록
	public List<ItemSpecification> specificationListAjax(String company_code) throws DataAccessException;
	//규격 등록
	public int specificationInsert(ItemSpecification itemspecification) throws DataAccessException;
	//규격 삭제
	public int deleteSpecification(ItemSpecification itemspecification) throws DataAccessException;
	//규격 검색
	public List<ItemSpecification> specificationSearchAjax(ItemSpecification itemspecification) throws DataAccessException;
	//품목유형등록(제품) 검색
	public List<ItemType> typeSelectSearchAjax(ItemType itemtype) throws DataAccessException;
	
}
