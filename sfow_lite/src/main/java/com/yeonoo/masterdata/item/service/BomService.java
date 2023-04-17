package com.yeonoo.masterdata.item.service;

import java.util.List;


import com.yeonoo.masterdata.item.domain.BomItem;

public interface BomService {

	public List<BomItem> getItemList(String company_code) throws Exception;

	public List<BomItem> getBomTree(String ppitem_cd, String company_code) throws Exception;

	public BomItem selectItem(String ppitem_cd, String company_code) throws Exception;

	public List<BomItem> searchItemListByName(String item_name, String company_code) throws Exception;
	
	public List<BomItem> searchItemList(String company_code) throws Exception;

	public void updateTree(String ppitem_cd, BomItem bomItem, String company_code) throws Exception;

	public void insertTree(String ppitem_cd, BomItem bomItem, String company_code) throws Exception;

	public void deleteTree(String ppitem_cd, BomItem bomItem, String company_code) throws Exception;

}
