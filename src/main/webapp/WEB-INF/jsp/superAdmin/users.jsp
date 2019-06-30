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
                <table>
                    <tr>
                        <th>ID</th>
                        <th>E-MAIL:</th>
                        <th>Imię i nazwisko</th>
                        <th>Edycja</th>
                        <th>Szczegóły</th>
                        <th>Usuń</th>
                        <th></th>
                    </tr>
                    <c:forEach items="${users}" var="user">
                        <tr>
                            <td>${user.id}</td>
                            <td>${user.email}</td>
                            <td>${user.fullName}</td>
                            <td><a href="/superAdmin//edit/user/${user.id}">Edytuj</a> </td>
                            <td><a href="/superAdmin/details/user/${user.id}">Details</a> </td>
                            <td><a href="/superAdmin/delete/user/${user.id}">Delete</a> </td>
                            <td><c:if test="${user.superadmin}"><p style="color: red">ADMIN</p></c:if></td>
                        </tr>
                    </c:forEach>
                </table><br/>
                <a href="/superAdmin/">WRÓĆ DO GŁÓWNEGO PANELU</a>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>