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
            <form:form modelAttribute="goal" method="post">
                <div class="labelToForm">Cel:</div> <form:input path="name" cssClass="addForm"/><form:errors path="name"/><br/>
                <div class="labelToForm">Wartość celu:</div> <form:input path="goalValue" cssClass="addForm"/><form:errors path="goalValue"/><br/>
                <form:hidden path="user" value="${user.id}"/><form:errors path="user"/><br/>
                <input type="submit" value="Dodaj cel"/>
            </form:form>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>