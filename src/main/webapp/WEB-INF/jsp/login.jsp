<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Logowanie - Snake in The Pocket</title>
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
					Zaloguj się do serwisu
				</span>
            <span class="contact100-form-title-2">
					Po zalogowaniu zyskasz władzę nad świa... swoimi finansami.
				</span>
        </div>
        <div id="loginForm">
            <form:form modelAttribute="loginAuth" method="post">
                <div class="labelToForm">E-Mail (Login):</div> <form:input path="email" cssClass="addForm"/><form:errors path="email"/> <br/>
                <div class="labelToForm">Hasło:</div> <form:password path="password" cssClass="addForm"/><form:errors path="password"/> <br/>
                <input type="submit" value="Zaloguj się">
            </form:form>
            <b style="color: red">${errorTxt}</b>
        </div>

    </div>
</div>
</body>
</html>
