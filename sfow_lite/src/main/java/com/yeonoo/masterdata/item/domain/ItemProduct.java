package com.yeonoo.masterdata.item.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ItemProduct { 
	
	private String company_code;
	private String item_code;
	private String item_no;
	private String item_name;
	private String item_type;
	private String item_specification;
	private String item_stock_unit;
	private String lotsize;
	private String memo;
	private String useyn;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm",timezone="Asia/Seoul")
	private Date createdate;
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm",timezone="Asia/Seoul")
	private Date updatedate;
	private String item_it;
	private String warehouse_code;
	private String area_code;
		
}
