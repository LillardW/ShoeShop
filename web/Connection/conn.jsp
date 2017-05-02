<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

    
    <title>My JSP 'conn.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
<%   //连接数据库
String sDBDriver = "com.mysql.jdbc.Driver";
Class.forName(sDBDriver);
String sConnStr = "jdbc:mysql://localhost:3306/bookdb?useUnicode=true&amp;characterEncoding=UTF-8";    
String username="root";
String password="123456";
Connection con = DriverManager.getConnection(sConnStr,username,password);
//out.print(con);
//Statement stmt = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
//ResultSet result=null;
 %> 
  </body>
</html>
