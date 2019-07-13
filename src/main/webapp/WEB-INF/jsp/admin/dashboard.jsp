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
                    <h2>Konta:</h2>
                    <table class="mainTable">
                        <tr>
                            <th>Nazwa konta</th>
                            <th>Bank</th>
                            <th>Stan konta</th>
                            <th colspan="2">Szczegóły</th>
                            <th>Transakcje</th>
                        </tr>
                        <c:forEach items="${accounts}" var="account">
                            <tr>
                                <td>${account.accountName}</td>
                                <td>${account.bank.name}</td>
                                <td>${account.actualBalance} zł</td>
                                <td colspan="2"><a href="/admin/transaction/bills/account/${account.id}">Szczegóły</a>
                                </td>
                                <td><a href="/admin/transaction/add/${account.id}">DODAJ</a></td>
                            </tr>
                        </c:forEach>
                    </table>
                    <a href="/admin/account/">Przejdź do listy kont</a>
                    <h2>Transakcje dla tych kont</h2>
                    <c:if test="${fn:length(allBills) > 0}">
                        <table class="mainTable">
                            <tr>
                                <th>Nr transakcji</th>
                                <th>Kto</th>
                                <th>Konto</th>
                                <th>Suma</th>
                                <th>Data</th>
                            </tr>
                            <c:forEach items="${allBills}" var="bill">
                                <tr>
                                    <td>${bill.id}</td>
                                    <td>${bill.payer.name}</td>
                                    <td>${bill.account.accountName}</td>
                                    <td><c:if test="${!bill.plusOrMinus}">-</c:if> ${bill.billValue} zł</td>
                                    <td>${bill.created}</td>
                                </tr>
                            </c:forEach>
                        </table>
                        <a href="/admin/transaction/">Przejdź do listy transakcji</a>
                    </c:if>
                    <c:if test="${fn:length(allBills) == 0}">
                        <a href="/admin/transaction/add">Dodaj pierwszy rachunek</a>
                    </c:if>
                    <h2>Cele</h2>
                    <c:if test="${fn:length(goals) > 0}">
                    <table class="mainTable">
                        <tr>
                            <th>Nazwa celu</th>
                            <th>Wartość celu:</th>
                        </tr>
                        <c:forEach items="${goals}" var="goal">
                            <tr>
                                <td>${goal.name}</td>
                                <td>${goal.goalValue} zł</td>
                            </tr>
                        </c:forEach>
                    </table>
                    <a href="/admin/goals/">Przejdź do listy celów</a>
                    </c:if>
                    <c:if test="${fn:length(goals) == 0}">
                        <a href="/admin/goals/add">Dodaj pierwszy cel</a>
                    </c:if>
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