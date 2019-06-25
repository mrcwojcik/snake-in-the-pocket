<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Snake in The Pocket</title>
    <%@include file="include/meta.jsp"%>
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">

</head>
<body>
<div id="container">
    <%@include file="include/homeMenu.jsp"%>
    <div id="content">
       <img src="https://i.ibb.co/vj3wy9Z/e-o.png" alt="e-o" border="0"></a>
    </div>
    <div id="buttonsSection">
        <a href="/login" class="myButton">Logowanie</a>
        <a href="/register" class="myButton">Rejestracja</a>
    </div>
</div>
</body>
</html>