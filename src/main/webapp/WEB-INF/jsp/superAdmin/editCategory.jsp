<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <title>Edytuj kategorię - Snake in The Pocket</title>
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
                <form:form modelAttribute="category">
                    <form:hidden path="id"/>
                    <div class="labelToForm">Nazwa:</div> <form:input path="categoryName" cssClass="addForm"/><br/>
                    <input type="submit" value="Dodaj"/>
                </form:form><br/>
                <a href="/superAdmin/categories">WRÓĆ DO LISTY KATEGORII</a><br/>
                <a href="/superAdmin/">WRÓĆ DO GŁÓWNEGO PANELU</a>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>