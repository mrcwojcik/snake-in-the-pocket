<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Rejestracja - Snake in The Pocket</title>
    <%@include file="include/meta.jsp"%>
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/admin.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/contact.css"/>">
</head>
<body>
    <div id="container">
        <%@include file="include/homeMenu.jsp"%>
        <div id="content">
            <div class="contact100-form-title"
                 style="background-image: url(https://images3.alphacoders.com/882/882548.jpg);">
				<span class="contact100-form-title-1">
					Zarejestruj się
				</span>
                <span class="contact100-form-title-2">
					Urzędnicy zaczną płakać, bo będziesz miał lepszą organizację pieniędzy niż ZUS emerytur.
				</span>
            </div>
            <div id="registerForm">
                <form:form modelAttribute="user" method="post">
                    <div class="labelToForm">E-Mail (Login):</div> <form:input path="email" required="required" cssClass="addForm"/><form:errors path="email"/><br/>
                    <div class="labelToForm">Hasło:</div> <form:password path="password" cssClass="addForm"/><form:errors path="password"/><br/>
                    <div class="labelToForm">Imię:</div> <form:input path="firstName" cssClass="addForm"/><form:errors path="firstName"/><br/>
                    <div class="labelToForm">Nazwisko:</div> <form:input path="lastName" cssClass="addForm"/><form:errors path="lastName"/><br/>
                    <input type="submit" value="Zarejestruj się">
                </form:form>
            </div>

        </div>
    </div>
</body>
</html>
