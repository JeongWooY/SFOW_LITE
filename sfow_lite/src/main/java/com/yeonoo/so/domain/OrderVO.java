package com.yeonoo.so.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderVO {
	
	private String  company_code; //회사코드
	private String  order_number; //수주번호
	private String  order_type; //수주유형
	private String  client_code; //거래처코드
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",timezone="Asia/Seoul" )
	private Date  order_date; //수주일자
	private String  order_empid; //수주담당자
	private String  order_status; //수주상태
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",timezone="Asia/Seoul")
	private Date  due_date; //납기일
	private String  memo; //비고
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",timezone="Asia/Seoul")
	private Date  create_date; //등록일
	private String  create_user; //등록자
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",timezone="Asia/Seoul")
	private Date  update_date; //수정일
	private String update_user	; //수정자
	private String amount;//총액
	private String title;//제목
	private String delete_yes_no;//삭제여부
}
























