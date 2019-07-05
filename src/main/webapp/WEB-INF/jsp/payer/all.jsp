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
        <div id="panel">
            <div id="accounts">
                <table class="mainTable">
                    <tr>
                        <th>Nazwa</th>
                        <th>Edycja</th>
                        <th>Usuń</th>
                    </tr>
                    <c:forEach items="${payers}" var="payer">
                        <tr>
                            <td>${payer.name}</td>
                            <td><a href="/admin/payer/edit/${payer.id}">Edytuj</a></td>
                            <td><a href="/admin/payer/delete/${payer.id}">Usuń</a></td>
                        </tr>
                    </c:forEach>
                </table>
                <div class="clear"></div>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>