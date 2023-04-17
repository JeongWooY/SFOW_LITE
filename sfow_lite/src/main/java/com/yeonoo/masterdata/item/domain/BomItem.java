package com.yeonoo.masterdata.item.domain;

import java.util.List;
import java.util.Map;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class BomItem {
	
	//필드
	private String item_code;
	private String item_name;
	private String item_no;
	private String item_specification;
	private String item_category;
	
	//BOM
	private int item_qty;
	private String item_stock_unit;
	private String item_type;
	
	//Tree 객체용
	private Map _attributes;
	private List<BomItem> _children;
	

	
}
