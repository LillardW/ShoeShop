package org.basic.order;

import java.util.Date;

public class Order {
	private int orderID;
	private int userID;
	private int itemID;
	private Date orderTime;
	private String orderAddress;
	private int amount;
	private double price;
	private int status;

	public Order() {

	}

	public Order(int orderID, int userID, int itemID, Date orderTime, String orderAddress, int amount, double price,
			int status) {
		super();
		this.orderID = orderID;
		this.userID = userID;
		this.itemID = itemID;
		this.orderTime = orderTime;
		this.orderAddress = orderAddress;
		this.amount = amount;
		this.price = price;
		this.status = status;
	}

	public int getOrderID() {
		return orderID;
	}

	public void setOrderID(int orderID) {
		this.orderID = orderID;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public int getItemID() {
		return itemID;
	}

	public void setItemID(int itemID) {
		this.itemID = itemID;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public String getOrderAddress() {
		return orderAddress;
	}

	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	
	
}
