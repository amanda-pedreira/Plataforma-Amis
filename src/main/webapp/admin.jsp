<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Administração - AMIS</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    </head>
    <body class="amis-organizado admin-area">
        <div class="container admin-container">
            <header class="admin-navbar">
                <div class="admin-logo">
                    <span class="admin-logo-icon">A</span>
                    <div>
                        <strong>AMIS</strong>
                        <small>Painel administrativo</small>
                    </div>
                </div>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-outline-secondary btn-sm">Sair</a>
            </header>
            <div class="admin-heading">
                <div>
                    <span class="admin-eyebrow">GERENCIAMENTO</span>
                    <h1>Área administrativa</h1>
                    <p>Organize e gerencie os cadastros da plataforma.</p>
                </div>
                <span class="admin-heading-tag">Painel AMIS</span>
            </div>
            <div class="admin-section-title">
                <div>
                    <h2>Gerenciar plataforma</h2>
                    <p>Escolha uma das áreas para continuar.</p>
                </div>
            </div>
            <div class="row g-4 admin-cards">
                <c:if test="${sessionScope.permissao eq '3' or sessionScope.permissao eq '1'}">
                    <div class="col-md-6 col-xl-3">
                        <a class="admin-card-link" href="${pageContext.request.contextPath}/find-all-categorias">
                            <div class="admin-card">
                                <div class="admin-card-icon">
                                    01
                                </div>
                                <h3>Categorias</h3>
                                <p>Organize as categorias das postagens.</p>
                                <span class="admin-card-action">
                                    Gerenciar
                                    <span aria-hidden="true">→</span>
                                </span>
                            </div>
                        </a>
                    </div>
                </c:if>
                <c:if test="${sessionScope.permissao eq '3' or sessionScope.permissao eq '1'}">
                    <div class="col-md-6 col-xl-3">
                        <a class="admin-card-link" href="${pageContext.request.contextPath}/find-all-flags">
                            <div class="admin-card">
                                <div class="admin-card-icon">
                                    02
                                </div>
                                <h3>Flags</h3>
                                <p>Gerencie as flags usadas nas postagens.</p>
                                <span class="admin-card-action">
                                    Gerenciar
                                    <span aria-hidden="true">→</span>
                                </span>
                            </div>
                        </a>
                    </div>
                </c:if>
                <c:if test="${sessionScope.permissao eq '3' or sessionScope.permissao eq '2'}">
                    <div class="col-md-6 col-xl-3">
                        <a class="admin-card-link" href="${pageContext.request.contextPath}/find-all-usuarios">
                            <div class="admin-card">
                                <div class="admin-card-icon">
                                    03
                                </div>
                                <h3>Usuários e páginas</h3>
                                <p>Consulte cadastros e altere status.</p>
                                <span class="admin-card-action">
                                    Gerenciar
                                    <span aria-hidden="true">→</span>
                                </span>
                            </div>
                        </a>
                    </div>
                </c:if>
                <c:if test="${sessionScope.permissao eq '3'}">
                    <div class="col-md-6 col-xl-3">
                        <a class="admin-card-link" href="${pageContext.request.contextPath}/funcionarios">
                            <div class="admin-card">
                                <div class="admin-card-icon">
                                    04
                                </div>
                                <h3>Funcionários</h3>
                                <p>Cadastre e gerencie a equipe do site.</p>
                                <span class="admin-card-action">
                                    Gerenciar
                                    <span aria-hidden="true">→</span>
                                </span>
                            </div>
                        </a>
                    </div>
                </c:if>
            </div>
            <c:if test="${sessionScope.permissao eq '3' or sessionScope.permissao eq '2'}">
                <p>
                    <a href="${pageContext.request.contextPath}/admin/postagens">Gerenciar postagens</a>
                </p>
            </c:if>
            <c:if test="${sessionScope.permissao eq '3' or sessionScope.permissao eq '1'}">
                <div class="admin-section-title">
                    <div>
                        <h2>Página inicial</h2>
                        <p>Edite os conteúdos públicos e o contato.</p>
                    </div>
                </div>
                <p>
                    <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/admin/conteudos">Gerenciar conteúdos do site</a>
                </p>
            </c:if>
            <footer class="admin-footer">
                AMIS · Administração da plataforma
            </footer>
        </div>
    </body>
</html>
