<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>O projekcie - Snake in The Pocket</title>
    <%@include file="include/meta.jsp"%>
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/contact.css"/>">
    <link href="https://fonts.googleapis.com/css?family=PT+Sans&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Caveat&display=swap" rel="stylesheet">


</head>
<body>
<div id="container">
    <%@include file="include/homeMenu.jsp"%>
    <div id="content">
        <div class="contact100-form-title"
             style="background-image: url(https://images3.alphacoders.com/882/882548.jpg);">
				<span class="contact100-form-title-1">
					O projekcie
				</span>
                <span class="contact100-form-title-2">
					Tu jest napisane, że piorun uderzył w wieżę w przyszłą sobotę o 22:04
				</span>
        </div>
        <h2 class="header3">Znajdź węża w kieszeni!</h2>

        <div class="skills_container">
            <div class="boxskillsinside">
                <div class="skillsimg wow fadeInLeft">
                    <div class="proj_title">Co robimy?</div>
                    <div class="cont_skillstext">
                        <div class="skilldesc proj_desc">Snake in The Pocket to prosta aplikacja dla każdego. Możesz śledzić swoje wydatki oraz dostawać raporty, lepsze niż od księgowej.</div>
                    </div>
                </div>
                <div class="skillsimg wow fadeInLeft">
                    <div class="proj_title">Po prostu pomagamy</div>
                    <div class="cont_skillstext">
                        <div class="skilldesc proj_desc">Pomagamy oszczedzać kasę. Co robimy potem? Namawiamy Cię, żebyś wydał ją u nas.</div>
                    </div>
                </div>
                <div class="skillsimg wow fadeInLeft">
                    <div class="proj_title">Wszystko, czego potrzebujesz</div>
                    <div class="cont_skillstext">
                        <div class="skilldesc proj_desc">Aplikacja ma tyle opcji, że trudno je wszystkie wymienić. Jesteśmy lepsi niż Kalkulator i Notatnik.</div>
                    </div>
                </div>
                <div class="skillsimg wow fadeInLeft">
                        <div class="proj_title">Jak w Urzędzie Skarbowym</div>
                    <div class="cont_skillstext">
                        <div class="skilldesc proj_desc">Jeśli będziesz systematycznie korzystał z aplikacji, to będziesz miał o sobie takie dane, jak mają w skarbówce.</div>
                    </div>
                </div>
            </div><!--/boxskillsimg/-->
        </div><!--/container/-->
    </div>
</div>
</body>
</html>
