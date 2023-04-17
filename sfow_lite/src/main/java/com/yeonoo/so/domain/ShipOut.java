package com.yeonoo.so.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class ShipOut {

	private String outCode;     // 출하코드    PK
	private String orderNumber; // 수주번호    FK
	private String clientCode;  // 거래처코드 FK
	private String companyCode; // 회사코드    FK
	private String outType;     // 출하유형    택1(기타출고, 반품출고, 생산출고, 판매출고)
	private String transType;	// 수불타입    택1(일반, 사급, 샘플, 불량)
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date outPlanDate; 	// 출하계획일   
	private String outManager;  // 출하담당자
	private String outStatus;	// 상태          (등록, 확정) 기본 등록
	private String memo;		// 비고
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date createDate;	// 등록일        now()
	private String createUser;	// 등록자
	@JsonFormat(shape=JsonFormat.Shape.STRING, pattern="yyyy-MM-dd", timezone="Asia/Seoul")
	private Date updateDate;	// 수정일        now()	
	private String updateUser;	// 수정자
	private String deleteYesNo;	// 삭제여부     (Y, N) 기본N
}
