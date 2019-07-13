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
    <%@include file="../include/loggedMenu.jsp" %>
    <div id="adminContent">
        <%@include file="../include/sidebar.jsp" %>
        <div id="panel">
            <div id="accounts">
                <c:if test="${fn:length(accounts) > 0}">
                <table class="mainTable">
                    <tr>
                        <th>Nazwa konta</th>
                        <th>Bank</th>
                        <th>Stan konta</th>
                        <th colspan="2">Akcje</th>
                        <th>Dodaj transakcje</th>
                        <th>Szczegóły</th>
                    </tr>
                    <c:forEach items="${accounts}" var="account">
                        <tr>
                            <td>${account.accountName}</td>
                            <td>${account.bank.name}</td>
                            <td>${account.actualBalance} zł</td>
                            <td colspan="2"><a href="/admin/account/edit/${account.id}">Edytuj</a> | <a href="/admin/account/delete/${account.id}">Usuń</a></td>
                            <td><a href="/admin/transaction/add/${account.id}">Dodaj</a></td>
                            <td><a href="/admin/transaction/bills/account/${account.id}">Szczegóły</a> </td>
                        </tr>
                    </c:forEach>
                </table><br/><br/>
                    <button class="reportBtn">
                        <a href="/admin/account/add">Dodaj nowe konto</a>
                    </button>
                </c:if>
                <c:if test="${fn:length(accounts) == 0}">
                    Nie dodałeś jeszcze żadnych kont.<br/>
                    <a href="/admin/account/add">Dodaj swoje pierwsze konto</a>
                </c:if>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>