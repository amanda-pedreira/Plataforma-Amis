<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Perfil público - AMIS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/amis-visual.css">
</head>
<body class="bg-color-claro amis-organizado amis-tela">
<header class="amis-topo">
    <div class="amis-menu container">
        <a class="amis-marca" href="${pageContext.request.contextPath}/find-all-postagens">AMIS</a>
        <nav class="amis-links">
            <a href="${pageContext.request.contextPath}/find-all-postagens">▦ Feed</a>
            <a href="${pageContext.request.contextPath}/journal">▤ Diário</a>
            <a href="${pageContext.request.contextPath}/find-all-usuarios?pagina=perfil">♙ Perfil</a>
        </nav>
        <div class="amis-direita">
            <button type="button" id="botao-tema" class="amis-tema" onclick="mudarTema()" title="Alternar tema" aria-label="Alternar tema">☾</button>
            <a class="amis-admin-link" href="${pageContext.request.contextPath}/admin.jsp">Admin</a>
        </div>
    </div>
</header>
<div class="container mt-4 amis-perfil-pagina" style="max-width:900px">
    <c:choose>
        <c:when test="${not empty usuarioPublico}">
            <div class="amis-painel amis-perfil-principal">
                <div class="amis-perfil-cabecalho">
                    <div class="amis-avatar"><c:out value="${usuarioPublico.nome}" /></div>
                    <div>
                <h2><c:out value="${usuarioPublico.nome}" /></h2>
                <p>@<c:out value="${usuarioPublico.username}" /></p>
                <p class="amis-perfil-bio"><c:out value="${usuarioPublico.bio}" /></p>
                <p class="amis-perfil-desde">Na AMIS desde <c:out value="${usuarioPublico.dataCriacao}" /></p>
                    </div>
                </div>
                <hr>
                <div class="alert alert-info">Temporário: como não existe login, informe seu ID para salvar uma pessoa ou seguir uma página. Depois isso será automático.</div>
                <c:choose>
                    <c:when test="${usuarioPublico.tipo eq 'PAGINA' or usuarioPublico.tipo eq 'Pagina' or usuarioPublico.tipo eq 'Página' or usuarioPublico.tipo eq 'pagina'}">
                        <h5>Seguir página</h5>
                        <c:set var="tipoRelacao" value="pagina" />
                    </c:when>
                    <c:otherwise>
                        <h5>Salvar pessoa</h5>
                        <c:set var="tipoRelacao" value="pessoa" />
                    </c:otherwise>
                </c:choose>
                <form class="amis-form-relacao" action="${pageContext.request.contextPath}/relacionamento" method="post">
                    <input type="hidden" name="tipo" value="${tipoRelacao}">
                    <input type="hidden" name="acao" value="salvar">
                    <input type="hidden" name="idDestino" value="${usuarioPublico.idUsuario}">
                    <label class="form-label">Seu ID (temporário)</label>
                    <input type="number" name="idUsuario" min="1" required class="form-control mb-2">
                    <button class="btn btn-roxo">${tipoRelacao eq 'pagina' ? 'Seguir página' : 'Salvar pessoa'}</button>
                </form>
            </div>
        </c:when>
        <c:otherwise><div class="alert alert-warning">Perfil não encontrado.</div></c:otherwise>
    </c:choose>
</div>
<script src="${pageContext.request.contextPath}/js/tema.js"></script>
</body>
</html>
