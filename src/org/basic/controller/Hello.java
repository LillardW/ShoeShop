package org.basic.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.basic.bean.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import org.basic.function.*;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class Hello {

    @Autowired
    private FunctionDaoImpl fdi;

    @RequestMapping("/hello")
    public String hello() {
        return "index";
    }

    @RequestMapping("/loginPage")
    public String loginPage(HttpSession session) {
        String tempUserID = (String) session.getAttribute("userID");
        if (tempUserID != null) {
            return "index";
        }
        return "login";
    }

    @RequestMapping("/login")
    public String login(HttpServletRequest res, HttpSession session) {
        User user = new User();
        String userID = res.getParameter("userID");
        String password = res.getParameter("password");
        user.setUserID(userID);
        user.setPassword(password);
        if (user.getUserID().equals("admin") && user.getPassword().equals("admin")) {
            session.setAttribute("userID", userID);
            return "adminBackground";
        }
        int i = fdi.userLogin(user);
        if (i == 1) {
            session.setAttribute("userID", userID);
            return "index";
        } else {
            String action = "login";
            session.setAttribute("action", action);
            return "error";
        }
    }

    @RequestMapping("/logout")
    public String logout(HttpServletRequest res, HttpSession session) {
        session.putValue("userID", null);
        return "index";
    }

    @RequestMapping("/registerPage")
    public String registerPage(HttpSession session) {
        String tempUserID = (String) session.getAttribute("userID");
        if (tempUserID != null) {
            return "index";
        }
        return "register";
    }

    @RequestMapping("/register")
    public String register(HttpServletRequest res, HttpSession session) {
        User user = new User();

        String userID = res.getParameter("userID");
        if(userID.equals("")) {
            userID = null;
        }
        String password = res.getParameter("password");
        if (password.equals("")) {
            password = null;
        }
        String userAccount = res.getParameter("userAccount");
        if (userAccount.equals("")) {
            userAccount = null;
        }
        String address = res.getParameter("address");
        if (address.equals("")) {
            address = null;
        }
        String mobile = res.getParameter("mobile");
        if (mobile.equals("")) {
            mobile = null;
        }
        user.setUserID(userID);
        user.setPassword(password);
        user.setAddress(address);
        user.setMobile(mobile);
        user.setUserAccount(userAccount);
        user.setIcon("000001");
        int i = fdi.userRegister(user);
        if (i == 1) {
            return "index";
        } else {
            String action = "register";
            session.setAttribute("action", action);
            return "error";
        }
    }

    @RequestMapping("/sales")
    public String sales(HttpServletRequest res, Model model) throws SQLException {
        int pageNum = 0;
        if (null == res.getParameter("pageNum"))
            pageNum = 1;
        else
            pageNum = Integer.parseInt(res.getParameter("pageNum"));

        ArrayList<Product> inform = fdi.showpage(pageNum);
        model.addAttribute("products", inform);

        int itemCount = fdi.showAllProducts().size();
        model.addAttribute("itemCount",itemCount);
        return "sales";
    }

    @RequestMapping("/single")
    public String single(HttpServletRequest res, HttpSession session) throws SQLException {
        String productID = res.getParameter("productID");
        Product p = fdi.searchProduct(productID);
        session.setAttribute("p", p);
        return "single";
    }

    @RequestMapping("/searchProduct")
    public String searchProduct(HttpServletRequest request, HttpSession session) {
        String keyword = request.getParameter("keyword");
        System.out.println(keyword);
        ArrayList<Product> productCollection = fdi.searchProductByKeyword(keyword);
        session.setAttribute("productCollection",productCollection);
        return "searchProduct";
    }

    @RequestMapping("/cart")
    public String cart(HttpServletRequest request, HttpSession session, Map<String, Object> ci) {

        String userID = (String) session.getAttribute("userID");
        ci.put("ci", fdi.getCartItems(userID));
        return "cart";
    }

    @RequestMapping("/add2Cart")
    public String add2Cart(HttpServletRequest request, HttpSession session, Model model) {
        String userID = (String) session.getAttribute("userID");
        System.out.println(userID);
        Product p = (Product) session.getAttribute("p");
        int count = Integer.parseInt(request.getParameter("count"));
        int size = Integer.parseInt(request.getParameter("size"));
        if(fdi.addItem2Cart(p,userID,size,count)==1) {
            ArrayList<CartItem> ci = fdi.getCartItems(userID);
            model.addAttribute("ci", ci);
            return "cart";
        } else {
            session.setAttribute("action",null);
            return "error";
        }
    }

    @RequestMapping("/deleteFromCart")
    public String deleteFromCart(HttpServletRequest request, HttpSession session, Model model) {

        String cartID = request.getParameter("cartID");
        fdi.deleteFromCart(Integer.parseInt(cartID));
        String userID = (String) session.getAttribute("userID");
        ArrayList<CartItem> ci = fdi.getCartItems(userID);
        model.addAttribute("ci", ci);
        return "cart";
    }

    @RequestMapping("/order")
    public String order(HttpServletRequest request, HttpSession session, Model model) {
        String userID = (String) session.getAttribute("userID");
        Collection<Order> order = fdi.userCheckOrder(userID);
        model.addAttribute("orders",order);
        return "order";
    }

    @RequestMapping("/adminBackground")
    public String adminBackground(HttpServletRequest request, HttpSession session) {
        return "adminBackground";
    }

    @RequestMapping("/adminUserManagement")
    public String adminUserManagement(HttpServletRequest request, HttpSession session,Model model) {
        ArrayList<User> users = fdi.showAllUsers();
        model.addAttribute("users",users);
        return "adminUserManagement";
    }

    @RequestMapping("/adminProductManagement")
    public String adminItemManagement(HttpServletRequest request, HttpSession session, Model model) {
        ArrayList<Product> products = fdi.showAllProducts();
        model.addAttribute("products", products);
        return "adminProductManagement";
    }

    @RequestMapping("/adminOrderManagement")
    public String adminOrderManagement(HttpServletRequest request, HttpSession session,Model model) {
        ArrayList<Order> orders = fdi.showAllOrders();
        model.addAttribute("orders",orders);
        return "adminOrderManagement";
    }

    @RequestMapping("/productDetail")
    public String productDetail(HttpServletRequest request, HttpSession session, Model model) {
        String productID = request.getParameter("productid");
        Product p = fdi.searchProduct(productID);
        ArrayList<Product> temp = new ArrayList<Product>();
        temp.add(p);
        model.addAttribute("product", temp);
        return "productDetail";
    }

    @RequestMapping("/updateProductDetail")
    public String updateProductDetail(HttpServletRequest request, HttpSession session) {
        Product p = new Product();
        p.setProductid(Integer.parseInt(request.getParameter("productid")));
        p.setProName((String) request.getParameter("proName"));
        p.setPrice(Integer.parseInt(request.getParameter("price")));
        p.setQuickOverview(request.getParameter("quickOverview"));
        p.setProductDescription((String) request.getParameter("productDescription"));
        p.setAddInformation((String) request.getParameter("addInformation"));
        p.setReviews((String) request.getParameter("reviews"));
        p.setType((String) request.getParameter("type"));
        p.setP1((String) request.getParameter("p1"));
        p.setP2((String) request.getParameter("p2"));
        p.setP3((String) request.getParameter("p3"));
        int i = fdi.updateProductInformation(p);
        if (i == 1) {
            return "adminProductManagement";
        } else {
            return "adminError";
        }
    }

    @RequestMapping("/deleteProduct")
    public String deleteProduct(HttpServletRequest request, HttpSession session) {
        String productID = request.getParameter("productID");
        int i = fdi.deleteProduct(productID);
        if (i == 1) {
            return "adminProductManagement";
        } else {
            return "adminError";
        }
    }

    @RequestMapping("/adminAddProduct")
    public String adminAddProduct() {
        return "adminAddProduct";
    }

    @RequestMapping("addProduct")
    public String addProduct(HttpServletRequest request,@RequestParam("proName") String proName) {
        Product p = new Product();
        //System.out.println(proName);
        p.setProName((String) request.getParameter("proName"));
        p.setPrice(Integer.parseInt(request.getParameter("price")));
        p.setQuickOverview(request.getParameter("quickOverview"));
        p.setProductDescription((String) request.getParameter("productDescription"));
        p.setAddInformation((String) request.getParameter("addInformation"));
        p.setReviews((String) request.getParameter("reviews"));
        p.setType((String) request.getParameter("type"));
        p.setP1((String) request.getParameter("p1"));
        p.setP2((String) request.getParameter("p2"));
        p.setP3((String) request.getParameter("p3"));
        int i = fdi.addProduct(p);
        if (i == 1) {
            return "/adminProductManagement";
        } else {
            return "adminError";
        }
    }

    @RequestMapping("/userDetail")
    public String userDetail(HttpServletRequest request, HttpSession session, Model model) {
        String userID = request.getParameter("userID");
        User u = fdi.searchUser(userID);
        ArrayList<User> temp = new ArrayList<>();
        temp.add(u);
        model.addAttribute("user", temp);
        return "userDetail";
    }

    @RequestMapping("/updateUserDetail")
    public String updateUserDetail(HttpServletRequest request, HttpSession session) {
        User u = new User();
        u.setUserID(request.getParameter("userID"));
        u.setUserAccount(request.getParameter("userAccount"));
        u.setPassword(request.getParameter("password"));
        u.setAddress(request.getParameter("address"));
        u.setMobile(request.getParameter("mobile"));
        u.setIcon(request.getParameter("icon"));
        int i = fdi.userUpdateProfile(u);
        if (i == 1) {
            return "adminUserManagement";
        } else {
            return "adminError";
        }
    }

    @RequestMapping("/deleteFromUser")
    public String deleteFromUser(HttpServletRequest request,HttpSession session) {
        String userID = request.getParameter("userID");
        int i = fdi.deleteUser(userID);
        if (i == 1) {
            return "adminUserManagement";
        } else {
            return "adminError";
        }
    }

    @RequestMapping("/deleteFromOrder")
    public String deleteFromOrder(HttpServletRequest request,HttpSession session) {
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        int i = fdi.deleteOrder(orderID);
        if (i == 1) {
            return "adminUserManagement";
        } else {
            return "adminError";
        }
    }

    @RequestMapping("/adminOrderDetail")
    public String adminOrderDetail(HttpServletRequest request, HttpSession session, Model model) {
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        ArrayList<OrderDetail> temp = fdi.adminOrderDetail(orderID);
        model.addAttribute("orderDetail", temp);
        return "adminOrderDetail";
    }

    @RequestMapping("/payment")
    public String payment(HttpServletRequest request, HttpSession session,Model model) {
        String userID = (String) session.getAttribute("userID");
        //System.out.println(userID);
        String address = fdi.userAddress(userID);
        fdi.newOrder(new Order(1,userID,null,address,0));
        int orderID = fdi.orderIDGetter(userID);
        ArrayList<CartItem> cart = fdi.getCartItems(userID);
        for(int i=0;i<cart.size();i++) {
            fdi.addOrderDetail(orderID,cart.get(i).getP().getProductid(),cart.get(i).getP().getProName(),cart.get(i).getP().getPrice(),cart.get(i).getSize(),cart.get(i).getCount());
        }
        fdi.clearCart(userID);
        Collection<Order> order = fdi.userCheckOrder(userID);
        model.addAttribute("orders",order);
        return "order";
    }

    @RequestMapping("/userCheckOrder")
    public String userCheckOrder(HttpServletRequest request, HttpSession session,Model model) {
        String userID = (String) session.getAttribute("userID");
        ArrayList<Order> order = fdi.userCheckOrder(userID);
        model.addAttribute("orders",order);
        return "userCheckOrder";
    }

    @RequestMapping("/orderDetail")
    public String userCheckOrderDetail(HttpServletRequest request, HttpSession session,Model model) {
        //String userID = (String) session.getAttribute("userID");
        int orderID = Integer.parseInt(request.getParameter("orderID"));
        ArrayList<OrderDetail> orderDetail = fdi.orderDetail(orderID);
        model.addAttribute("orderDetail",orderDetail);
        return "orderDetail";
    }
}
