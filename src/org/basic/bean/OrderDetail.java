package org.basic.bean;

import java.util.Date;

/**
 * Created by aa444 on 2017/4/24.
 */
public class OrderDetail {
    private int orderID;
    private int productID;
    private String proName;
    private int price;
    private int size;
    private int count;

    public OrderDetail() {
    }

    public OrderDetail(int orderID, int productID, String proName, int price, int size, int count) {
        this.orderID = orderID;
        this.productID = productID;
        this.proName = proName;
        this.price = price;
        this.size = size;
        this.count = count;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProName() {
        return proName;
    }

    public void setProName(String proName) {
        this.proName = proName;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }
}