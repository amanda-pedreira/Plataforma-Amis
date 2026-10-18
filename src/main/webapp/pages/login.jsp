<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - AMIS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/usuario.css">
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

    <div class="row justify-content-center">
        <div class="col-md-5">

            <div class="caixa">
                <h2>Entrar</h2>
                <p>Que bom te ver de novo!</p>

                <% if ("erro".equals(request.getParameter("erro"))) { %>
                <p>Não foi possível entrar. Confira seus dados.</p>
                <% } %>

                <form action="${pageContext.request.contextPath}/login" method="post">

                    <label>Apelido</label>
                    <input type="text" name="username" class="form-control mb-3" required>

                    <label>Senha</label>
                    <input type="password" name="senha" class="form-control mb-3" required>

                    <button type="submit" class="btn btn-roxo">Entrar</button>

                </form>

                <p class="mt-3">
                    Não tem conta?
                    <a href="${pageContext.request.contextPath}/pages/cadastro.jsp">Criar conta</a>
                </p>
            </div>

        </div>
    </div>

</div>

<script src="${pageContext.request.contextPath}/js/tema.js"></script>
</body>
</html>