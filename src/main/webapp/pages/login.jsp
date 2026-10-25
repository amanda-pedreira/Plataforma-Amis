<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AMIS - Entrar</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/usuario.css">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>

    <div class="auth-container-wrapper">
        <div class="logo-topo">AMIS</div>
        
        <div class="auth-card">
            <!-- Coluna Esquerda: Formulário de Login -->
            <div class="auth-form-section">
                <div class="form-header">
                    <h2>Entrar</h2>
                    <p>Que bom te ver de novo por aqui.</p>
                </div>

                <!-- Formulário com os names preservados para o Back-end -->
                <form action="${pageContext.request.contextPath}/login" method="POST" class="auth-form">
                    <div class="input-group">
                        <label for="apelido">Apelido</label>
                        <input type="text" id="apelido" name="apelido" required>
                    </div>

                    <div class="input-group">
                        <label for="senha">Senha</label>
                        <input type="password" id="senha" name="senha" required>
                    </div>

                    <button type="submit" class="btn-submit">Entrar</button>
                </form>
            </div>

            <!-- Coluna Direita: Banner em Gradiente (Ir para Cadastro) -->
            <div class="auth-banner">
                <div class="banner-conteudo">
                    <h2>AMIS</h2>
                    <h3>Ainda não tem conta?</h3>
                    <p>Crie a sua em menos de um minuto e comece a fazer parte.</p>
                    <a href="${pageContext.request.contextPath}/cadastro.jsp" class="btn-outline-branco">Criar conta</a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>