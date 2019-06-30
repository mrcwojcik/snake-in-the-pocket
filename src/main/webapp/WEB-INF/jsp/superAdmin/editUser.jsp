<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <title>Snake in The Pocket - Dashboard</title>
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
                    Imię: <form:input path="firstName"/><form:errors path="firstName"/><br/>
                    Nazwisko: <form:input path="lastName"/><form:errors path="lastName"/><br/>
                    E-Mail: <form:input path="email"/><form:errors path="email"/><br/>
                    Nowe hasło: <form:password path="password"/><form:errors path="password"/><br/>
                    Dać uprawnienia admina? <form:checkbox path="superadmin"/>
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