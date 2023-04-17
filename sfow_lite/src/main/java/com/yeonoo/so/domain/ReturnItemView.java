package com.yeonoo.so.domain;



import lombok.Data;

@Data
public class ReturnItemView {

	private int sorder;
	private String return_number;
	private String company_code;
	private String item_code; //아이템코드
	private String receive_date; //입고일자
	private String lot_number; //lot 번호
	private int item_quantity; //아이템수량
	private String memo;
	private String item_no;
	private String item_name;
	private String item_type;
	private String item_stock_unit;
	
}
