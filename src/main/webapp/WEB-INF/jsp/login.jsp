<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Rejestracja - Snake in The Pocket</title>
    <%@include file="include/meta.jsp"%>
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">
</head>
<body>
<div id="container">
    <%@include file="include/homeMenu.jsp"%>
    <div id="content">
        <div id="form">
            <h2>Login</h2>
            <form:form modelAttribute="loginAuth" method="post">
                E-Mail (login): <form:input path="email"/><br/>
                Hasło: <form:password path="password"/><br/>
                <input type="submit" value="Zaloguj się">
            </form:form>
        </div>

    </div>
</div>
</body>
</html>
