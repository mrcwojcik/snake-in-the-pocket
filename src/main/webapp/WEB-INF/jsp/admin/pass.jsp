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
            <h2>Zmiana hasła</h2>
            <form:form modelAttribute="user">
                <form:hidden path="id"/>
                <form:hidden path="firstName"/><form:hidden path="lastName"/><form:hidden path="email"/>
                <div class="labelToForm">Nowe hasło: </div> <form:password path="password" cssClass="addForm"/><form:errors path="password"/><br/>
                <div class="labelToForm">Powtórz nowe hasło:</div> <input type="password" name="checkNewPass" class="addForm"/><br/>
                ${info}
                <input type="submit" value="Zmień hasło">
            </form:form>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>