package com.yeonoo.so.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ReturnAdd {

	private String company_code;
	private String return_number;
	private String return_date;
	private String client_code;
	private String client_name;
	private String out_status;
	private String memo;
	private Date create_date;
	private String create_user;
	private Date update_date;
	private String update_user;
	
}
