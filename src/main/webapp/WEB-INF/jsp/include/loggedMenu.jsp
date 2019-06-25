<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="nav">
    <div id="logo">
        <p id="logoFont">Snake in The Pocket</p>
    </div>
    <div id="menu">
        <ul class="menuOl">
            <li class="liMenu"><a href="/admin/dashboard">Dashboard</a></li>
            <li class="liMenu"><a href="#">Ustawienia profilu</a></li>
            <li class="liMenu">Cześć ${sessionScope.loggedUser.firstName}<a href="/admin/logout" id="login">|| Wyloguj</a></li>
        </ul>
    </div>
    <div class="clear"></div>
</div>