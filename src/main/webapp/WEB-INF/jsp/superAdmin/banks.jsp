<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <title>Lista banków - Snake in The Pocket</title>
    <%@include file="../include/meta.jsp" %>
    <link rel="stylesheet" href="<c:url value="/css/admin.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">
</head>
<body>
<div id="container">
    <div id="adminContent">
        <div id="panel">
            <div id="accounts">
                <a href="/superAdmin/add/bank/">Dodaj nowy bank</a><br/>
                <table class="mainTable">
                    <tr>
                        <th>ID</th>
                        <th>NAZWA</th>
                        <th>Edycja</th>
<%--                        <th>Usuń</th>--%>
                    </tr>
                    <c:forEach items="${banks}" var="bank">
                        <tr>
                            <td>${bank.id}</td>
                            <td>${bank.name}</td>
                            <td><a href="/superAdmin//edit/bank/${bank.id}">Edytuj</a> </td>
<%--                            <td><a href="/superAdmin/delete/bank/${bank.id}">Delete</a> </td>--%>
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