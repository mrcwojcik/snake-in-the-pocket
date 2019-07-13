<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <title>Edycja użytkownika - Snake in The Pocket</title>
    <%@include file="../include/meta.jsp" %>
    <link rel="stylesheet" href="<c:url value="/css/admin.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">
</head>
<body>
<div id="container">
    <div id="adminContent">
        <div id="panel">
            <div id="accounts">
                <h2>Dane podstawowe</h2>
                <form:form modelAttribute="user">
                    <form:hidden path="id"/>
                    <div class="labelToForm">Imię:</div> <form:input path="firstName" cssClass="addForm"/><form:errors path="firstName"/><br/>
                    <div class="labelToForm">Nazwisko:</div> <form:input path="lastName" cssClass="addForm"/><form:errors path="lastName"/><br/>
                    <div class="labelToForm">E-Mail:</div> <form:input path="email" cssClass="addForm"/><form:errors path="email"/><br/>
                    <div class="labelToForm">Nowe hasło:</div> <form:password path="password" cssClass="addForm"/><form:errors path="password"/><br/>
                    Dać uprawnienia admina? <form:checkbox path="superadmin"/><br/>
                    <input type="submit" value="Zmień dane"/>
                </form:form><br/>
                <a href="/superAdmin/users">WRÓĆ DO LISTY USERÓW</a><br/>
                <a href="/superAdmin/">WRÓĆ DO GŁÓWNEGO PANELU</a>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>