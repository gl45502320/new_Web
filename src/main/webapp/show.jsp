<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<body>
<h1 align="center">展示学生信息</h1>
<hr color=aqua/>
<form><br/>
    <table align="center" width="800"><br/>
        <tr>
            <td><a href="/student/private/adds.html"><img src="${pageContext.request.contextPath}/img/add.png"
                                                          width="25" height="25" align="left"/></a></td>
            <td align="right"><input type="text" align="right"/>&nbsp;<input type="button" value="搜索"/></td>
        </tr>
    </table>
</form>
<form action="/student/private/delectMany" method="post">
    <table align="center" width="800" border="1" cellspacing="0">
        <tr bgcolor="aqua" align="center" colo>
            <th><input type="submit" value="删除选中"/></th>
            <th></th>
            <th>ID</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>成绩</th>
            <th>删除</th>
            <th>修改</th>
        </tr>

        <c:forEach items="${requestScope.list}" var="b">
            <tr align="center">
                <td align="center"><input type="checkbox" name="ids" value="${b.id}"/></td>
                <td><img src="${pageContext.request.contextPath}/img/person1.png" width="25" height="20"/></td>
                <td>${b.id}</td>
                <td>${b.name}</td>
                <td>${b.sex}</td>
                <td>${b.age}</td>
                <td>${b.score}</td>
                <td><a href="/student/private/delete?id=${b.id}">删除</a></td>
                <td><a href="/student/private/ServletOne?id=${b.id}">修改</a></td>
            </tr>
        </c:forEach>
        <tr c>
            <th colspan="9">
                <a>首页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                <a>上一页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                0/0&nbsp;&nbsp;&nbsp;&nbsp;
                <a>尾页</a>&nbsp;&nbsp;&nbsp;&nbsp;
                <a>下一页</a>
            </th>
        </tr>
    </table>
</form>
</body>
</html>
