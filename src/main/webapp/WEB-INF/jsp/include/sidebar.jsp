<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="sidebar">
    <ul class="sidebarMenu">
        <li></li><a href="/admin/dashboard">Dashboard</a></li>
        <li class="dropdown-btn">Konta</li>
            <ul class="sidebarHidden">
                <li><a href="#">Lista kont</a></li>
                <li><a href="/admin/account/add">Dodaj konto</a></li>
            </ul>
        <li class="dropdown-btn">Transakcje</li>
            <ul class="sidebarHidden">
                <li><a href="#">Wszystkie transakcje</a></li>
                <li><a href="#">Dodaj transakcje transakcje</a></li>
                <li><a href="/admin/category/">Lista kategorii</a></li>
                <li><a href="/admin/payer/">Lista płatników</a></li>
                <li><a href="/admin/payer/add">Dodaj płatnika</a></li>
            </ul>
        <li class="liSidebar"><a href="#">Raporty</a></li>
        <li class="liSidebar"><a href="#">Cele</a></li>
    </ul>
</div>