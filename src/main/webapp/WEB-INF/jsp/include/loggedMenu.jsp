<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="nav">
    <div id="logo">
        <p id="logoFont"><a href="/admin/dashboard"><img src="https://image.flaticon.com/icons/svg/578/578376.svg" width="20" height="20">  Snake in The Pocket</a></p>
    </div>
    <div id="menu">
        <ul class="menuOl">
            <li class="liMenu"><a href="/admin/dashboard">Dashboard</a></li>
            <li class="liMenu"><a href="/admin/profile">Ustawienia profilu</a></li>
            <li class="liMenu">Cześć ${sessionScope.loggedUser.firstName}</li>
            <li class="liMenu"><a href="/admin/logout" id="login">Wyloguj</a></li>
        </ul>
    </div>
    <div class="clear"></div>
</div>