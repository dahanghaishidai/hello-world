<%@ page language="java" import="java.util.*" contentType="text/html;charset=gbk" pageEncoding="gbk"%>
<html>
<head>
    <%@include file="/jsp/common.jsp"%>
</head>
<body>
<form action="<%=basePath%>multipartTestController/pickUp" enctype="multipart/form-data" method="post">
    <input type="text" name="username" /><br />
    <input type="file" name="myfile" /><br/>
    <input type="file" name="myfile" /><br/>
    <input type="submit" />
</form>
</body>
</html>