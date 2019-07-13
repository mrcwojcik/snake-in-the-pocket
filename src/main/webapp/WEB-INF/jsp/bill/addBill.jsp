<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
            <c:if test="${fn:length(accounts) == 0}">
                Nie dodałeś jeszcze żadnych kont. <a href="/admin/account/add">Dodaj swoje pierwsze konto</a><br/>
            </c:if>
            <c:if test="${empty payers}">
                Zanim dodasz rachunek, musisz dodać <c:if test="${fn:length(accounts) == 0}">też </c:if>płatnika. <a href="/admin/payer/addFromBill">DODAJ</a>
            </c:if>
            <c:if test="${!empty payers}">
                <form:form modelAttribute="bill" method="post">
                    <h2>Wybierz:</h2>
                    <label class="radiocontainer">Wydatek
                        <form:radiobutton path="plusOrMinus" value="false" cssClass="radioInput" />
                        <span class="checkmark"></span>
                    </label>
                    <label class="radiocontainer">Przychód
                        <form:radiobutton path="plusOrMinus" value="true" cssClass="radioInput"/>
                        <span class="checkmark"></span>

                    </label>
<%--                    Wydatek: <form:radiobutton path="plusOrMinus" value="false" />  Przychód: <form:radiobutton path="plusOrMinus" value="true"/><br/>--%>
                    <div class="labelToForm">Kto:</div><form:select path="payer" items="${payers}" itemLabel="name" itemValue="id" cssClass="addForm"/><br/> <a href="/admin/payer/addFromBill">Dodaj kolejnego płatnika</a> <br/><br/>
                    <c:if test="${empty account}">
                        <div class="labelToForm">Konto:</div> <form:select path="account" items="${accounts}" itemLabel="accountName" itemValue="id" cssClass="addForm"/><br/>
                    </c:if>
                    <c:if test="${!empty account}">
                        Wybrałeś konto: ${account.accountName}. <form:hidden path="account" value="${account.id}"/>
                    </c:if>
                    <input type="submit" value="Dalej"/>
                </form:form>
            </c:if>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>