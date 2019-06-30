<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Snake in The Pocket - Dodaj konto</title>
    <%@include file="../include/meta.jsp"%>
    <link rel="stylesheet" href="<c:url value="/css/admin.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">
</head>
<body>
<div id="container">
    <%@include file="../include/loggedMenu.jsp"%>
    <div id="adminContent">
        <%@include file="../include/sidebar.jsp"%>
        <div id="panel">
            <h2>Na pewno chcesz usunąć konto?</h2>
            <p>UWAGA: Po potwierdzeniu, nie będziesz mógł cofnąć tej akcji. Wraz z usunięciem stracisz dane
                dotyczące tego konta w raportach, a także usuniesz połączone z nim transakcje</p>
            <a href="/admin/account/deleteConfirm/${id}" class="deleteConfirmLink">POTWIERDZAM</a>
            <a href="/admin/account/" class="deleteConfirmLink">NIE, COFNIJ MNIE</a>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>