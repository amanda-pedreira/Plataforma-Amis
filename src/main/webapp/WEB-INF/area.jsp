<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AMIS - Sua amis para todos os dias</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Folha de estilos personalizada -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body class="landing-body">

    <div class="container py-4">
        <!-- Cabeçalho (Header) -->
        <header class="d-flex justify-content-between align-items-center mb-5">
            <div class="logo-area">
                <h2 class="fw-bold text-dark m-0">AM<span class="text-gradient">IS</span></h2>
            </div>
            <div class="d-flex align-items-center gap-3">
                <a href="${pageContext.request.contextPath}/pages/login.jsp" class="btn btn-link text-dark text-decoration-none fw-medium">Entrar</a>
                <a href="${pageContext.request.contextPath}/pages/cadastro.jsp" class="btn btn-primary-gradient px-4 py-2 rounded-pill shadow-sm">Criar conta</a>
                <button id="botao-tema" class="btn btn-outline-secondary btn-sm" onclick="mudarTema()">🌙</button>
            </div>
        </header>

        <!-- Conteúdo Principal (Hero Section) -->
        <main class="row align-items-center min-vh-75 mt-4">
            <!-- Lado Esquerdo: Textos e Chamada para Ação -->
            <div class="col-lg-6 mb-5 mb-lg-0">
                <div class="badge-projeto mb-3">
                    <span class="dot-pink"></span> Projeto Integrador · 3 desenvolvedoras
                </div>
                
                <h1 class="display-4 fw-bold text-dark mb-4 lh-sm">
                    Sua amis para todos os dias.
                </h1>
                
                <p class="text-muted mb-4 fs-5">
                    O AMIS é uma rede social só para mulheres: um lugar para desabafar, pedir conselhos, compartilhar experiências e acompanhar páginas de conteúdo — além de um diário privado só seu.
                </p>
                
                <div class="d-flex flex-wrap gap-3">
                    <a href="${pageContext.request.contextPath}/pages/cadastro.jsp" class="btn btn-primary-gradient px-5 py-3 rounded-pill fw-medium shadow">Criar conta</a>
                    <a href="${pageContext.request.contextPath}/pages/login.jsp" class="btn btn-outline-custom px-4 py-3 rounded-pill fw-medium">Já tenho conta</a>
                </div>
            </div>

            <!-- Lado Direito: Cartões Ilustrativos -->
            <div class="col-lg-6 position-relative text-center">
                <div class="bg-blob"></div>

                <div class="card custom-card shadow-sm p-3 mb-4 text-start ms-lg-auto" style="max-width: 380px;">
                    <div class="d-flex align-items-center mb-2">
                        <span class="badge badge-soft-purple rounded-pill px-3 py-1">Quero apoio</span>
                    </div>
                    <div class="skeleton-line w-100 mb-2"></div>
                    <div class="skeleton-line w-75"></div>
                </div>

                <div class="card custom-card shadow-sm p-3 text-start me-lg-auto mt-lg-4" style="max-width: 340px;">
                    <div class="d-flex align-items-center gap-2 mb-2">
                        <div class="avatar-circle"></div>
                        <div class="skeleton-line w-50"></div>
                    </div>
                    <div class="skeleton-line w-100"></div>
                </div>
            </div>
        </main>
    </div>

    <script src="${pageContext.request.contextPath}/js/tema.js"></script>
</body>
</html>

// Area nao logada e ainda não referenciada para não quebrar o index.jsp. Código não oficial.