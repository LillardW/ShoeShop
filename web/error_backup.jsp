<%--
  Created by IntelliJ IDEA.
  User: aa444
  Date: 2017/4/5
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String action = (String) session.getAttribute("action");
    String word = null;
    if (action.equals("login")) {
        word = "登录";
    } else if (action.equals("register")) {
        word = "注册";
    } else if (action == null) {
        out.print("null");
    }
    out.print(word);
    session.putValue("action",null);
%>失败，<a href="index.jsp">返回首页</a>
</body>
</html>
