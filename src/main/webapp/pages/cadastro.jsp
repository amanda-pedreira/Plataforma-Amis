<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
            <!-- Coluna Esquerda: Banner em Gradiente (Ir para Login) -->
            <div class="auth-banner">
                <div class="banner-conteudo">
                    <h2>AMIS</h2>
                    <h3>Já faz parte da comunidade?</h3>
                    <p>Entre com seu apelido e continue de onde parou.</p>
                    <a href="${pageContext.request.contextPath}/login.jsp" class="btn-outline-branco">Entrar</a>
                </div>
            </div>

            <!-- Coluna Direita: Formulário de Cadastro -->
            <div class="auth-form-section">
                <div class="form-header">
                    <h2>Criar conta</h2>
                    <p>Leva menos de um minuto.</p>
                </div>

                <!-- Abas (Perfil Pessoal / Página) -->
                <div class="tabs-container">
                    <button type="button" class="tab-btn active">Perfil pessoal</button>
                    <button type="button" class="tab-btn">Página</button>
                </div>

                <!-- Formulário com os names preservados para o Back-end -->
                <form action="${pageContext.request.contextPath}/create-usuario" method="POST" class="auth-form">
                    <div class="input-group">
                        <label for="apelido">Apelido</label>
                        <input type="text" id="apelido" name="apelido" required>
                    </div>

                    <div class="input-group">
                        <label for="email">E-mail <span class="opcional">(opcional — só para recuperar sua senha)</span></label>
                        <input type="email" id="email" name="email">
                    </div>

                    <div class="input-group">
                        <label for="senha">Senha</label>
                        <input type="password" id="senha" name="senha" required>
                    </div>

                    <div class="input-group">
                        <label for="confirmarSenha">Confirmar senha</label>
                        <input type="password" id="confirmarSenha" name="confirmarSenha" required>
                    </div>

                    <div class="termos-grupo">
                        <input type="checkbox" id="termos" name="termos" required>
                        <label for="termos">Li as diretrizes da comunidade.</label>
                    </div>

                    <button type="submit" class="btn-submit">Criar conta</button>
                </form>

                <div class="aviso-rodape-form">
                    <p>Em perfis pessoais, o AMIS usa apenas um apelido — sua identidade não é exibida para outras usuárias.</p>
                </div>
            </div>
        </div>
    </div>

</body>
</html>