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
            <h2>Jaki okres chcesz sprawdzić?</h2>
            <select id="time">
                <option value="1">Ostatni miesiąc</option>
                <option value="3">Trzy miesiące</option>
                <option value="6">Sześć miesięcy</option>
                <option value="12">Ostatni rok</option>
                <option value="0">Od początku</option>
            </select><br/>
            <h2>Filtruj raporty po koncie</h2>
            <select id="accountToReport">
                <c:forEach items="${accounts}" var="account">
                    <option value="${account.id}">${account.accountName}</option>
                </c:forEach>
            </select>
            <button id="accountReportBtn">Filtruj po ogólnych danych z kont</button>
            <br/>
            <h2>Filtruj raporty po kategorii</h2>
            <select id="categoryToReport">
                <c:forEach items="${categories}" var="category">
                    <option value="${category.id}">${category.categoryName}</option>
                </c:forEach>
            </select>
            <button id="categoryReportBtn">Filtruj po kategoriach</button>
            <br/>
            <h2>Filtruj raporty po płatniku</h2>
            <select id="payerToReport">
                <c:forEach items="${payers}" var="payer">
                    <option value="${payer.id}">${payer.name}</option>
                </c:forEach>
            </select>
            <button id="payerReportBtn">Filtruj po płatnikach</button>
            <br/>
            <p>=====================================================</p><br/>
            <h2>WYNIKI</h2>
            Wydano: ${valueOnMinus}<br/>
            Przybyło: ${valueOnPlus}<br/>
            Difference: <c:set var="total" value="${valueOnPlus - valueOnMinus}"/><c:out value="${total}"/><br/>
            <p>=================</p><br/>
            <p>Lista wszystkich rachunków po filtrowaniu</p>
            <table>
                <tr>
                    <th>Data dodania</th>
                    <th>Bank</th>
                    <th>Na co wydano</th>
                    <th>Wartość rachunku</th>
                </tr>
                <c:forEach items="${reportBills}" var="bill">
                    <tr>
                        <td>${bill.created}</td>
                        <td>${bill.account.accountName}</td>
                        <td>
                            <c:forEach items="${bill.billDetails}" var="detail">
                                ${detail.category.categoryName},
                            </c:forEach>
                        </td>
                        <td>${bill.billValue}</td>
                        <c:if test="${bill.plusOrMinus}">
                            <td>WPŁYW!</td>
                        </c:if>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>