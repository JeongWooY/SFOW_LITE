package com.yeonoo.masterdata.item.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeonoo.masterdata.item.domain.ItemProduct;
import com.yeonoo.masterdata.item.domain.ItemSpecification;
import com.yeonoo.masterdata.item.domain.ItemStockUnit;
import com.yeonoo.masterdata.item.domain.ItemType;
import com.yeonoo.masterdata.item.domain.PriceDTO;
import com.yeonoo.masterdata.item.repository.ItemRepository;

@Service
public class ItemServiceImpl implements ItemService {
	
	@Autowired
	private ItemRepository itemRepository;
	//품목유형등록 목록
	public List<ItemType> getItemTypeList(String company_code) throws Exception {
		List<ItemType> itemtype = itemRepository.getItemTypeList(company_code);
		return itemtype;
	}
	//품목유형등록 등록
	public int insertItemType(ItemType itemtype) throws Exception {
		int cnt = itemRepository.insertItemType(itemtype);
		return cnt;
	}
	//품목유형등록 삭제
	public int deleteItemType(ItemType itemtype) throws Exception {
		int cnt = itemRepository.deleteItemType(itemtype);
		return cnt;
	}
	//품목유형등록 검색
	public List<ItemType> getItemTypeSearchList(ItemType itemtype) throws Exception {
		List<ItemType> itemtypelist = itemRepository.getItemTypeSearchList(itemtype);
		return itemtypelist;
	}
	//품목등록(제품) 목록
	public List<ItemProduct> productList(String company_code) throws Exception {
		List<ItemProduct> itemproduct = itemRepository.productList(company_code);
		return itemproduct;
	}
	//품목등록(제품) 등록
	public int insertProduct(ItemProduct itemproduct) throws Exception {
		int cnt = itemRepository.insertProduct(itemproduct);
		return cnt;
	}
	//품목등록(제품) 수정
	public int updateProduct(ItemProduct itemproduct) throws Exception {
		int cnt = itemRepository.updateProduct(itemproduct);
		return cnt;
	}
	//품목등록(제품) 삭제
	public int deleteProduct(ItemProduct itemproduct) throws Exception {
		int cnt = itemRepository.deleteProduct(itemproduct);
		return cnt;
	}
	//품목등록(제품) 검색
	public List<ItemProduct> getItemProductListSearchAjax(ItemProduct itemproduct) throws Exception {
		List<ItemProduct> itemproductlist = itemRepository.getItemProductListSearchAjax(itemproduct);
		return itemproductlist;
	}
	//품목유형등록(제품) 목록
	public List<ItemType> selectItemTypeList(String company_code) throws Exception {
		List<ItemType> itemtype = itemRepository.selectItemTypeList(company_code);
		return itemtype;
	}
	//재고단위 목록
	public List<ItemStockUnit> stockunitListAjax(String company_code) throws Exception {
		List<ItemStockUnit> itemstockunit = itemRepository.stockunitListAjax(company_code);
		return itemstockunit;
	}
	//재고단위 등록
	public int StockUnitInsert(ItemStockUnit itemstockunit) throws Exception{
		int cnt = itemRepository.StockUnitInsert(itemstockunit);
		return cnt;
	}
	//재고단위 삭제
	public int deleteStockUnit(ItemStockUnit itemstockunit) throws Exception{
		int cnt = itemRepository.deleteStockUnit(itemstockunit);
		return cnt;
	}
	//재고단위 검색
	public List<ItemStockUnit> stockunitSearchAjax(ItemStockUnit itemstockunit) throws Exception { 
		List<ItemStockUnit> itemstockunitlist = itemRepository.stockunitSearchAjax(itemstockunit);
		return itemstockunitlist;
	}
	//규격 목록
	public List<ItemSpecification> specificationListAjax(String company_code) throws Exception {
		List<ItemSpecification> itemspecificationlist = itemRepository.specificationListAjax(company_code);
		return itemspecificationlist;
	}
	//규격 등록
	public int specificationInsert(ItemSpecification itemspecification) throws Exception{
		int cnt = itemRepository.specificationInsert(itemspecification);
		return cnt;
	}
	//규격 삭제
	public int deleteSpecification(ItemSpecification itemspecification) throws Exception{
		int cnt = itemRepository.deleteSpecification(itemspecification);
		return cnt;
	}
	//규격 검색
	public List<ItemSpecification> specificationSearchAjax(ItemSpecification itemspecification) throws Exception { 
		List<ItemSpecification> itemspecificationlist = itemRepository.specificationSearchAjax(itemspecification);
		return itemspecificationlist;
	}
	//품목유형등록(제품) 검색
	public List<ItemType> typeSelectSearchAjax(ItemType itemtype) throws Exception {
		List<ItemType> itemtypeselectsearch = itemRepository.typeSelectSearchAjax(itemtype);
		return itemtypeselectsearch;
	}

}
