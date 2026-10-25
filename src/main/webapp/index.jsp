<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AMIS - Sua comunidade</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">
</head>
<body class="home-body">

    <div class="main-card-wrapper">
        <!-- Topo com Logo e Botões de Autenticação -->
        <header class="header-topo">
            <div class="logo-amis">AMIS</div>
            <div class="nav-auth">
                <a href="${pageContext.request.contextPath}/pages/login.jsp" class="link-entrar">Entrar</a>
                <a href="${pageContext.request.contextPath}/pages/cadastro.jsp" class="btn-roxo">Criar conta</a>
            </div>
        </header>

        <!-- Seção Principal dividida em 2 colunas (Figma) -->
        <div class="hero-grid">
            <!-- Coluna Esquerda: Texto e Chamada para Ação -->
            <div class="hero-texto-coluna">
                <span class="tag-projeto">• Projeto Integrador · 3 desenvolvedoras</span>
                
                <h1>Sua amis para todos os dias.</h1>
                
                <p>O AMIS é uma rede social só para mulheres: um lugar para desabafar, pedir conselhos, compartilhar experiências e acompanhar páginas de conteúdo — além de um diário privado só seu.</p>

                <div class="botoes-acao">
                    <a href="${pageContext.request.contextPath}/pages/cadastro.jsp" class="btn-roxo">Criar conta</a>
                    <a href="${pageContext.request.contextPath}/pages/login.jsp" class="btn-secundario">Já tenho conta</a>
                </div>
            </div>

            <!-- Coluna Direita: Elementos Decorativos e Cards Flutuantes -->
            <div class="hero-ilustracao-coluna">
                <div class="esfera-bg"></div>
                
                <!-- Card Flutuante Superior -->
                <div class="card-flutuante card-topo-direito">
                    <span class="badge-apoio">Quero apoio</span>
                    <div class="linha-esqueleto w-80"></div>
                    <div class="linha-esqueleto w-60"></div>
                </div>

                <!-- Card Flutuante Inferior -->
                <div class="card-flutuante card-baixo-direito">
                    <div class="avatar-mini"></div>
                    <div class="bloco-linhas">
                        <div class="linha-esqueleto w-90"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>