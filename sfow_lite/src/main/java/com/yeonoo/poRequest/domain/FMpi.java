package com.yeonoo.poRequest.domain;

import lombok.Data;

@Data
public class FMpi {
	
	private String in_number;			//발주번호
	private String in_date;				//입고일자
	private String item_code;			//item코드
	private String item_name;			//품명
	private String item_no;				//품번
	private String item_specification;	//규격
	private String item_stock_unit;		//재고단위
	private String warehouse_code;		//창고코드

	/*
	public FMpi() {}

	public FMpi(String in_number, Date in_date, String item_code, String item_name, String item_no,
			String item_specification, String item_stock_unit) {
		super();
		this.in_number = in_number;
		this.in_date = in_date;
		this.item_code = item_code;
		this.item_name = item_name;
		this.item_no = item_no;
		this.item_specification = item_specification;
		this.item_stock_unit = item_stock_unit;
		
	}

	public String getIn_number() {
		return in_number;
	}

	public void setIn_number(String in_number) {
		this.in_number = in_number;
	}

	public Date getIn_date() {
		return in_date;
	}

	public void setIn_date(Date in_date) {
		this.in_date = in_date;
	}

	public String getItem_code() {
		return item_code;
	}

	public void setItem_code(String item_code) {
		this.item_code = item_code;
	}

	public String getItem_name() {
		return item_name;
	}

	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}

	public String getItem_no() {
		return item_no;
	}

	public void setItem_no(String item_no) {
		this.item_no = item_no;
	}

	public String getItem_specification() {
		return item_specification;
	}

	public void setItem_specification(String item_specification) {
		this.item_specification = item_specification;
	}

	public String getItem_stock_unit() {
		return item_stock_unit;
	}

	public void setItem_stock_unit(String item_stock_unit) {
		this.item_stock_unit = item_stock_unit;
	}

	@Override
	public String toString() {
		return "FMpi [in_number=" + in_number + ", in_date=" + in_date + ", item_code=" + item_code + ", item_name="
				+ item_name + ", item_no=" + item_no + ", item_specification=" + item_specification
				+ ", item_stock_unit=" + item_stock_unit + "]";
	}

	*/
}
