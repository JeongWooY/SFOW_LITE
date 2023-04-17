package com.yeonoo.poRequest.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

//입고관리
@Data //Setter & Getter
@NoArgsConstructor //기본생성자
@AllArgsConstructor //생성자
@ToString

public class ReqMgmtDTO {
	
	private String in_number; //입고번호
	private String in_free; //무상,유상
	private String in_type; //입고유형
	private String in_trans_type; //수불타입
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd",timezone="Asia/Seoul")
	private String in_date; //입고일자
	//private String in_date; //입고일자
	private String client_code; //거래처코드
	private String client_name; //거래처명
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd hh:mm",timezone="Asia/Seoul")
	private Date in_regdate; //등록수정일
	private String in_empid; //입고담당자
	private String in_delyn; //삭제여부 DEFAULT 'N',
	private String memo; //비고
	private String request_number; //구매요청번호
	private int no; //거래처정보번호
	private String company_code; //회사코드
	
	
	
	

}
