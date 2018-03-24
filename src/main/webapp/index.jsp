<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@page language="java" import="java.text.*" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <script type="text/javascript" src="js/jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="css/login.css"/>
</head>
<body>
    <div class="loginDiv">
        <form id="login" name="login" action="<%=basePath%>userBig/login" method="post" >
            <input class="text" type="hidden" id="j_username" name="j_username" value=""/>
            <table id="table3">
                <tr>
                    <th>用户名:</th>
                    <td class="textback"><input class="text" id="username" name="username" type="text" value="admin"/></td>
                    <td><div id="img2" class="img2"><img id="img1"/></div><div id="info" class="info"><div id="info2" class="info2"></div></div></td>
                </tr>
                <tr>
                    <th>密&nbsp&nbsp&nbsp码:</th>
                    <td class="textback"><input class="text" id="password" name="password" type="text" value="111111"/></td>
                    <td><div id="mima2" class="mima2"><em style="font-size: 25px;color:#7a20ed">密码强度:</em></div>
                        <div id="passStrength" ><div id="jindutiao"></div></div><div id="mima" ></div></td>
                </tr>
                <tr>
                    <th colspan="2">
                        <div class="buttonNew2">
                            <input class="buttonNew" value="登&nbsp&nbsp录" type="submit" onclick="onsub()"/>
                            <input class="buttonNew" value="注&nbsp&nbsp册" type="button" onclick="onRegister()"/>
                        </div>
                    </th>
                </tr>
            </table>
        </form>
    </div>
</body>
<script type="text/javascript" >

    $("#password").keyup(function () {
        var password = $("#password").val();
        new PasswordStrength().checkStrength(password);
    });

        /*检测用户名是否存在*/
        $("#username").blur(function (ev) {
            var username = $("#username").val();
            $.ajax({
                url:"<%=basePath%>userBig/confirmUsername",
                type:"POST",
                data:{"username":username},
                dataType:"JSON",
                success:function (msg) {
                    alert(msg.msg);
                    if ("NO" == msg.msg){//用户名存在
                        $("#info2").css("color","red");
                        $("#info2").text("用户名已经存在");
                        $("#img1").attr("src","images/error.png");

                    }else{//用户名不存在
                        $("#info2").css("color","green");
                        $("#info2").text("可以使用该用户名");
                        $("#img1").attr("src","images/success.png");
                    }
                }
            })
        });

        function PasswordStrength(){
        };
        PasswordStrength.prototype.checkStrength = function (val){
            debugger;
            var aLvTxt = ['','低','中','高'];
            var lv = 0;
            if(val.match(/[a-z]/g)){lv++;}
            if(val.match(/[0-9]/g)){lv++;}
            if(val.match(/(.[^a-z0-9])/g)){lv++;}
            if(val.length < 6){lv=0;}
            if(lv > 3){lv=3;}
            $("#mima").addClass('strengthLv' + lv);
            $("#mima").text(aLvTxt[lv]);
            $("#jindutiao").addClass('jindutiao' + lv);
        };

        /*跳转到注册页面*/
        function onRegister() {
            /*window.location.href = "<%=basePath%>userBig/register";*///在旧窗口打开
            window.open("<%=basePath%>userBig/register");//在新窗口打开

        };


</script>
</html>
