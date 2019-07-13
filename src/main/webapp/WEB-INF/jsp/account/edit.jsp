<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Snake in The Pocket - Edytuj konto</title>
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
            <h2>Edytuj konto:</h2>
            <form:form modelAttribute="account" method="post">
                <div class="labelToForm">Nazwa konta:</div> <form:input path="accountName" cssClass="addForm"/><form:errors path="accountName"/><br>
                <div class="labelToFormBank">Stan konta (początkowy):</div> <form:input path="startBalance" cssClass="addForm"/><form:errors path="startBalance"/><br>
                <div class="labelToForm">Bank: </div> <form:select path="bank" items="${banks}" itemLabel="name" itemValue="id" cssClass="addForm"/><br>
                <form:hidden path="actualBalance"/><br/>
                <form:hidden path="user" value="${user.id}"/><form:errors path="user"/><br/>
                <input type="submit" value="Edytuj konto"/>
            </form:form>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>