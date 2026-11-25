<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
            <div class="amis-painel amis-perfil-principal perfil-social">
                <div class="perfil-capa"></div>
                <div class="amis-perfil-cabecalho">
                    <div class="amis-avatar"><c:out value="${fn:substring(usuarioPublico.nome, 0, 1)}" /></div>
                    <div>
                <h2><c:out value="${usuarioPublico.nome}" /></h2>
                <p>@<c:out value="${usuarioPublico.username}" /></p>
                <p class="amis-perfil-bio"><c:out value="${usuarioPublico.bio}" /></p>
                <p class="amis-perfil-desde">Na AMIS desde <c:out value="${usuarioPublico.dataCriacao}" /></p>
                    </div>
                </div>
                <hr>
                
                <c:choose>
                    <c:when test="${usuarioPublico.tipo eq 'PAGINA' or usuarioPublico.tipo eq 'Pagina' or usuarioPublico.tipo eq 'Página' or usuarioPublico.tipo eq 'pagina'}">
                        <c:set var="tipoRelacao" value="pagina" />
                    </c:when>
                    <c:otherwise>
                        <c:set var="tipoRelacao" value="pessoa" />
                    </c:otherwise>
                </c:choose>
                <c:if test="${sessionScope.idUsuario != null and sessionScope.idUsuario != usuarioPublico.idUsuario}">
                <form class="amis-form-relacao" action="${pageContext.request.contextPath}/relacionamento" method="post">
                    <input type="hidden" name="tipo" value="${tipoRelacao}">
                    <c:set var="salvo" value="${false}" />
                    <c:forEach var="pessoa" items="${pessoasSalvas}">
                        <c:if test="${pessoa.idUsuario eq usuarioPublico.idUsuario}"><c:set var="salvo" value="${true}" /></c:if>
                    </c:forEach>
                    <c:forEach var="pagina" items="${paginasSeguidas}">
                        <c:if test="${pagina.idUsuario eq usuarioPublico.idUsuario}"><c:set var="salvo" value="${true}" /></c:if>
                    </c:forEach>
                    <input type="hidden" name="acao" value="${salvo ? 'remover' : 'salvar'}">
                    <input type="hidden" name="idDestino" value="${usuarioPublico.idUsuario}">
                    
                    
                    <button class="btn btn-roxo">${salvo ? (tipoRelacao eq 'pagina' ? 'Seguindo' : 'Pessoa salva') : (tipoRelacao eq 'pagina' ? 'Seguir página' : 'Salvar pessoa')}</button>
                </form>
                </c:if>
            </div>
            <div class="amis-painel">
                <h3>Postagens</h3>
                <c:forEach var="postagem" items="${postagensPublicas}">
                    <div class="amis-registro"><strong><c:out value="${postagem.titulo}" /></strong><p><c:out value="${postagem.texto}" /></p></div>
                </c:forEach>
                <c:if test="${empty postagensPublicas}"><p>Nenhuma postagem publicada.</p></c:if>
            </div>
        </c:when>
        <c:otherwise><div class="alert alert-warning">Perfil não encontrado.</div></c:otherwise>
    </c:choose>
</div>
<script src="${pageContext.request.contextPath}/js/tema.js"></script>
</body>
</html>
