package com.yeonoo.poRequest.domain;

import lombok.Data;

@Data
public class FMpr {
	
	private int request_order;			//구매요청번호
	private String item_type;			//품목유형
	private String client_name;			//거래처명
	private String item_code;			//item코드
	private String item_name;			//품명
	private String item_no;				//품번
	private String item_specification;	//규격
	private String item_stock_unit;		//재고단위
	private int request_quantity;		//수량
	private int buy_price;					//단가
	private int amount;					//공급가액

	/*public FMpr() {}

	public FMpr(int request_order, String item_type, String client_name, String item_code, String item_name,
			String item_no, String item_specification, String item_stock_unit, int request_quantity, int price,
			int amount) {

		this.request_order = request_order;
		this.item_type = item_type;
		this.client_name = client_name;
		this.item_code = item_code;
		this.item_name = item_name;
		this.item_no = item_no;
		this.item_specification = item_specification;
		this.item_stock_unit = item_stock_unit;
		this.request_quantity = request_quantity;
		this.price = price;
		this.amount = amount;
	}

	public int getRequest_order() {
		return request_order;
	}

	public void setRequest_order(int request_order) {
		this.request_order = request_order;
	}

	public String getItem_type() {
		return item_type;
	}

	public void setItem_type(String item_type) {
		this.item_type = item_type;
	}

	public String getClient_name() {
		return client_name;
	}

	public void setClient_name(String client_name) {
		this.client_name = client_name;
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

	public int getRequest_quantity() {
		return request_quantity;
	}

	public void setRequest_quantity(int request_quantity) {
		this.request_quantity = request_quantity;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "FMpr [request_order=" + request_order + ", item_type=" + item_type + ", client_name=" + client_name
				+ ", item_code=" + item_code + ", item_name=" + item_name + ", item_no=" + item_no
				+ ", item_specification=" + item_specification + ", item_stock_unit=" + item_stock_unit
				+ ", request_quantity=" + request_quantity + ", price=" + price + ", amount=" + amount + "]";
	}
*/
}
