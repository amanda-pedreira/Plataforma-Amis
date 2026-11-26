<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Perfil público - AMIS</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/amis-visual.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/visual-v4.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/perfis-v4.css">
    </head>
    <body class="bg-color-claro amis-organizado amis-tela visual-v4 perfil-v4">
        <header class="amis-topo">
    <div class="amis-menu container">
        <a href="${pageContext.request.contextPath}/find-all-postagens"><img class="logo-nova" src="${pageContext.request.contextPath}/img/visual/logo.png" alt="amis."></a>
        <nav class="amis-links">
            <a class="" href="${pageContext.request.contextPath}/find-all-postagens">▦ Feed</a>
            <a class="" href="${pageContext.request.contextPath}/journal">▤ Diário</a>
        </nav>
        <div class="amis-direita">
            <button type="button" id="botao-tema" class="amis-tema" onclick="mudarTema()" aria-label="Alternar tema">☾</button>
            <details class="perfil-menu">
                <summary><img class="avatar-novo" src="${pageContext.request.contextPath}/img/visual/pessoa.png" alt=""> <c:out value="${sessionScope.loggedUser}"/></summary>
                <a href="${pageContext.request.contextPath}/find-all-usuarios?pagina=perfil">Perfil</a>
                <c:if test="${sessionScope.admin eq 1}"><a href="${pageContext.request.contextPath}/admin.jsp">Admin</a></c:if>
                <a href="${pageContext.request.contextPath}/logout">Sair</a>
            </details>
        </div>
    </div>
</header>
        <div class="container mt-4 amis-perfil-pagina" style="max-width:900px">
            <c:choose>
                <c:when test="${not empty usuarioPublico}">
                    <div class="amis-painel amis-perfil-principal perfil-social">
                        <div class="perfil-capa">
                        </div>
                        <div class="amis-perfil-cabecalho">
                            <c:choose>
                                    <c:when test="${not empty usuarioPublico.foto}"><img class="perfil-foto" src="<c:out value='${usuarioPublico.foto}'/>" alt="" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/img/visual/${usuarioPublico.tipo eq 'PAGINA' ? 'pagina' : 'pessoa'}.png';"></c:when>
                                    <c:when test="${fn:toLowerCase(usuarioPublico.tipo) eq 'pagina' or fn:toLowerCase(usuarioPublico.tipo) eq 'página'}"><img class="perfil-foto" src="${pageContext.request.contextPath}/img/visual/pagina.png" alt=""></c:when>
                                    <c:otherwise><img class="perfil-foto" src="${pageContext.request.contextPath}/img/visual/pessoa.png" alt=""></c:otherwise>
                                </c:choose>
                            <div>
                                <h2 class="amis-perfil-nome">
                                    <c:out value="${usuarioPublico.nome}" />
                                </h2>
                                <p class="amis-perfil-usuario">
                                    @<c:out value="${usuarioPublico.username}" />
                                </p>
                                <p class="amis-perfil-bio"><c:out value="${usuarioPublico.bio}" /></p>
                                <p class="amis-perfil-desde">
                                    Na AMIS desde
                                    <c:out value="${usuarioPublico.dataCriacao}" />
                                </p>
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
                                    <c:if test="${pessoa.idUsuario eq usuarioPublico.idUsuario}">
                                        <c:set var="salvo" value="${true}" />
                                    </c:if>
                                </c:forEach>
                                <c:forEach var="pagina" items="${paginasSeguidas}">
                                    <c:if test="${pagina.idUsuario eq usuarioPublico.idUsuario}">
                                        <c:set var="salvo" value="${true}" />
                                    </c:if>
                                </c:forEach>
                                <input type="hidden" name="acao" value="${salvo ? 'remover' : 'salvar'}">
                                <input type="hidden" name="idDestino" value="${usuarioPublico.idUsuario}">
                                <button class="btn ${salvo ? 'btn-roxo' : 'perfil-seguir'}">${salvo ? (tipoRelacao eq 'pagina' ? 'Seguindo' : 'Pessoa salva') : (tipoRelacao eq 'pagina' ? 'Seguir página' : 'Salvar pessoa')}</button>
                            </form>
                        </c:if>
                    </div>
                    <div class="amis-painel amis-lista-perfil">
                        <h3>Postagens</h3>
                        <c:forEach var="postagem" items="${postagensPublicas}">
                            <div class="amis-registro perfil-post"><div class="perfil-post-autor"><c:choose><c:when test="${not empty usuarioPublico.foto}"><img class="avatar-novo" src="<c:out value='${usuarioPublico.foto}'/>" alt="" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/img/visual/${fn:toLowerCase(usuarioPublico.tipo) eq 'pagina' ? 'pagina' : 'pessoa'}.png';"/></c:when><c:otherwise><img class="avatar-novo" src="${pageContext.request.contextPath}/img/visual/${fn:toLowerCase(usuarioPublico.tipo) eq 'pagina' or fn:toLowerCase(usuarioPublico.tipo) eq 'página' ? 'pagina' : 'pessoa'}.png" alt=""/></c:otherwise></c:choose><div><b><c:out value="${usuarioPublico.nome}"/></b><small>@<c:out value="${usuarioPublico.username}"/></small></div></div><div class="perfil-post-categoria"><c:out value="${postagem.categoria}"/></div>
                                <strong>
                                    <a href="${pageContext.request.contextPath}/find-all-postagens?id=${postagem.idPostagem}&comentarios=${postagem.idPostagem}">
                                        <c:out value="${postagem.titulo}" />
                                    </a>
                                </strong>
                                <small>${postagem.dataPostagem}</small>
                                <p class="perfil-post-texto"><c:out value="${postagem.texto}" /></p><c:if test="${not empty postagem.flag}"><span class="perfil-post-flag"><c:out value="${postagem.flag}"/></span></c:if>
                            </div>
                        </c:forEach>
                        <c:if test="${empty postagensPublicas}">
                            <p>Nenhuma postagem publicada.</p>
                        </c:if>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-warning">
                        Perfil não encontrado.
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
        <script src="${pageContext.request.contextPath}/js/tema.js"></script>
    </body>
</html>
