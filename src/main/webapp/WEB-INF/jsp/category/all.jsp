<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Snake in The Pocket - Dashboard</title>
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
            <div id="categories">
                <table class="mainTable">
                    <tr>
                        <th>Nazwa</th>
                    </tr>
                    <c:forEach items="${categories}" var="category">
                        <tr>
                            <td>${category.categoryName}</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
</body>
</html>