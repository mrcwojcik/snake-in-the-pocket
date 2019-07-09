<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="sidebar">
    <ul class="sidebarMenu">
        <li><a href="/admin/dashboard">Dashboard</a></li>
        <li class="dropdown-btn">Konta <i class="arrow down"></i></li>
            <ul class="sidebarHidden">
                <li><a href="/admin/account/">Lista kont</a></li>
                <li><a href="/admin/account/add">Dodaj konto</a></li>
            </ul>
        <li class="dropdown-btn">Transakcje <i class="arrow down"></i></li>
            <ul class="sidebarHidden">
                <li><a href="/admin/transaction/">Wszystkie transakcje</a></li>
                <li><a href="/admin/transaction/add">Dodaj transakcje</a></li>
                <li><a href="/admin/category/">Lista kategorii</a></li>
                <li><a href="/admin/payer/">Lista płatników</a></li>
                <li><a href="/admin/payer/add">Dodaj płatnika</a></li>
            </ul>
        <li class="liSidebar"><a href="/admin/report/">Raporty</a></li>
        <li class="dropdown-btn">Cele <i class="arrow down"></i></li>
        <ul class="sidebarHidden">
            <li><a href="/admin/goals/">Wszystkie cele</a></li>
            <li><a href="/admin/goals/add">Dodaj cel</a></li>
        </ul>
    </ul>
</div>