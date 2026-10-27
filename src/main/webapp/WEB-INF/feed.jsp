<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AMIS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body class="bg-color-claro">

<div class="container mt-4">

    <div class="row mb-4">
        <div class="col">
            <h1>AMIS</h1>
        </div>
        <div class="col-auto">
            <a href="${pageContext.request.contextPath}/pages/login.jsp" class="btn btn-roxo">Login</a>
            <button id="botao-tema" class="btn btn-outline-secondary" onclick="mudarTema()">Modo escuro</button>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-md-8">

            <h2>Feed</h2>

            <c:forEach var="postagem" items="${postagens}">
                <div class="postagem">
                    <h4><c:out value="${postagem.titulo}" /></h4>
                    <p><c:out value="${postagem.texto}" /></p>
                    <p>Categoria: <c:out value="${postagem.categoria}" /></p>
                    <p>Flag: <c:out value="${postagem.flag}" /></p>
                </div>
            </c:forEach>

            <c:if test="${empty postagens}">
                <p>Nenhuma postagem encontrada.</p>
            </c:if>

        </div>
    </div>

</div>

<script src="${pageContext.request.contextPath}/js/tema.js"></script>
</body>
</html>