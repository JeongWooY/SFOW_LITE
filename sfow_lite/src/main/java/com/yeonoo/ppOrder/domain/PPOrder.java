package com.yeonoo.ppOrder.domain;



import lombok.Data;
import lombok.ToString;
@ToString
@Data
public class PPOrder {
	
	private String pp_no;				//지시번호
	private String pp_type;				//유형
	private String po_date;				//지시일자
	private String end_date;			//완료일자
	private String item_code;			//ITEM코드
	private String item_name;			//품명
	private String item_no;				//품목코드
	private String item_specification;	//규격
	private String warehouse_code;		//창고
	private String warehouse_name;		//창고명
	private String pp_quantity;			//작업지시수량
	private String pp_status;			//작업지시상태
	private String pp_date;				//작업지시시간
	private String company_code;	    //회사코드
	


}
