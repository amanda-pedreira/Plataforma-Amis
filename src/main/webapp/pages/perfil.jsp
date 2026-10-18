<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Perfil - AMIS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/perfil.css">
</head>
<body class="bg-color-claro">

<div class="container mt-4">

    <div class="row mb-4">
        <div class="col">
            <h1>AMIS</h1>
        </div>
        <div class="col-auto">
            <button id="botao-tema" class="btn btn-outline-secondary" onclick="mudarTema()">Modo escuro</button>
        </div>
    </div>

    <div class="caixa">
        <h2>emilly</h2>
        <p>Minha comunidade desde 10 de setembro de 2026</p>

        <div class="row">
            <div class="col-6 col-md-3">
                <strong>0</strong>
                <p>Postagens</p>
            </div>
            <div class="col-6 col-md-3">
                <strong>2</strong>
                <p>Registros no diário</p>
            </div>
            <div class="col-6 col-md-3">
                <strong>1</strong>
                <p>Páginas seguidas</p>
            </div>
            <div class="col-6 col-md-3">
                <strong>0</strong>
                <p>Itens salvos</p>
            </div>
        </div>
    </div>

    <div class="mb-3">
        <button class="btn btn-roxo">Minhas postagens</button>
        <button class="btn btn-outline-secondary">Salvos</button>
        <button class="btn btn-outline-secondary">Páginas seguidas</button>
    </div>

    <div class="caixa">
        <p>Você ainda não publicou nada por aqui.</p>
    </div>

    <h2>Usuários cadastrados</h2>

    <div class="row">
        <c:forEach var="usuario" items="${usuarios}">
            <div class="col-md-6 mb-3">
                <div class="caixa">
                    <h3><c:out value="${usuario.nome}" /></h3>
                    <p>Tipo: <c:out value="${usuario.tipo}" /></p>
                    <p>Username: <c:out value="${usuario.username}" /></p>
                    <p>E-mail: <c:out value="${usuario.email}" /></p>
                    <p>Foto: <c:out value="${usuario.foto}" /></p>
                    <p>Bio: <c:out value="${usuario.bio}" /></p>
                    <p>Data de criação: <c:out value="${usuario.dataCriacao}" /></p>
                </div>
            </div>
        </c:forEach>
    </div>

</div>

<script src="${pageContext.request.contextPath}/js/tema.js"></script>
</body>
</html>