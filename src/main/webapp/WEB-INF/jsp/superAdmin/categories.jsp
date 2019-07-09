<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
                <a href="/superAdmin/add/category/">Dodaj nową kategorię</a><br/>
                <table class="mainTable">
                    <tr>
                        <th>ID</th>
                        <th>NAZWA</th>
                        <th>Edycja</th>
<%--                        <th>Usuń</th>--%>
                    </tr>
                    <c:forEach items="${categories}" var="category">
                        <tr>
                            <td>${category.id}</td>
                            <td>${category.categoryName}</td>
                            <td><a href="/superAdmin//edit/category/${category.id}">Edytuj</a> </td>
<%--                            <td><a href="/superAdmin/delete/category/${category.id}">Delete</a> </td>--%>
                        </tr>
                    </c:forEach>
                </table><br/>
                <a href="/superAdmin/">WRÓĆ DO GŁÓWNEGO PANELU</a>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>