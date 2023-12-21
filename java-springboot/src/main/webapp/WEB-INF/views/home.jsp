<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>!
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="head.jsp"%>
<body>
<%@include file="menu.jsp"%>
<div class="container">
    <h2>Système de gestion de tâches</h2>
    <table class="table">
        <tbody>
        <tr>
            <th scope="col">Tâches</th>
        </tr>
        <tr>
                <% int i = 0; %>
            <c:forEach var="tache" items="${taches}" varStatus="loop">
                    <%
                    if (i == 0) { %>
        <tr><%
            }
        %>
            <td>
                <div class="clickable-div" data-tache-id="${tache.id}" style="height: 200px; width: 250px; border: 2px black solid; border-radius: 15%; padding: 5%; overflow: hidden; display: flex; flex-direction: column;">
                    <div style="text-align: left; width: fit-content;">
                        <p style="margin: 0; padding: 0; color:
                        <c:choose>
                        <c:when test="${tache.importance eq 'ELEVEE'}">red</c:when>
                        <c:when test="${tache.importance eq 'MOYENNE'}">orange</c:when>
                        <c:when test="${tache.importance eq 'FAIBLE'}">green</c:when>
                        <c:otherwise>black</c:otherwise>
                        </c:choose>
                                ;"> ${tache.getTitre()}</p>
                    </div>
                    <div style="text-align: right;">
                        <p style="margin: 0; padding: 0;">${tache.getDate_debut()}</p>
                    </div>
                    <hr>
                    <P>${tache.getDescription()}</P><br>
                    <p style="position: relative; bottom: 5%">
                            <%-- <a href="/modiftache/${tache.id}"><img src="images/edit.png" alt="Modifier" style="padding-right: 20px;"></a> --%>
                        <a href="/supptache/${tache.id}" style="padding-right: 20px;"><img src="images/trash.png" alt="Supprimer" style="padding-right: 20px;"></a>
                    </p>
                </div>
            </td>
            <%
                i++;
                if (i == 5) { %>
        </tr><%
                i = 0;
            }
        %>
        </c:forEach>
        </tr>
        </tbody>
    </table>
</div>

<script>
    // Ajouter un gestionnaire d'événement au chargement de la page
    document.addEventListener('DOMContentLoaded', function() {
        // Sélectionner toutes les divs cliquables
        var clickableDivs = document.querySelectorAll('.clickable-div');

        // Ajouter un gestionnaire d'événement pour chaque div cliquable
        clickableDivs.forEach(function(div) {
            div.addEventListener('click', function() {
                // Récupérer l'URL de la div à partir des données du serveur
                var url = "/detail/" + div.getAttribute('data-tache-id');

                // Rediriger l'utilisateur vers l'URL
                window.location.href = url;
            });
        });
    });
</script>

</body>
</html>
