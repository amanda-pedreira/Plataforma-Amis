<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro - AMIS</title>
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
        <div class="col-md-6">

            <div class="caixa">
                <h2>Criar conta</h2>

                <% if ("1".equals(request.getParameter("enviado"))) { %>
                <p>Conta criada com sucesso!</p>
                <% } %>

                <% if ("1".equals(request.getParameter("erro"))) { %>
                <p>Não foi possível criar a conta.</p>
                <% } %>

                <form action="${pageContext.request.contextPath}/create-usuario" method="post" id="form-cadastro">

                    <label>Tipo de conta</label>
                    <div class="mb-3">
                        <input type="radio" name="tipo" value="PESSOAL" checked> Perfil pessoal
                        <input type="radio" name="tipo" value="PAGINA"> Página
                    </div>

                    <label>Nome</label>
                    <input type="text" name="nome" class="form-control mb-3" required>

                    <label>Apelido</label>
                    <input type="text" name="username" class="form-control mb-3" required>

                    <label>E-mail</label>
                    <input type="email" name="email" class="form-control mb-3" required>

                    <label>Senha</label>
                    <input type="password" name="senha" id="senha" class="form-control mb-3" required>

                    <label>Confirmar senha</label>
                    <input type="password" name="confirmar-senha" id="confirmar-senha" class="form-control mb-3" required>

                    <label>Link da foto (opcional)</label>
                    <input type="url" name="foto" class="form-control mb-3">

                    <div class="mb-3">
                        <input type="checkbox" required> Li as diretrizes da comunidade.
                    </div>

                    <button type="submit" class="btn btn-roxo">Criar conta</button>

                </form>

                <p class="mt-3">
                    Já tem conta?
                    <a href="${pageContext.request.contextPath}/pages/login.jsp">Entrar</a>
                </p>
            </div>

        </div>
    </div>

</div>

<script src="${pageContext.request.contextPath}/js/tema.js"></script>

<script>
    document.getElementById("form-cadastro").addEventListener("submit", function(event) {
        let senha = document.getElementById("senha").value;
        let confirmar = document.getElementById("confirmar-senha").value;

        if (senha !== confirmar) {
            event.preventDefault();
            alert("As senhas não são iguais!");
        }
    });
</script>

</body>
</html>