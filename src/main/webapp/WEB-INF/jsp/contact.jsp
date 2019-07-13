<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Kontakt - Snake in The Pocket</title>
    <%@include file="include/meta.jsp" %>
    <link rel="stylesheet" href="<c:url value="/css/main.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/contact.css"/>">
    <link rel="stylesheet" href="<c:url value="/css/form.css"/>">
</head>
<body>
<div id="container">
    <%@include file="include/homeMenu.jsp" %>
    <div id="content">
        <div class="contact100-form-title"
             style="background-image: url(https://images3.alphacoders.com/882/882548.jpg);">
				<span class="contact100-form-title-1">
					Skontaktuj się z nami
				</span>
                <span class="contact100-form-title-2">
					Daj znać, co możemy dla Ciebie zrobić!
				</span>
        </div>
        <div id="contactSection">
            <div id="contactInfo" style="background-image: url(https://scontent-ort2-2.cdninstagram.com/vp/d1c31a3d18c1e7a52706831ebed4dd57/5D97D301/t51.2885-15/e35/s480x480/60809380_448888809271771_4324665662297800720_n.jpg?_nc_ht=scontent-ort2-2.cdninstagram.com);">
                <div class="transbox">
                    <h2>Kontakt</h2>
                    <div class="section">
                        <p class="secTitle"><img src="https://image.flaticon.com/icons/svg/1034/1034146.svg"/>  E-Mail:</p>
                        <p class="secContent">m@m.pl</p>
                    </div>
                    <div class="section"><p class="secTitle">
                        <img src="https://image.flaticon.com/icons/svg/126/126509.svg"> Telefon:</p>
                        <p class="secContent">000-000-000</p>
                    </div>
                    <div class="section">
                        <p class="secTitle"><img src="https://image.flaticon.com/icons/svg/263/263115.svg"> Adres</p>
                        <p class="secContent">Świętokrzyska 12, 00-916 Warszawa</p>
                    </div>
                </div>
            </div>
            <div id="contactForm">
                <h2>Wyślij wiadomość</h2>
                <form:form modelAttribute="contactMessage">
                    <div class="labelToForm">Imię:</div> <form:input path="name" cssClass="addForm"/><br/>
                    <div class="labelToForm">Twój adres e-mail:</div><form:input path="email" cssClass="addForm"/><br/>
                    <div class="labelToForm">Temat wiadomości:</div><form:input path="subject" cssClass="addForm"/><br/>
                    <div class="labelToForm">Wiadomość:</div><form:textarea path="message" cssClass="addForm"/><br/>
                    <input type="submit" value="Wyślij"/>
                </form:form>
            </div>
            <div class="clear"></div>
        </div>
    </div>
</div>
</body>
</html>
