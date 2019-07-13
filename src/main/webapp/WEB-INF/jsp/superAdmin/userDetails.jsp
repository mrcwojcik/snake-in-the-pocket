<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
                Imię i nazwisko: ${user.fullName}<br/>
                E-mail: ${user.email}<br/>

                <h2>Konta</h2>

                <table class="mainTable">
                    <tr>
                        <th>Nazwa konta</th>
                        <th>Stan konta</th>
                        <th>Szczegóły</th>
                    </tr>
                    <c:forEach items="${user.accounts}" var="account">
                        <tr>
                            <td>${account.accountName}</td>
                            <td>${account.actualBalance} zł</td>
                            <td><a href="/superAdmin/userDetails/account/${account.id}">Szczegóły</a> </td>
                        </tr>
                    </c:forEach>
                </table>

                <h2>Płatnicy</h2>
                <table class="mainTable">
                    <tr>
                        <th>Nazwa</th>
                    </tr>
                    <c:forEach items="${user.payers}" var="payer">
                        <tr>
                            <td>${payer.name}</td>
                        </tr>
                    </c:forEach>
                </table>

                <h2>Cele</h2>
                <table class="mainTable">
                    <tr>
                        <th>Nazwa celu</th>
                        <th>Wartość celu:</th>
                    </tr>
                    <c:forEach items="${user.goals}" var="goal">
                        <tr>
                            <td>${goal.name}</td>
                            <td>${goal.goalValue} zł</td>
                        </tr>
                    </c:forEach>
                </table>
                <a href="/superAdmin/users">WRÓĆ DO LISTY USERÓW</a><br/>
                <a href="/superAdmin/">WRÓĆ DO GŁÓWNEGO PANELU</a>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>