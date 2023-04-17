package com.yeonoo.so.domain;



import lombok.Data;

@Data
public class ReturnDetail {

	private int sorder;
	private String return_number;
	private String company_code;
	private String item_code;
	private String receive_date; //입고일자
	private String lot_number; //lot 번호
	private int item_quantity; //아이템수량
	private String memo;
	
	
}
