package com.yeonoo.masterdata.item.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ItemController {
	
	//품목유형등록 목록
	@GetMapping("/item/type")
	public String getItemTypeList() throws Exception {
		return "item/itemType";
	}
	//품목유형등록셀렉트 목록
	@GetMapping("/item/typeSelect")
	public String selectItemTypeList() throws Exception {
		return "item/itemTypeSelect";
	}
	//재고단위 목록
	@RequestMapping("/item/stockunitList")
	public String stockunitList() throws Exception {
		return "item/itemStockUnit";
	}
	//재고단위 모달
	@RequestMapping("/item/itemStockUnitSelect")
	public String modalstockunitList() throws Exception {
		return "item/itemStockUnitSelect";
	}
	//규격 목록
	@RequestMapping("/item/specificationList")
	public String specificationList() throws Exception {
		return "item/itemSpecification";
	}
	//규격 모달
	@RequestMapping("/item/itemSpecificationSelect")
	public String modalitemSpecificationSelect() throws Exception {
		return "item/itemSpecificationSelect";		
	}
	//아이템코드 모달
	@RequestMapping("/item/itemCodeSelect")
	public String itemCodeSelect() throws Exception {
		return "price/itemCodeSelect";		
	}
	//거래처코드 모달
	@RequestMapping("/item/companyCodeSelect")
	public String companyCodeSelect() throws Exception {
		return "price/gridPriceList";		
	}
	//품목등록(제품) 목록
	@RequestMapping("/item/productList")
	public String productList() throws Exception {
		return "item/itemProduct";
	}
	/*	
	//품목유형등록 등록
	@GetMapping("/item/typeInsertAjax")
	public String iserttype() throws Exception {
		return "item/itemType";
	}
	//품목유형등록 삭제
	@GetMapping("/item/typeDeleteAjax")
	public String deleteItemType() throws Exception {
		return "item/itemType";
	}
	//품목유형등록 검색
	@GetMapping("/item/typeSearchAjax")
	public String getItemTypeListSearch() throws Exception {
		return "item/itemType";
	}	
	 */	
	/*
	//품목등록(제품) 등록
	@GetMapping("/item/productInsertAjax")
	public String insertproductList() throws Exception {
		return "item/itemProduct";
	}
	//품목등록(제품) 수정
	@GetMapping("/item/productUpdateAjax")
	public String updateproductList() throws Exception {
		return "item/itemProduct";
	}
	//품목등록(제품) 삭제
	@GetMapping("/item/productDeleteAjax")
	public String deleteproductList() throws Exception {
		return "item/itemProduct";
	}
	 */			
/*	
	//규격 모달 검색
	@GetMapping("/item/secificationSearchAjax")
	public String secificationSearchAjax() throws Exception {
		return "item/itemSpecificationSelect";
	}
*/		
}
