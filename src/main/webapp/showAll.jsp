<%@ page language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'index.jsp' starting page</title>

    <!-- 引入jQuery脚本库和easyUI脚本库，jQuery脚本库必须在上面！！！easyUI脚本库在下面 -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min1.3.5.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min1.3.5.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/easyui-lang-zh_CN1.3.5.js"></script>

    <!-- 引入css文件 -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/themes/icon.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/themes/default/easyui.css">
    <script type="text/javascript">
        $(function () {
            //修改弹窗的样式=======(START)======
            $("#updateuse").dialog({
                //modal:true,
                title: "修改信息",
                //resizable:true,
                closed: true,
                width: 500,
                height: 350,
            });
            //修改弹窗的样式=======(END)======

            //添加弹窗的点击按钮的样式和约束
            $("#querenAdd").linkbutton();
            //$("#querenAdd").linkbutton("disable");

            //展示数据==================【START】====================
            $("#myTable").datagrid({
                url: "pageStudent.long",
                title: "学生信息表",
                pagination: true,
                singleSelect: true,
                width: 700,
                columns: [[
                    {field: "id", title: "学号", align: "center", width: 100},
                    {field: "name", title: "姓名", align: "center", width: 100},
                    {field: "sex", title: "性别", align: "center", width: 100},
                    {field: "age", title: "年龄", align: "center", width: 100},
                    {field: "score", title: "成绩", align: "center", width: 100},
                    {
                        title: "操作", field: "renyi", align: "center",
                        //value:值，属性获取到的值
                        //rowData:行对象，一个js对象
                        //rowIndex:行索引，行号
                        formatter: function (value, rowData, rowIndex) {
                            //alert(rowData.type);
                            return "<a href='JavaScript:void(0)' onclick='updateOne(" + rowData.id + ")' style='color:blue'>修改</a>|" +
                                "<a href='JavaScript:void(0)' onclick='deleteOne(" + rowData.id + ")' style='color:#5e57ff'>删除</a>";
                        }
                    }
                ]]
            });
            //展示数据===================【END】=====================

            //搜索框效果================【START】================
            $("#ss").searchbox({
                //height:18,
                searcher: function (value, name) {
                    //alert(value + "," + name)
                    $("#myTable").datagrid("load", {"name": value});
                    $("#ss").val(" ");
                },
                //menu:"#mm",
                prompt: "请输入搜索内容",
            });
            //搜索框效果================【END】==================


            //顶部工具栏================【START】================
            $("#myTable").datagrid({
                toolbar: "#tb",
            });
            //顶部工具栏=================【END】================
            $("#dd").dialog({
                title: "My Dialog",
                width: 600,
                height: 400,
                closed: true,
                cache: false,
                modal: true,
            });

        });

        //修改-->查询=====================
        function updateOne(id) {
            alert(id);
            $.ajax({
                url: "selectOne.long",
                data: "id=" + id,
                type: "post",
                async: false,
                success: function (dat) {
                    alert(dat.student);
                    console.log(dat.student.name);
                    console.log(dat.student.sex);
                    console.log(dat.student.age);
                    console.log(dat.student.score);
                    $("#updateId").val(dat.student.id);
                    $("#updateName").val(dat.student.name);
                    $("#updateSex").val(dat.student.sex);
                    $("#updateAge").val(dat.student.age);
                    $("#updateScore").val(dat.student.score);
                    $("#updateuse").panel("open");
                }
            });
        }

        //修改-->查询=====================


        //单个删除====================
        function deleteOne(id) {
            alert(id);
            $.ajax({
                url: "delete.long",
                data: "id=" + id,
                type: "post",
                async: false,
                success: function (dat) {
                    $("bods").panel("refresh", "main.jsp");
                }
            });
        }

        //单个删除====================


        //维护，添加选项--->form表单提交================【START】================
        function querenAdd() {
            $("#addForm").form("submit", {

                url: "insertStudent.long",
                success: function (data) {
                    alert(data == "true");
                    if (data == "true") {
                        alert("添加成功！");
                        //$("#addVote").panel("refresh");
                        // 调用 'refresh' 方法更新选项卡面板的内容
                        var tab = $("#tt").tabs("getSelected");  // 获取选择的面板
                        tab.panel("refresh", "main.jsp");

                    } else {
                        alert("添加失败！");
                    }
                },
            });
        }

        //维护，添加选项--->form表单提交================【END】==================


        //修改选项--->form表单提交================【START】================
        function updateForm() {
            $("#updateForm").form("submit", {

                url: "update.long",
                success: function (data) {
                    alert(data == "true");
                    if (data == "true") {
                        alert("添加成功！");
                        //$("#addVote").panel("refresh");
                        // 调用 'refresh' 方法更新选项卡面板的内容
                        var tab = $("#tt").tabs("getSelected");  // 获取选择的面板
                        tab.panel("refresh", "main.jsp");

                    } else {
                        alert("添加失败！");
                    }
                },
            });
        }

        //修改选项--->form表单提交================【END】==================


        //点击注册，显示（注册）窗口=======(START)======
        function studentAdd() {
            $("#dd").panel("open", true);
        };
        //点击注册，显示（注册）窗口=======(END)======

    </script>
</head>

<body id="bods">
<table id="myTable"></table>
<div id="tb">
    <a id="btn" href="JavaScript:void(0)" class="easyui-linkbutton" onclick="studentAdd()"
       data-options="iconCls:'icon-add'">添加</a><br/>
    <input id="ss" align="top"></input>
</div>

<div id="dd">
    <form id="addForm">
        <table align="center">
            <tr>
                <td>姓名:</td>
                <td><input type="text" name="name"/></td>
            </tr>
            <tr>
                <td>性别:</td>
                <td><input type="text" name="sex"/></td>
            </tr>
            <tr>
                <td>年龄:</td>
                <td><input type="text" name="age"/></td>
            </tr>
            <tr>
                <td>成绩:</td>
                <td><input type="text" name="score"/></td>
            </tr>
            <tr align="center">
                <td colspan="2">
                    <a id="querenAdd" onclick="querenAdd()">确认添加</a>
                </td>
            </tr>
        </table>
    </form>
</div>
<!--  -->

<!-- 修改功能的弹窗 -->
<div id="updateuse" align="center">
    <form id="updateForm" method="post" align="center">
        <table>
            <tr align="center">
                <td>姓名:</td>
                <td>
                    <input type="hidden" id="updateId" name="id"/>
                    <input name="name" id="updateName"/>
                </td>
            </tr>
            <tr align="center">
                <td>性别:</td>
                <td>
                    <input name="sex" id="updateSex"/>
                </td>
            </tr>
            <tr align="center">
                <td>年龄:</td>
                <td>
                    <input name="age" id="updateAge"/>
                </td>
            </tr>
            <tr align="center">
                <td>成绩:</td>
                <td>
                    <input name="score" id="updateScore"/>
                </td>
            </tr>
            <tr align="center">
                <td>
                    <a href="JavaScript:void(0)" class="easyui-linkbutton" onclick="updateForm()"
                       data-options="iconCls:'icon-ok'">修改</a>
                </td>
            </tr>
        </table>
    </form>
</div>


</body>
</html>
