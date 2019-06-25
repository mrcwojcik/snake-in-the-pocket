<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Snake in The Pocket - Dashboard</title>
    <%@include file="../include/meta.jsp"%>
    <link rel="stylesheet" href="<c:url value="/css/admin.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">

</head>
<body>
<div id="container">
    <%@include file="../include/loggedMenu.jsp"%>
    <div id="adminContent">
        <%@include file="../include/sidebar.jsp"%>
        <div id="dashboardPanel">
            <div id="accounts">
                <c:forEach items="${payers}" var="payer">
                    <div class="account">${payer.name}</div>
                </c:forEach>
                <div class="clear"></div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>