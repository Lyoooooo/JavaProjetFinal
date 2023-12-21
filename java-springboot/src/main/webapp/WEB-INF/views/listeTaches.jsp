<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="head.jsp"%>
<body>
<%@include file="menu.jsp"%>
<div class="container">
    <h2>Système de gestion de tâches</h2>

    <div class="columns-container" style="display: flex; justify-content: space-between;">

        <div class="column">
            <h3>Importance ÉLEVÉE</h3>
            <c:forEach var="tache" items="${taches}" varStatus="loop">
                <c:if test="${tache.importance eq 'ELEVEE'}">
                    <div class="clickable-div" data-tache-id="${tache.id}" style="height: 200px; width: 250px; border: 2px black solid; border-radius: 15%; padding: 5%; overflow: hidden; display: flex; flex-direction: column; margin-top: 10px">
                        <div style="text-align: left; width: fit-content;">
                            <p style="margin: 0; padding: 0; color: red;"> ${tache.getTitre()}</p>
                        </div>
                        <div style="text-align: right;">
                            <p style="margin: 0; padding: 0;">${tache.getDate_debut()}</p>
                        </div>
                        <hr>
                        <P>${tache.getDescription()}</P><br>
                        <p style="position: relative; bottom: 5%">
                            <a href="/supptache/${tache.id}" style="padding-right: 20px;"><img src="images/trash.png" alt="Supprimer" style="padding-right: 20px;"></a>
                        </p>
                    </div>
                </c:if>
            </c:forEach>
        </div>

        <div class="column">
            <h3>Importance MOYENNE</h3>
            <c:forEach var="tache" items="${taches}" varStatus="loop">
                <c:if test="${tache.importance eq 'MOYENNE'}">
                    <div class="clickable-div" data-tache-id="${tache.id}" style="height: 200px; width: 250px; border: 2px black solid; border-radius: 15%; padding: 5%; overflow: hidden; display: flex; flex-direction: column; margin-top: 10px">
                        <div style="text-align: left; width: fit-content;">
                            <p style="margin: 0; padding: 0; color: orange;"> ${tache.getTitre()}</p>
                        </div>
                        <div style="text-align: right;">
                            <p style="margin: 0; padding: 0;">${tache.getDate_debut()}</p>
                        </div>
                        <hr>
                        <P>${tache.getDescription()}</P><br>
                        <p style="position: relative; bottom: 5%">
                            <a href="/supptache/${tache.id}" style="padding-right: 20px;"><img src="images/trash.png" alt="Supprimer" style="padding-right: 20px;"></a>
                        </p>
                    </div>
                </c:if>
            </c:forEach>
        </div>

        <div class="column">
            <h3>Importance FAIBLE</h3>
            <c:forEach var="tache" items="${taches}" varStatus="loop">
                <c:if test="${tache.importance eq 'FAIBLE'}">
                    <div class="clickable-div" data-tache-id="${tache.id}" style="height: 200px; width: 250px; border: 2px black solid; border-radius: 15%; padding: 5%; overflow: hidden; display: flex; flex-direction: column; margin-top: 10px">
                        <div style="text-align: left; width: fit-content;">
                            <p style="margin: 0; padding: 0; color: green;"> ${tache.getTitre()}</p>
                        </div>
                        <div style="text-align: right;">
                            <p style="margin: 0; padding: 0;">${tache.getDate_debut()}</p>
                        </div>
                        <hr>
                        <P>${tache.getDescription()}</P><br>
                        <p style="position: relative; bottom: 5%">
                            <a href="/supptache/${tache.id}" style="padding-right: 20px;"><img src="images/trash.png" alt="Supprimer" style="padding-right: 20px;"></a>
                        </p>
                    </div>
                </c:if>
            </c:forEach>
        </div>

    </div>

</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        var clickableDivs = document.querySelectorAll('.clickable-div');
        clickableDivs.forEach(function(div) {
            div.addEventListener('click', function() {
                var url = "/detail/" + div.getAttribute('data-tache-id');
                window.location.href = url;
            });
        });
    });
</script>

</body>
</html>
