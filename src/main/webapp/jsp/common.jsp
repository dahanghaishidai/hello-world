<%@page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@page language="java" import="java.text.*" %>
<!doctype html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>