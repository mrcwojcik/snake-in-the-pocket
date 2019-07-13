<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Snake in The Pocket</title>
    <%@include file="include/meta.jsp" %>
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/contact.css"/>">
    <link href="https://fonts.googleapis.com/css?family=Caveat&display=swap" rel="stylesheet">
</head>
<body>
<div id="container">
    <%@include file="include/homeMenu.jsp" %>
    <div id="content">
        <div class="contact100-form-title mainImg"
             style="background-image: url(https://wallpaperplay.com/walls/full/e/0/a/43626.jpg);">
				<span class="contact100-form-title-1 mainTxt">
					Skarbówka płacze, gdy korzystasz z naszej apki
				</span>
            <span class="contact100-form-title-2">
					I pamiętaj: pieniądze szczęścia nie dają! Ale za kasę możesz kupić żelki, a to już blisko szczęścia!
				</span>
        </div>
    </div>
    <div id="buttonsSection">
        <a href="/login" class="myButton">Logowanie</a>
        <a href="/register" class="myButton">Rejestracja</a>
    </div>
    <div id="services">
        <h2 class="header3">Znajdź węża w kieszeni!</h2>
        <hr>
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
    <div id="team">
        <h2 class="header3">Nasz zespół</h2>
        <hr>
        <div class="person">
            <div class="personImg"><img src="http://mrcwojcik.pl/wp-content/uploads/2018/08/IMG_6957.jpg" width="330" height="350"></div>
            <div class="personName">Marcin</div>
        </div>
        <div class="person">
            <div class="personImg"><img src="https://vignette.wikia.nocookie.net/thedarkknighttrilogy/images/3/35/Bane_TDKR.jpg/revision/latest?cb=20130114183531" width="330" height="350"> </div>
            <div class="personName">Anonimowy urzędnik Urzedu Skarbowego</div>
        </div>
        <div class="person">
            <div class="personImg"><img src="https://s2.dziennik.pl/pliki/5793000/5793883-wilk-z-wall-street-900-609.jpg" width="330" height="350"> </div>
            <div class="personName">Anonimowy urzędnik ZUS</div>
        </div>
        <div class="clear"></div>
    </div>
</div>
<div id="footer">
</div>
</body>
</html>