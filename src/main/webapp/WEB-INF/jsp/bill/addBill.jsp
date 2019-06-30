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
            <form:form modelAttribute="bill" method="post">
                Wydatek: <form:radiobutton path="plusOrMinus" value="false"/> || Przychód: <form:radiobutton path="plusOrMinus" value="true"/><br/>
                Kto: <form:select path="payer" items="${payers}" itemLabel="name" itemValue="id"/><br/>
                Konto: <form:select path="account" items="${accounts}" itemLabel="accountName" itemValue="id"/><br/>
                <input type="submit" value="Dalej"/>
            </form:form>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>