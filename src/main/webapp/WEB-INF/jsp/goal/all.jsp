<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Snake in The Pocket - Dashboard</title>
    <%@include file="../include/meta.jsp" %>
    <link rel="stylesheet" href="<c:url value="/css/admin.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">
    <script defer src="/js/goal.js"></script>
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
                    <form:select path="goal" items="${goals}" itemValue="id" itemLabel="name"></form:select><br/>
                    Wybierz:
                    <button id="timeGoalBtn">Ile muszę odkładać, żeby osiągnąć cel w wybranym czasie</button>
                    <button id="contributionBtn">Ile będę zbierał, jeśli co miesiąc odłożę</button><br/>
                    <div id="timeQuestion" style="display: none">Wskaż (w miesiącach), ile chcesz oszczędzać <form:input path="time" value="0"/></div><br/>
                    <div id="contributionQuestion" style="display:none;">Wskaż, ile będziesz odkładać miesięcznie <form:input path="contribution" value="0"/></div><br/>
                    <input type="submit" value="Oblicz"/>
                </form:form>
                <c:if test="${!empty calculate}">
                    <div>
                        Dla wybranych przez Ciebie kont i celu:<br/>
                        Tyle masz na kontach: ${calculate.actualStatus} zł<br/>
                        Tyle Ci brakuje, żeby spełnić cel: ${calculate.difference} zł<br/>
                        Taki status realizacji masz zrobiony: ${calculate.goalStatus}%<br/>
                        <c:if test="${calculate.timeToGoal < 0}">
                            Tyle czaus potrzebujesz, żeby osiągnąć cel: ${calculate.timeToGoal} miesięcy<br/>
                        </c:if>
                        <c:if test="${calculate.monthContribution < 0}">
                            Tyle musisz oszdzędzać miesięcznie, żeby osiągnąć zakładany cel: ${calculate.monthContribution} złotych<br/>
                        </c:if>
                    </div>
                </c:if>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>