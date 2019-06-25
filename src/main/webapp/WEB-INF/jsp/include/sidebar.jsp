<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="sidebar">
    <ul class="sidebarMenu">
        <li class="liSidebar"><a href="/admin/dashboard">Dashboard</a></li>
        <li class="liSidebar"><a href="/admin/account/add">Konta</a></li>
        <li class="liSidebar"><a href="#">Transakcje</a>
            <ul class="sidebarMenu">
                <li><a href="#">Ogólne</a></li>
                <li><a href="/admin/category/">Kategorie</a></li>
                <li><a href="/admin/payer/">Płatnicy</a></li>
                <li><a href="/admin/payer/add">Dodaj Płatnicy</a></li>
            </ul>
        </li>
        <li class="liSidebar"><a href="#">Raporty</a></li>
        <li class="liSidebar"><a href="#">Cele</a></li>
    </ul>
</div>