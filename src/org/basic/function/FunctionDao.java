package org.basic.function;

import java.util.ArrayList;
import org.basic.bean.*;

public interface FunctionDao {

    public int userRegister(User user);

    public int userLogin(User user);

    public int deleteUser(String userID);

    public int userUpdateProfile(User user);

    public User searchUser(String userID);

    public String userAddress(String userID);

    public ArrayList<User> showAllUsers();

    public int updateProductInformation(Product p);

    public int addProduct(Product p);

    public int deleteProduct(String productID);

    public Product searchProduct(String productID);

    public ArrayList<Product> searchProductByKeyword(String keyword);

    public ArrayList<Product> showAllProducts();

    public ArrayList<Order> showAllOrders();

    public int newOrder(Order order);

    public int deleteOrder(int orderID);

    public int orderIDGetter(String userID);

    public ArrayList<Order> userCheckOrder(String userID);

    public ArrayList<OrderDetail> adminOrderDetail(int orderID);

    public int clearCart(String userID);

    public int addOrderDetail(int orderID,int productID,String proName,int price,int size, int count);

    public ArrayList<OrderDetail> orderDetail(int orderID);

    public int addItem2Cart(Product p, String userID, int size, int count);

    public int checkProductInCart(Product p,String userID, int size, int count);

    public int deleteFromCart(int cartID);

    public ArrayList<Product> showpage(int pageNum);
    
    public  ArrayList<CartItem> getCartItems(String userID);



}
