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
            
            <div class="auth-form-section">
                <div class="form-header">
                    <h2>Entrar</h2>
                    <p>Que bom te ver de novo por aqui.</p>
                    <p style="margin-top: 12px; color: #9146aa; font-size: 13px;">Temporário: não existe login. Qualquer pessoa entra clicando no botão Entrar.</p>
                </div>

                <form action="${pageContext.request.contextPath}/find-all-postagens" method="GET" class="auth-form">
                    <div class="input-group">
                        <label for="apelido">Apelido</label>
                        <input type="text" id="apelido" name="apelido">
                    </div>

                    <div class="input-group">
                        <label for="senha">Senha</label>
                        <input type="password" id="senha" name="senha">
                    </div>

                    <button type="submit" class="btn-submit">Entrar</button>
                </form>
            </div>

            <div class="auth-banner">
                <div class="banner-conteudo">
                    <h2>AMIS</h2>
                    <h3>Ainda não tem conta?</h3>
                    <p>Crie a sua em menos de um minuto e comece a fazer parte.</p>
                    <a href="${pageContext.request.contextPath}/pages/cadastro.jsp" class="btn-outline-branco">Criar conta</a>
                </div>
            </div>
        </div>
    </div>

<c:if test="${param.cadastrado == '1'}">
<script>alert("Cadastro realizado com sucesso! Agora você pode entrar.");</script>
</c:if>
</body>
</html>