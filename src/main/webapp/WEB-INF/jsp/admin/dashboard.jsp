<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Snake in The Pocket - Dashboard</title>
    <%@include file="../include/meta.jsp" %>
    <link rel="stylesheet" href="<c:url value="/css/admin.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
<div id="container">
    <%@include file="../include/loggedMenu.jsp" %>
    <div id="adminContent">
        <%@include file="../include/sidebar.jsp" %>
        <div id="panel">
            <div id="accounts">
                <table>
                    <tr>
                        <th>Nazwa konta</th>
                        <th>Stan konta</th>
                        <th colspan="2">Akcje</th>
                        <th>Dodaj transakcje</th>
                    </tr>
                    <c:forEach items="${accounts}" var="account">
                        <tr>
                            <td>${account.accountName}</td>
                            <td>${account.actualBalance} zł</td>
                            <td colspan="2">Edytuj Usuń</td>
                            <td>Dodaj</td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<script>
    var sidebarHidden = document.querySelectorAll(".sidebarHidden");
    sidebarHidden.forEach(function (value) {
        value.style.display = "none";
    });

    var btnToHide = document.querySelectorAll('.dropdown-btn');
    console.log(btnToHide);

    btnToHide.forEach(function (e) {
        e.addEventListener('click', function () {
            if (this.nextElementSibling.style.display === "inline"){
                this.nextElementSibling.style.display = "none";
            } else {
                this.nextElementSibling.style.display = "inline";

            }
        })
    });
</script>
</body>
</html>