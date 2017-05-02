package org.basic.bean;

import org.basic.bean.Product;


public class CartItem {
    private int cartItemID;
    private Product p;
    private String userID;
    private int count;
    private int size;


    public CartItem(Product p, String userID, int count, int size) {
        super();
        this.p = p;
        this.userID = userID;
        this.count = count;
        this.size = size;
    }


    public CartItem() {

    }


    public int getCartItemID() {
        return cartItemID;
    }

    public void setCartItemID(int cartItemID) {
        this.cartItemID = cartItemID;
    }

    public Product getP() {
        return p;
    }

    public void setP(Product p) {
        this.p = p;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getSize() {
        return size;
    }

    public void setSize(int size) {
        this.size = size;
    }
}
