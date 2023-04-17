package com.yeonoo.masterdata.wh.domain;


import lombok.Data;

@Data
public class WH_detail {

	//창고디테일(구역Area)
	
	private String company_code;		//PK//회사코드
	private String warehouse_code;		//창고코드	
	private int sorder;			//순서
	private String area_code;		//구역코드
	private String area_name;		//구역명
	
	// public WH_detail() {};
	
}
