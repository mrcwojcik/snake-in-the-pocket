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
            <form:form modelAttribute="billDetails" method="post">
                <form:hidden path="bill" value="${bill.id}"/>
                <div class="labelToForm">Wybierz kategorię: </div> <form:select path="category" items="${categories}" itemLabel="categoryName" itemValue="id" cssClass="addForm"/><br/>
                <div class="labelToForm">Podaj wartość:</div> <form:input path="value" cssClass="addForm"/><form:errors path="value"/><br/>
                <input type="submit" value="Dodaj"/><br/>
            </form:form>
            <c:forEach items="${bill.billDetails}" var="billDetail">
                ${billDetail.category.categoryName}: ${billDetail.value} - <a href="/admin/transaction/deleteDetails/${bill.id}/${billDetail.id}">Usuń</a> <br/>
            </c:forEach>
            ==========<br/>
            Suma: <c:if test="${!bill.plusOrMinus}">-</c:if> ${bill.billValue}
            <p><a href="/admin/transaction/endOfAdding/${bill.id}">Koniec dodawania</a> </p>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>