<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Snake in The Pocket - Dashboard</title>
    <%@include file="../include/meta.jsp" %>
    <link rel="stylesheet" href="<c:url value="/css/admin.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">
    <script defer src="/js/report.js"></script>
</head>
<body>
<div id="container">
    <%@include file="../include/loggedMenu.jsp" %>
    <div id="adminContent">
        <%@include file="../include/sidebar.jsp" %>
        <div id="panel">
            <h3>Jaki okres chcesz sprawdzić?</h3>
            <select id="time" class="reportForm">
                <option value="1">Ostatni miesiąc</option>
                <option value="3">Trzy miesiące</option>
                <option value="6">Sześć miesięcy</option>
                <option value="12">Ostatni rok</option>
                <option value="0">Od początku</option>
            </select><br/>
            <h3>Filtruj raporty po koncie</h3>
            <select id="accountToReport" class="reportForm">
                <c:forEach items="${accounts}" var="account">
                    <option value="${account.id}">${account.accountName}</option>
                </c:forEach>
            </select>
            <button id="accountReportBtn" class="reportBtn">Filtruj po ogólnych danych z kont</button>
            <br/>
            <h3>Filtruj raporty po kategorii</h3>
            <select id="categoryToReport" class="reportForm">
                <c:forEach items="${categories}" var="category">
                    <option value="${category.id}">${category.categoryName}</option>
                </c:forEach>
            </select>
            <button id="categoryReportBtn" class="reportBtn">Filtruj po kategoriach</button>
            <br/>
            <h3>Filtruj raporty po płatniku</h3>
            <select id="payerToReport" class="reportForm">
                <c:forEach items="${payers}" var="payer">
                    <option value="${payer.id}">${payer.name}</option>
                </c:forEach>
            </select>
            <button id="payerReportBtn" class="reportBtn">Filtruj po płatnikach</button>
            <br/>
            <p>=====================================================</p><br/>
            <c:if test="${!empty reportBills}">
                <h2>WYNIKI</h2>
                Wydano: ${valueOnMinus} zł<br/>
                Przybyło: ${valueOnPlus} zł<br/>
                Difference: <c:set var="total" value="${valueOnPlus - valueOnMinus}"/><c:out value="${total}"/> zł<br/>
                <p>=================</p><br/>
                <p>Lista wszystkich rachunków po filtrowaniu</p>
                <table class="mainTable">
                    <tr>
                        <th>Data dodania</th>
                        <th>Bank</th>
                        <th>Na co wydano</th>
                        <th>Wartość rachunku</th>
                    </tr>
                    <c:forEach items="${reportBills}" var="bill">
                        <c:if test="${bill.plusOrMinus}">
                            <tr class="incomeRow">
                        </c:if>
                        <c:if test="${!bill.plusOrMinus}">
                            <tr>
                        </c:if>
                            <td>${bill.created}</td>
                            <td>${bill.account.accountName}</td>
                            <td>
                                <c:forEach items="${bill.billDetails}" var="detail">
                                    ${detail.category.categoryName},
                                </c:forEach>
                            </td>
                            <td><c:if test="${!bill.plusOrMinus}">-</c:if> ${bill.billValue}zł</td>
                        </tr>
                    </c:forEach>
                </table>
            </c:if>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>