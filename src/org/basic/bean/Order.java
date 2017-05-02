package org.basic.bean;

import java.util.Date;

public class Order {
    private int orderID;
    private String userID;
    private Date orderTime;
    private String orderAddress;
    private int status;

    public Order() {

    }

    public Order(int orderID, String userID, Date orderTime, String orderAddress, int status) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderTime = orderTime;
        this.orderAddress = orderAddress;
        this.status = status;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
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

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }


}
