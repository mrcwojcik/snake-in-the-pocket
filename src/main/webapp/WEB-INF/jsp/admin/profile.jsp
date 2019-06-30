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
            <h2>Dane podstawowe</h2>
            <form:form modelAttribute="user">
                <form:hidden path="id"/>
                Imię: <form:input path="firstName"/><form:errors path="firstName"/><br/>
                Nazwisko: <form:input path="lastName"/><form:errors path="lastName"/><br/>
                E-Mail: <form:input path="email"/><form:errors path="email"/><br/>
                <form:hidden path="password"/>
                <input type="submit" value="Zmień dane"/>
            </form:form>
            <a href="/admin/pass" id="changePass">Zmiana hasła</a>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>