<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>AMIS</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
        <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
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
                    <c:if test="${sessionScope.admin eq 1}">
                        <a class="amis-admin-link" href="${pageContext.request.contextPath}/admin.jsp">Admin</a>
                    </c:if>
                    <c:if test="${sessionScope.loggedUser != null}">
                        <a href="${pageContext.request.contextPath}/logout">Sair</a>
                    </c:if>
                    <c:if test="${sessionScope.loggedUser == null}">
                        <a href="${pageContext.request.contextPath}/login">Entrar</a>
                    </c:if>
                </div>
            </div>
        </header>
        <main class="container mt-4 amis-feed">
            <div class="row">
                <section class="col-lg-8">
                    <div class="amis-feed-titulo">
                        <div>
                            <h2>Seu feed</h2>
                            <p>Um espaço para compartilhar e conversar.</p>
                        </div>
                        <a href="${pageContext.request.contextPath}/create-postagem" class="btn btn-roxo">+ Nova postagem</a>
                    </div>
                    <c:forEach var="postagem" items="${postagens}">
                        <article class="postagem amis-post">
                            <c:forEach var="usuario" items="${usuarios}">
                                <c:if test="${usuario.idUsuario eq postagem.idUsuario}">
                                    <div class="amis-post-autor">
                                        <span class="amis-post-avatar">
                                            <c:out value="${fn:substring(usuario.nome, 0, 1)}"/>
                                        </span>
                                        <div>
                                            <p class="mb-0 amis-post-nome">
                                                <a href="${pageContext.request.contextPath}/perfil-publico?id=${usuario.idUsuario}">
                                                    <c:out value="${usuario.nome}"/>
                                                </a>
                                            </p>
                                            <span class="amis-post-legenda">
                                                @
                                                <c:out value="${usuario.username}"/>
                                            </span>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                            <details class="mb-2 text-end">
                                <summary style="cursor:pointer; list-style:none" aria-label="Opções da postagem">•••</summary>
                                <c:if test="${sessionScope.idUsuario ne postagem.idUsuario}">
                                    <a href="${pageContext.request.contextPath}/perfil-publico?id=${postagem.idUsuario}">Visitar perfil</a>
                                </c:if>
                                <c:if test="${sessionScope.idUsuario eq postagem.idUsuario}">
                                    <form action="${pageContext.request.contextPath}/delete-postagem" method="post">
                                        <input type="hidden" name="id" value="${postagem.idPostagem}">
                                        <button class="btn btn-outline-danger btn-sm">Excluir</button>
                                    </form>
                                </c:if>
                            </details>
                            <p class="amis-post-flag">
                                <c:out value="${postagem.flag}"/>
                            </p>
                            <small>${postagem.dataPostagem}</small>
                            <h4>
                                <c:out value="${postagem.titulo}"/>
                            </h4>
                            <p class="amis-post-texto">
                                <c:out value="${postagem.texto}"/>
                            </p>
                            <p class="amis-post-categoria">
                                <c:out value="${postagem.categoria}"/>
                            </p>
                            <div class="amis-post-acoes">
                                <c:if test="${not empty sessionScope.idUsuario}">
                                    <form action="${pageContext.request.contextPath}/item-salvo" method="post">
                                        <input type="hidden" name="idPostagem" value="${postagem.idPostagem}">
                                        <c:set var="salvo" value="${false}"/>
                                        <c:forEach var="item" items="${itensSalvos}">
                                            <c:if test="${item.idPostagem eq postagem.idPostagem}">
                                                <c:set var="salvo" value="${true}"/>
                                            </c:if>
                                        </c:forEach>
                                        <c:if test="${salvo}">
                                            <input type="hidden" name="acao" value="remover">
                                            <button class="btn btn-roxo btn-sm">Salvo</button>
                                        </c:if>
                                        <c:if test="${not salvo}">
                                            <button class="btn btn-outline-secondary btn-sm">Salvar</button>
                                        </c:if>
                                    </form>
                                </c:if>
                            </div>
                            <details class="mt-3" <c:if test="${param.comentarios eq postagem.idPostagem}">
                                open
                                </c:if>
                                >
                                <summary style="cursor:pointer">Comentários</summary>
                                <div class="mt-3">
                                    <c:if test="${not empty sessionScope.idUsuario}">
                                        <form action="${pageContext.request.contextPath}/create-comentario" method="post">
                                            <input type="hidden" name="idPostagem" value="${postagem.idPostagem}">
                                            <textarea name="texto" class="form-control mb-2" rows="2" placeholder="Escreva um comentário" required></textarea>
                                            <button class="btn btn-roxo btn-sm">Comentar</button>
                                        </form>
                                    </c:if>
                                    <c:if test="${empty sessionScope.idUsuario}">
                                        <a href="${pageContext.request.contextPath}/login">Entre para comentar ou salvar.</a>
                                    </c:if>
                                    <c:forEach var="comentario" items="${comentarios}">
                                        <c:if test="${comentario.idPostagem eq postagem.idPostagem}">
                                            <div class="border-top mt-3 pt-3">
                                                <c:forEach var="usuario" items="${usuarios}">
                                                    <c:if test="${usuario.idUsuario eq comentario.idUsuario}">
                                                        <strong>
                                                            <c:out value="${usuario.nome}"/>
                                                        </strong>
                                                    </c:if>
                                                </c:forEach>
                                                <p class="mb-0">
                                                    <c:out value="${comentario.texto}"/>
                                                </p>
                                                <c:if test="${sessionScope.idUsuario eq comentario.idUsuario}">
                                                    <form action="${pageContext.request.contextPath}/delete-comentario" method="post">
                                                        <input type="hidden" name="id" value="${comentario.idComentario}">
                                                        <input type="hidden" name="idPostagem" value="${postagem.idPostagem}">
                                                        <button class="btn btn-sm">Excluir comentário</button>
                                                    </form>
                                                </c:if>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </details>
                        </article>
                    </c:forEach>
                    <c:if test="${empty postagens}">
                        <p>Nenhuma postagem encontrada.</p>
                    </c:if>
                    <c:if test="${not empty postagens and empty param.id and empty param.pesquisa}">
                        <c:url var="descobrir" value="/find-all-postagens">
                            <c:param name="categoria" value="${param.categoria}"/>
                            <c:param name="flag" value="${param.flag}"/>
                            <c:param name="pesquisa" value="${param.pesquisa}"/>
                        </c:url>
                        <a class="btn btn-roxo w-100 mb-4" href="<c:out value='${descobrir}'/>">Descobrir mais postagens</a>
                    </c:if>
                </section>
                <aside class="col-lg-4">
                    <div class="amis-painel p-3 mb-3">
                        <h5>Pesquisa</h5>
                        <form action="${pageContext.request.contextPath}/find-all-postagens" method="get">
                            <input type="hidden" name="categoria" value="<c:out value='${param.categoria}'/>">
                            <input type="hidden" name="flag" value="<c:out value='${param.flag}'/>">
                            <input class="form-control mb-2" name="pesquisa" placeholder="Pesquisar postagens" value="<c:out value='${param.pesquisa}'/>">
                            <button class="btn btn-roxo btn-sm" type="submit">Pesquisar</button>
                            <c:url var="limparPesquisa" value="/find-all-postagens">
                                <c:param name="categoria" value="${param.categoria}"/>
                                <c:param name="flag" value="${param.flag}"/>
                            </c:url>
                            <a class="btn btn-outline-secondary btn-sm" href="<c:out value='${limparPesquisa}'/>">Limpar pesquisa</a>
                        </form>
                    </div>
                    <div class="amis-painel p-3 mb-3">
                        <h5>Filtros</h5>
                        <form action="${pageContext.request.contextPath}/find-all-postagens" method="get">
                            <input type="hidden" name="pesquisa" value="<c:out value='${param.pesquisa}'/>">
                            <label for="categoria">Categoria</label>
                            <select id="categoria" name="categoria" class="form-select mb-3">
                                <option value="">
                                    Todas as categorias
                                </option>
                                <c:forEach var="categoria" items="${categorias}">
                                    <option value="${categoria.id}" ${param.categoria eq categoria.id ? 'selected' : ''}>
                                        <c:out value="${categoria.nome}"/>
                                    </option>
                                </c:forEach>
                            </select>
                            <label for="flag">Flag</label>
                            <select id="flag" name="flag" class="form-select mb-3">
                                <option value="">
                                    Todas as flags
                                </option>
                                <c:forEach var="flag" items="${flags}">
                                    <option value="${flag.id}" ${param.flag eq flag.id ? 'selected' : ''}>
                                        <c:out value="${flag.nome}"/>
                                    </option>
                                </c:forEach>
                            </select>
                            <button class="btn btn-roxo btn-sm" type="submit">Filtrar</button>
                            <c:url var="todos" value="/find-all-postagens">
                                <c:param name="pesquisa" value="${param.pesquisa}"/>
                            </c:url>
                            <a class="btn btn-outline-secondary btn-sm" href="<c:out value='${todos}'/>">Todos</a>
                            <a class="btn btn-outline-secondary btn-sm" href="${pageContext.request.contextPath}/find-all-postagens">Limpar tudo</a>
                        </form>
                    </div>
                </aside>
            </div>
        </main>
        <script src="${pageContext.request.contextPath}/js/tema.js"></script>
    </body>
</html>
