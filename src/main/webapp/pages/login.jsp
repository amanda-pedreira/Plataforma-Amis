<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>AMIS - Entrar</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/usuario.css">
    </head>
    <body>
        <header class="auth-top">
            <nav class="auth-nav">
                <a class="logo-topo" href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/img/visual/logo.png" alt="AMIS"></a>
                <div class="auth-nav-actions">
                    <a href="${pageContext.request.contextPath}/">Voltar ao início</a>
                    <button type="button" id="botao-tema" onclick="mudarTema()" aria-label="Alternar tema">☾</button>
                </div>
            </nav>
        </header>
        <div class="auth-container-wrapper">
            <div class="auth-card">
                <div class="auth-form-section">
                    <div class="form-header">
                        <h2>Entrar</h2>
                        <p>Que bom te ver de novo por aqui.</p>
                    </div>
                    <form action="${pageContext.request.contextPath}/login" method="post" class="auth-form">
                        <c:if test="${not empty requestScope.message}">
                            <p style="color: #9146aa;">
                                <c:out value="${requestScope.message}" />
                            </p>
                        </c:if>
                        <div class="input-group">
                            <label for="username">Apelido</label>
                            <input type="text" id="username" name="username" required>
                        </div>
                        <div class="input-group">
                            <label for="password">Senha</label>
                            <input type="password" id="password" name="password" required>
                        </div>
                        <button type="submit" class="btn-submit">Entrar</button>
                    </form>
                </div>
                <div class="auth-banner">
                    <div class="banner-conteudo">
                        <h2>amis.</h2>
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
        <c:if test="${requestScope.inativo}">
            <script>alert("Sua conta está inativa. Entre em contato com a administração da AMIS.");</script>
        </c:if>
        <script src="${pageContext.request.contextPath}/js/tema.js"></script>
    </body>
</html>
