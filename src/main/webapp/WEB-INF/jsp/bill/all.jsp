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
    <script defer src="/js/sort.js"></script>
</head>
<body>
<div id="container">
    <%@include file="../include/loggedMenu.jsp" %>
    <div id="adminContent">
        <%@include file="../include/sidebar.jsp" %>
        <div id="panel">
            <div id="accounts">
                <c:if test="${fn:length(accounts) > 0}">
                    <div class="sortTransaction">
                        <select id="accountFiltr" class="soflow">
                            <c:forEach items="${accounts}" var="account">
                                <option value="${account.id}">${account.accountName}</option>
                            </c:forEach>
                        </select>
                        <button id="accountFiltrBtn" class="reportBtn">Filtruj</button><br/>
                        <select id="payerFiltr" class="soflow">
                            <c:forEach items="${payers}" var="payer">
                                <option value="${payer.id}">${payer.name}</option>
                            </c:forEach>
                        </select>
                        <button id="payerFiltrBtn" class="reportBtn">Filtruj</button><br/>
                        <select id="plusOrMinusFiltr" class="soflow">
                            <option value="true">Przychody</option>
                            <option value="false">Wydatki</option>
                        </select>
                        <button id="plusOrMinusBtn" class="reportBtn">Filtruj</button><br/>
                    </div>
                    <table class="mainTable">
                        <tr>
                            <th>Nr transakcji</th>
                            <th>Kto</th>
                            <th>Konto</th>
                            <th>Suma</th>
                            <th>Data</th>
                            <th>Szczegóły</th>
                            <th>Usuń</th>
                        </tr>
                        <c:choose>
                            <c:when test="${!empty bills}">
                                <c:forEach items="${bills}" var="bill">
                                    <tr>
                                        <td>${bill.id}</td>
                                        <td>${bill.payer.name}</td>
                                        <td>${bill.account.accountName}</td>
                                        <td><c:if test="${!bill.plusOrMinus}">-</c:if> ${bill.billValue} zł</td>
                                        <td>${bill.created}</td>
                                        <td><a href="/admin/transaction/billDetails/${bill.id}">Szczegóły</a></td>
                                        <td><a href="/admin/transaction/delete/${bill.id}">Usuń</a></td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <c:forEach items="${allBills}" var="bill">
                                    <tr>
                                        <td>${bill.id}</td>
                                        <td>${bill.payer.name}</td>
                                        <td>${bill.account.accountName}</td>
                                        <td><c:if test="${!bill.plusOrMinus}">-</c:if> ${bill.billValue} zł</td>
                                        <td>${bill.created}</td>
                                        <td><a href="/admin/transaction/billDetails/${bill.id}">Szczegóły</a></td>
                                        <td><a href="/admin/transaction/delete/${bill.id}">Usuń</a></td>
                                    </tr>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </table><br/>
                    <button class="reportBtn">
                        <a href="/admin/transaction/add">Dodaj nową transakcję</a>
                    </button><br/><br/>
                    <button class="reportBtn">
                        <a href="/admin/generate/pdf">Wygeneruj PDF - Wszystkie transakcje</a>
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