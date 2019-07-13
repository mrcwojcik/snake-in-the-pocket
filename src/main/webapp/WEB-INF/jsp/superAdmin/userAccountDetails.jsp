<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Szczegóły użytkownika - Snake in The Pocket</title>
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
                <table class="mainTable">
                    <tr>
                        <th>Nr rachunku</th>
                        <th>Wartość rachunku</th>
                        <th>Kategorie zakupowe</th>
                    </tr>
                        <c:forEach items="${bills}" var="bill">
                            <tr>
                                <td>${bill.id}</td>
                                <td>${bill.billValue}</td>
                                <td>
                                    <c:forEach items="${bill.billDetails}" var="detail">
                                        ${detail.category.categoryName},
                                    </c:forEach>
                                </td>
                            </tr>
                        </c:forEach>
                </table>

            </div><br/>
            <a href="/superAdmin/users">WRÓĆ DO LISTY USERÓW</a><br/>
            <a href="/superAdmin/">WRÓĆ DO GŁÓWNEGO PANELU</a>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>