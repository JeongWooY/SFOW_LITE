package com.yeonoo.poRequest.model;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//입고관리 상세보기
@Data //Setter & Getter
@NoArgsConstructor //기본생성자
@AllArgsConstructor //생성자
public class ReqMgmtDetailDTO {
	
	private int in_order; //번호
	private String item_code; //아이템코드
	private String item_name; //품명
	private String item_no; //품번
	private String item_specification;//규격
	private String item_stock_unit;//재고단위
	private String warehouse_code; //창고코드
	private String warehouse_name; //창고명
	private int request_quantity; //요청수량
	private int price; //단가
	private int amount; //공급가액
	private int tax_amount; //부가세포함가
	private String memo; //비고
	private String in_number; //입고번호
	private int in_quantity; //입고수량
	private int request_order; //구매발주 상세보기번호

}
