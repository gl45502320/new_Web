<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" pageEncoding="UTF-8" %>
<html>
<body>
<form>
    <table align="center" border="1">
        <tr align="center">
            <th>学号</th>
            <th>姓名</th>
            <th>性别</th>
            <th>年龄</th>
            <th>成绩</th>
            <th>删除</th>
            <th>修改</th>
        </tr>
        <c:forEach items="${requestScope.list}" var="itr">
            <tr align="center">
                <td>${itr.id}</td>
                <td>${itr.name}</td>
                <td>${itr.sex}</td>
                <td>${itr.age}</td>
                <td>${itr.score}</td>
                <td><a>删除</a></td>
                <td><a>修改</a></td>
            </tr>
        </c:forEach>
    </table>
</form>
</body>
</html>
