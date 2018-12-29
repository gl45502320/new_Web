<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'add.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.js"></script>
    <script type="text/javascript">
        var i = 1;

        function add() {
            $("#addspan").append(
                "<table align='center' border='1'  cellspacing='0'>" +
                "<tr>" +
                "<td>表名：</td>" +
                "<td>学生信息表NO：" + (i + 1) + "</td>" +
                "</tr>" +
                "<tr>" +
                "<td>姓名：</td>" +
                "<td><input type='text' name='lists[" + i + "].name' /></td>" +
                "</tr>" +
                "<tr>" +
                "<td>性别：</td>" +
                "<td><input type='text' name='lists[" + i + "].sex' /></td>" +
                "</tr>" +
                "<tr>" +
                "<td>年龄：</td>" +
                "<td><input type='text' name='lists[" + i + "].age' /></td>" +
                "</tr>" +
                "<tr>" +
                "<td>成绩：</td>" +
                "<td><input type='text' name='lists[" + i + "].score' /></td>" +
                "<tr>" +
                "</table>" +
                "<br>"
            );
            i++;
        }

    </script>

</head>

<body>
<h1 align="center">添加学生信息</h1>
<hr color="aqua"/>
<br/>
<form action="${pageContext.request.contextPath}/much.long" method="get">
    <table align="center" border="1" cellspacing="0">
				<span id="addspan">
					<tr>
						<td>表名：</td>
						<td>学生信息表NO：1</td>
					</tr>
					<tr>
						<td>姓名：</td>
						<td><input type="text" name="lists[0].name"/></td>
					</tr>
					<tr>
						<td>性别：</td>
						<td><input type="text" name="lists[0].sex"/></td>
					</tr>
					<tr>
						<td>年龄：</td>
						<td><input type="text" name="lists[0].age"/></td>
					</tr>
					<tr>
						<td>成绩：</td>
						<td><input type="text" name="lists[0].score"/></td>
					</tr>
				</span>
    </table>
    <p align="center">
        <input align="middle" type="button" value="再次添加" onclick="add()"/>
        <input align="middle" type="submit" value="提交"/>
    </p>
</form>
</body>
</html>
