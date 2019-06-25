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
                <h2>Rejestracja</h2>
                <form:form modelAttribute="user" method="post">
                    E-Mail (login): <form:input path="email" required="required"/><form:errors path="email"/><br/>
                    Hasło: <form:password path="password"/><form:errors path="password"/><br/>
                    Imie: <form:input path="firstName"/><form:errors path="firstName"/><br/>
                    Nazwisko: <form:input path="lastName"/><form:errors path="lastName"/><br/>
                    <input type="submit" value="Zarejestruj się">
                </form:form>
            </div>

        </div>
    </div>
</body>
</html>
