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
            <div id="goals">
                <table>
                    <tr>
                        <th>Nazwa celu</th>
                        <th>Wartość celu:</th>
                        <th>Edycja</th>
                        <th>Usuń</th>
                    </tr>
                    <c:forEach items="${goals}" var="goal">
                        <tr>
                            <td>${goal.name}</td>
                            <td>${goal.goalValue} zł</td>
                            <td><a href="/admin/goals/edit/${goal.id}">Edytuj</a></td>
                            <td><a href="/admin/goals/delete/${goal.id}">Usuń</a> </td>
                        </tr>
                    </c:forEach>
                </table>
                <br/>
                <h2>Obliczenia dla celu:</h2>
                <p>Wybierz, dla jakich kont chcesz policzyć ile brakuje do realizacji celu:</p>
                <form:form modelAttribute="goalCalculate" method="post">
                    <form:select path="accounts" multiple="true" items="${accounts}" itemValue="id" itemLabel="nameAndBalance"></form:select><br/>
                    <form:select path="goal" items="${goals}" itemValue="id" itemLabel="name"></form:select>
                    <input type="submit" value="Oblicz"/>
                </form:form>
                <c:if test="${!empty calculate}">
                    <div>
                        Dla wybranych przez Ciebie kont i celu:<br/>
                        Tyle masz na kontach: ${calculate.actualStatus} zł<br/>
                        Tyle Ci brakuje, żeby spełnić cel: ${calculate.difference} zł<br/>
                        Taki status realizacji masz zrobiony: ${calculate.goalStatus}%<br/>
                    </div>
                </c:if>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>