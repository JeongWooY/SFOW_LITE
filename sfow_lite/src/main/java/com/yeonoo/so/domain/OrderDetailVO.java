package com.yeonoo.so.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetailVO {
	
	private int oddNo;//고유 키
	private String  quantity; //수량
	private String  price; //단가
	private String  amount; //총액
	private String  memo; //비고
	private String  item_st_unit; //재고단위
	private String  item_code; //아이템코드
	private String order_number	; //수주번호
	private String delete_yes_no;//삭제여부
}
