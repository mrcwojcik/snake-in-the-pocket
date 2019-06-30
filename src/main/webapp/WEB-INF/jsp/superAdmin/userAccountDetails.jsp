<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Snake in The Pocket - Dashboard</title>
    <%@include file="../include/meta.jsp" %>
    <link rel="stylesheet" href="<c:url value="/css/admin.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">
</head>
<body>
<div id="container">
    <div id="adminContent">
        <div id="panel">
            <div id="accounts">
                    <h2>Szczegóły:</h2>
                <c:forEach items="${bills}" var="detail">
                    ${detail.category.categoryName}: ${detail.value} <br/>
                </c:forEach>
            </div><br/>
            <a href="/superAdmin/users">WRÓĆ DO LISTY USERÓW</a><br/>
            <a href="/superAdmin/">WRÓĆ DO GŁÓWNEGO PANELU</a>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>