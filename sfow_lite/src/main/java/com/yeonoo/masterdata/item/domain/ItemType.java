package com.yeonoo.masterdata.item.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ItemType {
	
	private String item_type;
	private String item_category;
	private String company_code;
	
}
