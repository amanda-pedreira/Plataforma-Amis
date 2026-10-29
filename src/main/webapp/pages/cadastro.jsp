
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AMIS - Criar Conta</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/usuario.css">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>

<div class="auth-container-wrapper">

    <div class="logo-topo">AMIS</div>

    <div class="auth-card">

        <div class="auth-banner">
            <div class="banner-conteudo">
                <h2>AMIS</h2>
                <h3>Já faz parte da comunidade?</h3>
                <p>Entre com seu apelido e continue de onde parou.</p>
                <a href="${pageContext.request.contextPath}/pages/login.jsp"
                   class="btn-outline-branco">Entrar</a>
            </div>
        </div>

        <div class="auth-form-section">

            <div class="form-header">
                <h2>Criar conta</h2>
                <p>Leva menos de um minuto.</p>
            </div>

            <div class="tabs-container">
                <button type="button" class="tab-btn active"
                        onclick="mudarTipo('PESSOAL', this)">
                    Perfil pessoal
                </button>

                <button type="button" class="tab-btn"
                        onclick="mudarTipo('PAGINA', this)">
                    Página
                </button>
            </div>

            <form action="${pageContext.request.contextPath}/create-usuario"
                  method="POST" class="auth-form">

                <input type="hidden" id="tipo" name="tipo" value="PESSOAL">

                <div class="input-group">
                    <label for="username">Apelido / Username</label>
                    <input type="text" id="username" name="username" required>
                </div>

                <div class="input-group">
                    <label for="nome" id="labelNome">Nome</label>
                    <input type="text" id="nome" name="nome" required>
                </div>

                <div class="input-group">
                    <label for="email">E-mail</label>
                    <input type="email" id="email" name="email" required>
                </div>

                <div class="input-group">
                    <label for="foto">Foto (URL)</label>
                    <input type="text" id="foto" name="foto">
                </div>

                <div class="input-group">
                    <label for="senha">Senha</label>
                    <input type="password" id="senha" name="senha" required>
                </div>

                <div class="input-group">
                    <label for="confirmarSenha">Confirmar senha</label>
                    <input type="password" id="confirmarSenha"
                           name="confirmarSenha">
                </div>

                <div class="termos-grupo">
                    <input type="checkbox" id="termos" name="termos">
                    <label for="termos">Li as diretrizes da comunidade.</label>
                </div>

                <button type="submit" class="btn-submit">
                    Criar conta
                </button>

            </form>

            <div class="aviso-rodape-form">
                <p id="avisoTipo">
                    Em perfis pessoais, o AMIS usa um apelido para
                    identificar você na comunidade.
                </p>
            </div>

        </div>
    </div>
</div>

<script>
    function mudarTipo(tipo, botao) {
        document.getElementById("tipo").value = tipo;

        var botoes = document.querySelectorAll(".tab-btn");

        botoes.forEach(function(b) {
            b.classList.remove("active");
        });

        botao.classList.add("active");

        if (tipo === "PAGINA") {
            document.getElementById("labelNome").innerText = "Nome da página";
            document.getElementById("avisoTipo").innerText =
                "Cadastre uma página para participar da comunidade.";
        } else {
            document.getElementById("labelNome").innerText = "Nome";
            document.getElementById("avisoTipo").innerText =
                "Em perfis pessoais, o AMIS usa um apelido para identificar você na comunidade.";
        }
    }
</script>

<% if ("1".equals(request.getParameter("erro"))) { %>
<script>alert("Não foi possível realizar o cadastro.");</script>
<% } %>
</body>
</html>
