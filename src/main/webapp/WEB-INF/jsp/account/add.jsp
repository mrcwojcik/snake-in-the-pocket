<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Snake in The Pocket - Dodaj konto</title>
    <%@include file="../include/meta.jsp"%>
    <link rel="stylesheet" href="<c:url value="/css/admin.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">
</head>
<body>
<div id="container">
    <%@include file="../include/loggedMenu.jsp"%>
    <div id="adminContent">
        <%@include file="../include/sidebar.jsp"%>
        <div id="panel">
            <form:form modelAttribute="account" method="post">
                Nazwa konta: <form:input path="accountName"/><form:errors path="accountName"/><br>
                Stan konta: <form:input path="startBalance"/><form:errors path="startBalance"/><br>
                Wybierz bank: <form:select path="bank" items="${banks}" itemLabel="name" itemValue="id"/><br>
                <form:hidden path="user" value="${user.id}"/><form:errors path="user"/><br/>
                <input type="submit" value="Dodaj konto"/>
            </form:form>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>