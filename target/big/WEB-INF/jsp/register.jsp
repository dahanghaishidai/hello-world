<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<!doctype html>
<html>
<head>
    <title>注册页面</title>
    <%@include file="/jsp/common.jsp"%>
    <style type="text/css">
        *{
            margin: 0px;
            padding: 0px;
        }
        body{
            background-color: #c7edcc;
        }
        .touxiang{
            width: 500px;
            height: 200px;
            background-color:#edcf40;
            margin: 0 auto;
        }
        .register{
            width: 500px;
            height: 200px;
            background-color:#edcf40;
            margin: 0 auto;
            margin-top: 0px;
        }
        .div1{
            width: 400px;
            height: 200px;
            margin: 0 auto;
            padding-top: 10px;
        }
        .table1{
            margin: 0 auto;
        }
        tr{
            height: 30px;
        }
        th{
            width: 100px;
        }
        .username, .password{
            width: 170px;
            height: 22px;
        }

        .save{
            width: 100px;
            height: 30px;
            margin-left: 88px;
            margin-top: 45px;
            text-align: center;
            font-size: 20px;
            background-color: #7088ed;
        }
        .headPic{
            height: 100px;
            width: 100px;
            margin-left: 30px;
            margin-top: 1px;
        }
        .picUp{
            width: 170px;
            height: 30px;
            margin-left: 55px;
        }
        .div2{
            width: 280px;
            height: 200px;
            margin: 0 auto;
        }
        .shangchuan{
            width: 100px;
            height: 30px;
            text-align: center;
            font-size: 20px;
            margin-left: 90px;
            margin-top: 10px;
            background-color: #be78c8;
        }

    </style>
</head>
<body>
    <div id="touxiang" class="touxiang">
        <form action="<%=basePath%>multipartTestController/pickUp" enctype="multipart/form-data" method="post">
            <div id="div2" class="div2">
                <table id="table2" class="table2">
                    <tr>
                        <th>头&nbsp&nbsp&nbsp像:</th>
                        <td><img id="headPic" class="headPic" src="<%=basePath%>/images/error.png"/></td>
                    </tr>
                    <tr>
                        <th colspan="2"><input id="picUp" name="picUp" class="picUp" type="file" multiple="multiple" accept="image/jpeg,image/png"/></th>
                    </tr>
                    <tr>
                        <td colspan="2"><input id="shangchuan" name="shangchuan" class="shangchuan" type="submit" value="上传"/></td>
                    </tr>
                </table>
            </div>

        </form>
    </div>
    <div id="register" class="register">

        <form id="form1" name="form1" action="<%=basePath%>/userBig/register" method="post">
            <div id="div1" class="div1">
                <table id="table1" class="table1">

                    <tr>
                        <th>用户名:</th>
                        <td><input id="username" name="username" class="username" type="text"/></td>
                    </tr>
                    <tr>
                        <th>密&nbsp&nbsp&nbsp码:</th>
                        <td><input id="password" name="password" class="password" type="text"/></td>
                    </tr>
                    <tr >
                        <td colspan="2"><input id="save" name="save" class="save" type="button" value="确定" onclick="confirmSave()"/></td>
                    </tr>
                </table>
            </div>
        </form>
    </div>
</body>
<script type="text/javascript">
    function confirmSave() {
        debugger;
        var headValue = $("#picUp").val();
        alert(headValue);
        $("#headPic").attr("src","<%=basePath%>/images/5.jpg");



    }
</script>
</html>