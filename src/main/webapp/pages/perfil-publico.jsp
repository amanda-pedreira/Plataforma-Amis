<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Perfil público - AMIS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
</head>
<body class="bg-light amis-organizado">
<div class="container mt-4" style="max-width:750px">
    <a href="${pageContext.request.contextPath}/find-all-postagens" class="btn btn-outline-secondary mb-3">Voltar ao feed</a>
    <c:choose>
        <c:when test="${not empty usuarioPublico}">
            <div class="card"><div class="card-body">
                <h2><c:out value="${usuarioPublico.nome}" /></h2>
                <p>@<c:out value="${usuarioPublico.username}" /></p>
                <p>Tipo: <c:out value="${usuarioPublico.tipo}" /></p>
                <p>Bio: <c:out value="${usuarioPublico.bio}" /></p>
                <p>Desde: <c:out value="${usuarioPublico.dataCriacao}" /></p>
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
                <form action="${pageContext.request.contextPath}/relacionamento" method="post">
                    <input type="hidden" name="tipo" value="${tipoRelacao}">
                    <input type="hidden" name="acao" value="salvar">
                    <input type="hidden" name="idDestino" value="${usuarioPublico.idUsuario}">
                    <label class="form-label">Seu ID (temporário)</label>
                    <input type="number" name="idUsuario" min="1" required class="form-control mb-2">
                    <button class="btn btn-primary">${tipoRelacao eq 'pagina' ? 'Seguir página' : 'Salvar pessoa'}</button>
                </form>
            </div></div>
        </c:when>
        <c:otherwise><div class="alert alert-warning">Perfil não encontrado.</div></c:otherwise>
    </c:choose>
</div>
</body>
</html>
