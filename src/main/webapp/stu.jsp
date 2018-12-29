<%@ page language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'stu.jsp' starting page</title>

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
<h1 align="center">修改学生信息</h1>
<hr color="aqua"/>
<br/>
<form action="${pageContext.request.contextPath}/update.long" method="get">
    <table align="center">
        <tr>
            <td>姓名：</td>
            <td>
                <input type="text" name="name" value="${requestScope.ss.name}"/>
                <input type="hidden" name="id" value="${requestScope.ss.id}"/>
            </td>
        </tr>
        <tr>
            <td>性别：</td>
            <td><input type="text" name="sex" value="${requestScope.ss.sex}"/></td>
        </tr>
        <tr>
            <td>年龄：</td>
            <td><input type="text" name="age" value="${requestScope.ss.age}"/></td>
        </tr>
        <tr>
            <td>成绩：</td>
            <td><input type="text" name="score" value="${requestScope.ss.score}"/></td>
        </tr>
    </table>
    <p align="center">
        <input align="middle" type="submit" value="添加"/>
    </p>
</form>
</body>
</html>
