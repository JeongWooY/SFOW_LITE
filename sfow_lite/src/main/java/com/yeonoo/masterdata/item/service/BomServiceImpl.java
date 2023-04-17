package com.yeonoo.masterdata.item.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yeonoo.masterdata.item.domain.BomItem;
import com.yeonoo.masterdata.item.repository.BomRepository;

@Service
public class BomServiceImpl implements BomService{

	@Autowired
	BomRepository bomRepository;
	
	@Override
	public List<BomItem> getItemList(String company_code) throws Exception {
		return bomRepository.getItemList(company_code);
	}
	
	@Override
	public List<BomItem> getBomTree(String ppitem_cd, String company_code) throws Exception {
		return bomRepository.getBomTree(ppitem_cd, company_code);
	}
	
	@Override
	public BomItem selectItem(String ppitem_cd, String company_code) throws Exception {
		return bomRepository.selectItem(ppitem_cd, company_code);
	}
	
	@Override
	public List<BomItem> searchItemListByName(String item_name, String company_code) throws Exception {
		return bomRepository.searchItemListByName(item_name, company_code);
	}
	
	@Override
	public List<BomItem> searchItemList(String company_code) throws Exception {
		return bomRepository.searchItemList(company_code);
	}
	
	@Override
	public void updateTree(String ppitem_cd, BomItem bomItem, String company_code) throws Exception {
		bomRepository.updateTree(ppitem_cd, bomItem, company_code);
	}
	
	@Override
	public void insertTree(String ppitem_cd, BomItem bomItem, String company_code) throws Exception {
		bomRepository.insertTree(ppitem_cd, bomItem, company_code);
	}
	
	@Override
	public void deleteTree(String ppitem_cd, BomItem bomItem, String company_code) throws Exception {
		bomRepository.deleteTree(ppitem_cd, bomItem, company_code);
	}
}
