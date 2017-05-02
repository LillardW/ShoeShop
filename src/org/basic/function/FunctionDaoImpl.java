package org.basic.function;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import org.basic.Connection.Conn;
import org.basic.bean.*;
import org.springframework.stereotype.Service;

@Service
public class FunctionDaoImpl implements FunctionDao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    //Statement stmt = null;

    public int userRegister(User user) {
        String sql = "insert into user(USERID,USERACCOUNT,PASSWORD,MOBILE,ADDRESS,ICON) values (?,?,?,?,?,?)";
        int i = 0;
        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUserID());
            ps.setString(2, user.getUserAccount());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getMobile());
            ps.setString(5, user.getAddress());
            ps.setString(6, user.getIcon());
            i = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(ps);
            Conn.release(conn);
        }
        return i;
    }

    public int userLogin(User user) {
        String sql = "select * from user where userid=? and password=?";
        int i = 0;
        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, user.getUserID());
            ps.setString(2, user.getPassword());
            rs = ps.executeQuery();
            while (rs.next()) i = 1;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(ps);
            Conn.release(conn);
        }
        return i;
    }

    public int userUpdateProfile(User user) {
        String sql = "update user set useraccount=?,password=?,mobile=?,address=? where userid=?";
        int i = 0;

        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1,user.getUserAccount());
            ps.setString(2,user.getPassword());
            ps.setString(3, user.getMobile());
            ps.setString(4, user.getAddress());
            ps.setString(5, user.getUserID());
            i = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(ps);
            Conn.release(conn);
        }
        return i;
    }

    public User searchUser(String userID) {
        String sql = "select * from user where userid=?";
        User u = new User();

        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1,userID);
            rs = ps.executeQuery();
            if(rs.next()) {
                u.setUserID(userID);
                u.setUserAccount(rs.getString("useraccount"));
                u.setPassword(rs.getString("password"));
                u.setMobile(rs.getString("mobile"));
                u.setAddress(rs.getString("address"));
                u.setIcon(rs.getString("icon"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(rs);
            Conn.release(ps);
            Conn.release(conn);
        }
        return u;
    }

    public String userAddress(String userID) {
        String sql = "select * from user where userid=?";
        String address = "";

        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1,userID);
            rs = ps.executeQuery();
            if(rs.next()) {
                address = rs.getString("address");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(rs);
            Conn.release(ps);
            Conn.release(conn);
        }
        return address;
    }

    public ArrayList<User> showAllUsers() {
        String sql = "select * from user";
        ArrayList<User> groups = new ArrayList<>();

        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                User temp = new User();
                temp.setUserID(rs.getString("userid"));
                temp.setUserAccount(rs.getString("useraccount"));
                temp.setPassword(rs.getString("password"));
                temp.setMobile(rs.getString("mobile"));
                temp.setAddress(rs.getString("address"));
                temp.setIcon(rs.getString("icon"));
                groups.add(temp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(rs);
            Conn.release(ps);
            Conn.release(conn);
        }
        return groups;
    }

    public int deleteUser(String userID) {
        String sql = "delete from user where userid=?";
        int i = 0;
        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, userID);
            i = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(rs);
            Conn.release(ps);
            Conn.release(conn);
        }
        return i;
    }

    public ArrayList<Order> userCheckOrder(String userID) {
        ArrayList<Order> order = new ArrayList<>();
        String sql = "select * from `order` where userid=?";
        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                Order temp = new Order();
                temp.setOrderID(rs.getInt(1));
                temp.setUserID(rs.getString(2));
                temp.setOrderTime(rs.getDate(3));
                temp.setOrderAddress(rs.getString(4));
                temp.setStatus(rs.getInt(5));
                order.add(temp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(rs);
            Conn.release(ps);
            Conn.release(conn);
        }
        return order;
    }

    public int clearCart(String userID) {
        String sql = "delete from cart where userid=?";
        int i = 0;

        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1,userID);
            i = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(ps);
            Conn.release(conn);
        }
        return i;
    }

    public ArrayList<OrderDetail> orderDetail(int orderID) {
        String sql = "select * from orderdetail where orderid=?";
        ArrayList<OrderDetail> orderdetail = new ArrayList<>();

        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, orderID);
            rs = ps.executeQuery();
            while (rs.next()) {
                OrderDetail temp = new OrderDetail();
                temp.setOrderID(rs.getInt("orderid"));
                temp.setProductID(rs.getInt("productid"));
                temp.setProName(rs.getString("proname"));
                temp.setCount(rs.getInt("count"));
                temp.setPrice(rs.getInt("price"));
                temp.setSize(rs.getInt("size"));
                orderdetail.add(temp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(rs);
            Conn.release(ps);
            Conn.release(conn);
        }
        return orderdetail;
    }

    public int newOrder(Order order) {
        String sql = "insert into `order`(userID,orderTime,orderAddress,status) values (?,now(),?,?)";
        int i = 0;
        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, order.getUserID());
            ps.setString(2, order.getOrderAddress());
            ps.setInt(3, 0);
            i = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(ps);
            Conn.release(conn);
        }
        return i;
    }

    public int deleteOrder(int orderID) {
        String sql1 = "delete from orderdetail where orderid=?";
        String sql2 = "delete from `order` where orderid=?";
        int i = 0;
        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql1);
            ps.setInt(1,orderID);
            i = ps.executeUpdate();
            ps = conn.prepareStatement(sql2);
            ps.setInt(1,orderID);
            i = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(rs);
            Conn.release(ps);
            Conn.release(conn);
        }
        return i;
    }

    public ArrayList<Product> searchProductByKeyword(String keyword) {
        ArrayList<Product> groups = new ArrayList<>();
        String sql = "select * from product where proname like '%" + keyword + "%'";

        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Product temp = new Product();
                //  System.out.println(rs.getInt("cartItemID"));
                temp.setProductid(rs.getInt("productid"));
                System.out.println(temp.getProductid());
                temp.setProName(rs.getString("proname"));
                temp.setReviews(rs.getString("reviews"));
                temp.setType(rs.getString("type"));
                temp.setAddInformation(rs.getString("addinformation"));
                temp.setProductDescription(rs.getString("productdescription"));
                temp.setQuickOverview(rs.getString("quickoverview"));
                temp.setPrice(rs.getInt("price"));
                temp.setP1(rs.getString("p1"));
                temp.setP2(rs.getString("p2"));
                temp.setP3(rs.getString("p3"));
                groups.add(temp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(rs);
            Conn.release(ps);
            Conn.release(conn);
        }

        return groups;
    }

    public ArrayList<Order> showAllOrders() {
        String sql = "select * from `order`";
        ArrayList<Order> groups = new ArrayList<>();

        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()) {
                Order temp = new Order();
                temp.setUserID(rs.getString("userID"));
                temp.setOrderID(rs.getInt("orderid"));
                temp.setOrderAddress(rs.getString("orderaddress"));
                temp.setStatus(rs.getInt("status"));
                temp.setOrderTime(rs.getDate("ordertime"));
                groups.add(temp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(rs);
            Conn.release(ps);
            Conn.release(conn);
        }
        return groups;
    }

    public ArrayList<OrderDetail> adminOrderDetail(int orderID) {
        String sql = "select * from `orderdetail` where `orderid`=?";
        ArrayList<OrderDetail> orderDetails = new ArrayList<>();

        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,orderID);
            rs = ps.executeQuery();
            while(rs.next()) {
                OrderDetail temp = new OrderDetail();
                temp.setOrderID(rs.getInt("orderID"));
                temp.setProName(rs.getString("proname"));
                temp.setProductID(rs.getInt("productid"));
                temp.setSize(rs.getInt("size"));
                temp.setPrice(rs.getInt("price"));
                temp.setCount(rs.getInt("count"));
                orderDetails.add(temp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(rs);
            Conn.release(ps);
            Conn.release(conn);
        }
        return orderDetails;
    }

    public int orderIDGetter(String userID) {
        String sql = "select * from `order` where userid=? order by ordertime desc";
        int orderID = 0;

        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1,userID);
            rs = ps.executeQuery();
            if(rs.next()) {
                orderID = rs.getInt("orderid");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(rs);
            Conn.release(ps);
            Conn.release(conn);
        }
        return orderID;
    }

    public int addOrderDetail(int orderID,int productID,String proName,int price,int size, int count) {
        String sql = "insert into orderdetail(orderID,productID,proName,price,size,count) values (?,?,?,?,?,?)";
        int i = 0;

        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,orderID);
            ps.setInt(2,productID);
            ps.setString(3,proName);
            ps.setInt(4,price);
            ps.setInt(5,size);
            ps.setInt(6,count);
            i = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(ps);
            Conn.release(conn);
        }

        return i;
    }

    public ArrayList<Product> showpage(int pageNum) {
        conn = Conn.getConnection();
        ArrayList<Product> c = new ArrayList<Product>();
        int i = -1;
        int a = i + pageNum;

        String sql = "select * from product limit " + a + ",2 ";
        try {
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery(sql);
            while (rs.next()) {
                //Product p = new Product(0, "0", 0, "0", "0", "0", "0", 0, 0, 0, "0");
                Product p = new Product();
                p.setProductid(rs.getInt("productid"));
                p.setProName(rs.getString("proname"));
                p.setPrice(rs.getInt("price"));
                p.setQuickOverview(rs.getString("quickoverview"));
                p.setProductDescription(rs.getString("productdescription"));
                p.setAddInformation(rs.getString("addinformation"));
                p.setReviews(rs.getString("reviews"));
                p.setP1(rs.getString("p1"));
                p.setP2(rs.getString("p2"));
                p.setP3(rs.getString("p3"));
                p.setType(rs.getString("type"));
                c.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(rs);
            Conn.release(ps);
            Conn.release(conn);
        }
        return c;
    }

    public int addProduct(Product p) {
        String sql = "insert into product(proname,price,quickoverview,productdescription,addinformation,reviews,p1,p2,p3,type) values (?,?,?,?,?,?,?,?,?,?)";
        int i = 0;

        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, p.getProName());
            ps.setInt(2, p.getPrice());
            ps.setString(3, p.getQuickOverview());
            ps.setString(4, p.getProductDescription());
            ps.setString(5, p.getAddInformation());
            ps.setString(6, p.getReviews());
            ps.setString(7, p.getP1());
            ps.setString(8, p.getP2());
            ps.setString(9, p.getP3());
            ps.setString(10, p.getType());
            i = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(ps);
            Conn.release(conn);
        }

        return i;
    }

    public Product searchProduct(String productID) {
        conn = Conn.getConnection();
        String sql = "select * from product where productid=?";
        Product p = new Product();
        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, productID);
            rs = ps.executeQuery();
            if (rs.next()) {
                p.setProductid(rs.getInt("productid"));
                p.setProName(rs.getString("proname"));
                p.setPrice(rs.getInt("price"));
                p.setQuickOverview(rs.getString("quickoverview"));
                p.setProductDescription(rs.getString("productdescription"));
                p.setAddInformation(rs.getString("addinformation"));
                p.setReviews(rs.getString("reviews"));
                p.setP1(rs.getString("p1"));
                p.setP2(rs.getString("p2"));
                p.setP3(rs.getString("p3"));
                p.setType(rs.getString("type"));
                //System.out.println(p.getProductid());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(rs);
            Conn.release(ps);
            Conn.release(conn);
        }

        return p;

    }

    public int deleteProduct(String productID) {
        String sql = "delete from product where productid=?";
        int i = 0;

        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(productID));
            i = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(ps);
            Conn.release(conn);
        }
        return i;
    }

    public ArrayList<Product> showAllProducts() {
        ArrayList<Product> groups = new ArrayList<>();
        String sql = "select * from product";

        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setProductid(rs.getInt("productid"));
                p.setProName(rs.getString("proName"));
                p.setPrice(rs.getInt("price"));
                p.setQuickOverview(rs.getString("quickOverview"));
                p.setProductDescription(rs.getString("productDescription"));
                p.setAddInformation(rs.getString("addinformation"));
                p.setReviews(rs.getString("reviews"));
                p.setP1(rs.getString("p1"));
                p.setP2(rs.getString("p2"));
                p.setP3(rs.getString("p3"));
                p.setType(rs.getString("type"));
                groups.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(rs);
            Conn.release(ps);
            Conn.release(conn);
        }
        //System.out.println("groups:"+groups);
        return groups;
    }

    public ArrayList<CartItem> getCartItems(String userID) {
        ArrayList<CartItem> groups = new ArrayList<>();
        String sql = "select distinct * from cart,product where cart.userid=? and cart.productid=product.productid";

        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                CartItem temp = new CartItem();
                Product p = new Product();
                temp.setCartItemID(rs.getInt("cart.cartItemID"));
                p.setProductid(rs.getInt("productid"));
                p.setProName(rs.getString("proName"));
                p.setPrice(rs.getInt("price"));
                p.setQuickOverview(rs.getString("quickOverview"));
                p.setProductDescription(rs.getString("productDescription"));
                p.setAddInformation(rs.getString("addinformation"));
                p.setReviews(rs.getString("reviews"));
                p.setP1(rs.getString("p1"));
                p.setP2(rs.getString("p2"));
                p.setP3(rs.getString("p3"));
                p.setType(rs.getString("type"));
                temp.setP(p);
                temp.setUserID(rs.getString("userID"));
                temp.setCount(rs.getInt("Count"));
                //System.out.println(rs.getInt("size"));
                temp.setSize(rs.getInt("size"));
                groups.add(temp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(rs);
            Conn.release(ps);
            Conn.release(conn);
        }
        //System.out.println("groups:"+groups);
        return groups;
    }

    public int addItem2Cart(Product p, String userID, int size, int count) {
        String sql1 = "insert into cart(productID,userID,size,count) values (?,?,?,?)";
        String sql2 = "update cart set count=count+"+count+" where productid=? and userid=? and size=?";
        int i = 0;
        try {
            int check = checkProductInCart(p,userID,size,count);
            System.out.println("check:"+check);
            if(check==0) {
                conn = Conn.getConnection();
                ps = conn.prepareStatement(sql1);
                ps.setInt(1, p.getProductid());
                ps.setString(2, userID);
                ps.setInt(3, size);
                ps.setInt(4, count);
                i = ps.executeUpdate();
            } else if(check==1){
                conn = Conn.getConnection();
                ps = conn.prepareStatement(sql2);
                ps.setInt(1,p.getProductid());
                ps.setString(2,userID);
                ps.setInt(3,size);
                i = ps.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(ps);
            Conn.release(conn);
        }
        return i;
    }

    public int checkProductInCart(Product p,String userID, int size, int count) {
        String sql = "select * from cart where productid=? and userid=? and size=?";
        int i = 0;

        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1,p.getProductid());
            ps.setString(2,userID);
            ps.setInt(3,size);
            rs = ps.executeQuery();
            if(rs.next()) {
                i = 1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(rs);
            Conn.release(ps);
            Conn.release(conn);
        }
        System.out.println("checkmethod:"+i);
        return i;
    }


    public int deleteFromCart(int cartID) {
        String sql = "delete from cart where cartItemID=?";
        int i = 0;

        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, cartID);
            i = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(ps);
            Conn.release(conn);
        }
        return i;
    }

    public int updateProductInformation(Product p) {
        String sql = "update product set proname=?,price=?,quickoverview=?,productDescription=?,addInformation=?,reviews=?,p1=?,p2=?,p3=?,type=? where productid=?";
        int i = 0;

        try {
            conn = Conn.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, p.getProName());
            ps.setDouble(2, p.getPrice());
            ps.setString(3, p.getQuickOverview());
            ps.setString(4, p.getProductDescription());
            ps.setString(5, p.getAddInformation());
            ps.setString(6, p.getReviews());
            ps.setString(7, p.getP1());
            ps.setString(8, p.getP2());
            ps.setString(9, p.getP3());
            ps.setString(10, p.getType());
            ps.setInt(11, p.getProductid());
            i = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            Conn.release(ps);
            Conn.release(conn);
        }
        return i;
    }

}

