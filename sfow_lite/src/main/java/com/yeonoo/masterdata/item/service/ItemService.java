package com.yeonoo.masterdata.item.service;

import java.util.List;

import com.yeonoo.masterdata.item.domain.ItemProduct;
import com.yeonoo.masterdata.item.domain.ItemSpecification;
import com.yeonoo.masterdata.item.domain.ItemStockUnit;
import com.yeonoo.masterdata.item.domain.ItemType;

public interface ItemService {
	//품목유형등록 목록
	public List<ItemType> getItemTypeList(String company_code) throws Exception;
	//품목유형등록 등록
	public int insertItemType(ItemType itemtype) throws Exception;
	//품목유형등록 삭제
	public int deleteItemType(ItemType itemtype) throws Exception;
	//품목유형등록 검색
	public List<ItemType> getItemTypeSearchList(ItemType itemtype) throws Exception;
	//품목등록(제품) 목록
	public List<ItemProduct> productList(String company_code) throws Exception;
	//품목등록(제품) 등록
	public int insertProduct(ItemProduct itemproduct) throws Exception;
	//품목등록(제품) 수정
	public int updateProduct(ItemProduct itemproduct) throws Exception;
	//품목등록(제품) 삭제
	public int deleteProduct(ItemProduct itemproduct) throws Exception;
	//품목등록(제품) 검색
	public List<ItemProduct> getItemProductListSearchAjax(ItemProduct itemproduct) throws Exception;
	//품목유형등록(제품) 목록
	public List<ItemType> selectItemTypeList(String company_code) throws Exception;
	//재고단위 목록
	public List<ItemStockUnit> stockunitListAjax(String company_code) throws Exception;
	//재고단위 등록
	public int StockUnitInsert(ItemStockUnit itemstockunit) throws Exception;
	//재고단위 삭제
	public int deleteStockUnit(ItemStockUnit itemstockunit) throws Exception;
	//재고단위 검색
	public List<ItemStockUnit> stockunitSearchAjax(ItemStockUnit itemstockunit) throws Exception;
	//규격 목록
	public List<ItemSpecification> specificationListAjax(String company_code) throws Exception;
	//규격 등록
	public int specificationInsert(ItemSpecification itemspecification) throws Exception;
	//규격 삭제
	public int deleteSpecification(ItemSpecification itemspecification) throws Exception;
	//규격 검색
	public List<ItemSpecification> specificationSearchAjax(ItemSpecification itemspecification) throws Exception;
	//품목유형등록(제품) 검색
	public List<ItemType> typeSelectSearchAjax(ItemType itemtype) throws Exception;

}
