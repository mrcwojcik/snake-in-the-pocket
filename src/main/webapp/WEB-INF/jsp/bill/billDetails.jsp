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
    <%@include file="../include/loggedMenu.jsp" %>
    <div id="adminContent">
        <%@include file="../include/sidebar.jsp" %>
        <div id="panel">
            <div id="accounts">
                <table>
                    <tr>
                        <th>Nr transakcji</th>
                        <th>Kto</th>
                        <th>Plus or Minus</th>
                        <th>Konto</th>
                        <th>Suma</th>
                        <th>Data</th>
                    </tr>
                    <tr>
                        <td>${bill.id}</td>
                        <td>${bill.payer.name}</td>
                        <td>${bill.plusOrMinus}</td>
                        <td>${bill.account.accountName}</td>
                        <td>${bill.billValue}</td>
                        <td>${bill.created}</td>
                    </tr>
                </table>
                <h2>Szczegóły:</h2>
                <c:forEach items="${billDetails}" var="detail">
                    ${detail.category.categoryName}: ${detail.value} - <a href="/admin/transaction/deleteDetails/${bill.id}/${detail.id}">Usuń</a> <br/>
                </c:forEach>
                ==========<br/>
                Suma: ${bill.billValue}
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>