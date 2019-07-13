<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <title>Panel Admina - Snake in The Pocket</title>
    <%@include file="../include/meta.jsp" %>
    <link rel="stylesheet" href="<c:url value="/css/admin.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">
</head>
<body>
<div id="container">
    <div id="adminContent">
        <div id="panel">
            <div id="accounts">
                <a href="/superAdmin/users">Lista użytkowników</a><Br/>
                <a href="/superAdmin/categories">Lista kategorii</a><br/>
                <a href="/superAdmin/banks">Lista banków</a><br/>
                ------<br/>
                <a href="/superAdmin/logout">Wyloguj się</a>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>