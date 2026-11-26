<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>AMIS</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/prototipo-v4.css">
</head>
    <body class="bg-color-claro feed-page">
        <header><nav><a class="logo" href="${pageContext.request.contextPath}/find-all-postagens"><img src="${pageContext.request.contextPath}/img/visual/logo.png" alt="amis." style="width:110px;height:auto;display:block;"></a><div class="menu"><a class="active" href="${pageContext.request.contextPath}/find-all-postagens">▦ &nbsp; Feed</a><a  href="${pageContext.request.contextPath}/journal">▤ &nbsp; Diário</a></div><div class="profile"><button id="botao-tema" onclick="mudarTema()" aria-label="Mudar tema">☾</button><details><summary><img class="avatar" src="${pageContext.request.contextPath}/img/visual/pessoa.png" alt=""><strong><c:out value="${sessionScope.loggedUser}"/></strong></summary><div class="dropdown"><a href="${pageContext.request.contextPath}/find-all-usuarios?pagina=perfil">Perfil</a><c:if test="${sessionScope.admin eq 1}"><a href="${pageContext.request.contextPath}/admin.jsp">Admin</a></c:if><a href="${pageContext.request.contextPath}/logout">Sair</a></div></details></div></nav></header>
        <main>
            <div class="layout">
                <section class="left">
                    <section class="card hero"><div><h1>Seu espaço, suas histórias.</h1><p>Um lugar para compartilhar, refletir e se conectar.</p></div></section>
                    <div class="card compose"><img class="avatar" src="${pageContext.request.contextPath}/img/visual/pessoa.png" alt=""><a class="prompt" href="${pageContext.request.contextPath}/create-postagem">O que você gostaria de compartilhar?</a><a class="primary" href="${pageContext.request.contextPath}/create-postagem">+ Criar post</a></div>
                    <c:forEach var="postagem" items="${postagens}">
                        <article class="card post">
                            <c:forEach var="usuario" items="${usuarios}">
                                <c:if test="${usuario.idUsuario eq postagem.idUsuario}">
                                    <div class="author">
                                        <c:choose><c:when test="${not empty usuario.foto}"><img class="avatar" src="<c:out value='${usuario.foto}'/>" alt="" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/img/visual/${usuario.tipo eq 'PAGINA' ? 'pagina' : 'pessoa'}.png';"></c:when><c:when test="${usuario.tipo eq 'PAGINA'}"><img class="avatar" src="${pageContext.request.contextPath}/img/visual/pagina.png" alt=""></c:when><c:otherwise><img class="avatar" src="${pageContext.request.contextPath}/img/visual/pessoa.png" alt=""></c:otherwise></c:choose>
                                        <div>
                                            <p >
                                                <a href="${pageContext.request.contextPath}/perfil-publico?id=${usuario.idUsuario}">
                                                    <c:out value="${usuario.nome}"/>
                                                </a>
                                            </p>
                                            <span class="muted">
                                                @
                                                <c:out value="${usuario.username}"/> · ${postagem.dataPostagem}
                                            </span>
                                        </div>
                                    </div>
                                </c:if>
                            </c:forEach>
                            <details class="more">
                                <summary style="cursor:pointer; list-style:none" aria-label="Opções da postagem">•••</summary>
                                <div class="post-menu-list"><c:if test="${sessionScope.idUsuario ne postagem.idUsuario}">
                                    <a href="${pageContext.request.contextPath}/perfil-publico?id=${postagem.idUsuario}"><span aria-hidden="true">♙</span> Visitar perfil</a>
                                </c:if>
                                <c:if test="${sessionScope.idUsuario eq postagem.idUsuario}">
                                    <form action="${pageContext.request.contextPath}/delete-postagem" method="post">
                                        <input type="hidden" name="id" value="${postagem.idPostagem}">
                                        <button class="post-delete"><span aria-hidden="true">×</span> Excluir postagem</button>
                                    </form>
                                </c:if>
                            </div></details>

                            <p class="category">
                                <c:out value="${postagem.categoria}"/>
                            </p>
                            <h2>
                                <c:out value="${postagem.titulo}"/>
                            </h2>
                            <p class="amis-post-texto"><c:out value="${postagem.texto}"/></p>
                            <p class="flag">
                                <c:out value="${postagem.flag}"/>
                            </p>
                            <div class="actions interaction-bar">
                                <button type="button" class="comment-action" aria-controls="comentarios-${postagem.idPostagem}" aria-expanded="${param.comentarios eq postagem.idPostagem}" onclick="var painel=document.getElementById('comentarios-${postagem.idPostagem}'); painel.hidden=!painel.hidden; this.setAttribute('aria-expanded', !painel.hidden);"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7"><path d="M20 11.5a8 8 0 0 1-8 8 9 9 0 0 1-3.5-.7L4 20l1.2-4A8 8 0 1 1 20 11.5Z"/></svg>Comentários</button>
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
                                            <button class="save-action saved">Salvo</button>
                                        </c:if>
                                        <c:if test="${not salvo}">
                                            <button class="save-action">Salvar</button>
                                        </c:if>
                                    </form>
                                </c:if>
                            </div>
                            <div id="comentarios-${postagem.idPostagem}" class="comment-panel" <c:if test="${param.comentarios ne postagem.idPostagem}">hidden</c:if>>
                                <div class="comments">
                                    <c:if test="${not empty sessionScope.idUsuario}">
                                        <form action="${pageContext.request.contextPath}/create-comentario" method="post">
                                            <input type="hidden" name="idPostagem" value="${postagem.idPostagem}">
                                            <textarea name="texto" class="form-control mb-2" rows="2" placeholder="Escreva um comentário" required></textarea>
                                            <button class="primary comment-submit">Comentar</button>
                                        </form>
                                    </c:if>
                                    <c:if test="${empty sessionScope.idUsuario}">
                                        <a href="${pageContext.request.contextPath}/login">Entre para comentar ou salvar.</a>
                                    </c:if>
                                    <c:forEach var="comentario" items="${comentarios}">
                                        <c:if test="${comentario.idPostagem eq postagem.idPostagem}">
                                            <div class="comment-item">
                                                <c:forEach var="usuario" items="${usuarios}">
                                                    <c:if test="${usuario.idUsuario eq comentario.idUsuario}">
                                                        <div class="comment-author">
                                                            <c:choose><c:when test="${not empty usuario.foto}"><img class="avatar" src="<c:out value='${usuario.foto}'/>" alt="" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/img/visual/${usuario.tipo eq 'PAGINA' ? 'pagina' : 'pessoa'}.png';"></c:when><c:when test="${usuario.tipo eq 'PAGINA'}"><img class="avatar" src="${pageContext.request.contextPath}/img/visual/pagina.png" alt=""></c:when><c:otherwise><img class="avatar" src="${pageContext.request.contextPath}/img/visual/pessoa.png" alt=""></c:otherwise></c:choose>
                                                            <div><a href="${pageContext.request.contextPath}/perfil-publico?id=${usuario.idUsuario}"><strong><c:out value="${usuario.nome}"/></strong></a><span class="muted">@<c:out value="${usuario.username}"/></span></div>
                                                        </div>
                                                    </c:if>
                                                </c:forEach>
                                                <p class="comment-text"><c:out value="${comentario.texto}"/></p>
                                                <c:if test="${sessionScope.idUsuario eq comentario.idUsuario}">
                                                    <form action="${pageContext.request.contextPath}/delete-comentario" method="post">
                                                        <input type="hidden" name="id" value="${comentario.idComentario}">
                                                        <input type="hidden" name="idPostagem" value="${postagem.idPostagem}">
                                                        <button class="comment-delete">Excluir comentário</button>
                                                    </form>
                                                </c:if>
                                            </div>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
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
                <aside class="right"><section class="card welcome"><svg class="botanical" viewBox="0 0 100 140" aria-hidden="true"><g fill="none" stroke="#9c468d" stroke-width="1.5"><path d="M12 140 Q65 85 77 9 M44 103 Q25 76 16 59 M58 77 Q83 63 94 41"/></g><g fill="#c94c91"><path d="M77 10 Q53 26 69 49 Q91 30 77 10"/><path d="M16 59 Q7 85 43 103 Q40 76 16 59"/><path d="M94 41 Q68 43 58 77 Q89 73 94 41"/></g><g fill="#9257bd"><path d="M60 73 Q29 65 33 40 Q58 44 60 73"/><path d="M36 116 Q61 89 87 101 Q70 123 36 116"/></g></svg><svg class="botanical top" viewBox="0 0 100 140" aria-hidden="true"><g fill="none" stroke="#9c468d" stroke-width="1.5"><path d="M12 140 Q65 85 77 9 M44 103 Q25 76 16 59 M58 77 Q83 63 94 41"/></g><g fill="#c94c91"><path d="M77 10 Q53 26 69 49 Q91 30 77 10"/><path d="M16 59 Q7 85 43 103 Q40 76 16 59"/><path d="M94 41 Q68 43 58 77 Q89 73 94 41"/></g><g fill="#9257bd"><path d="M60 73 Q29 65 33 40 Q58 44 60 73"/><path d="M36 116 Q61 89 87 101 Q70 123 36 116"/></g></svg><h2 style="margin-top:14px">Olá, tendo um ótimo dia?</h2><p>Registre sobre seu dia no Diário ou compartilhe suas experiências no Feed.</p><a class="outline" href="${pageContext.request.contextPath}/journal">▤ &nbsp; Ir para o Diário →</a></section>
                    <section class="card filters"><h2>Explore a comunidade</h2><form action="${pageContext.request.contextPath}/find-all-postagens" method="get"><div class="search"><input name="pesquisa" placeholder="Pesquisar postagens..." value="<c:out value='${param.pesquisa}'/>"><button type="submit" aria-label="Pesquisar">⌕</button></div><hr style="border:0;border-top:1px solid #eee;margin:24px 0"><strong>Filtros</strong><a class="clear" href="${pageContext.request.contextPath}/find-all-postagens">Limpar</a><label for="categoria">Categoria</label><select id="categoria" name="categoria" class="form-select mb-3">
                                <option value="">
                                    Todas as categorias
                                </option>
                                <c:forEach var="categoria" items="${categorias}">
                                    <option value="${categoria.id}" ${param.categoria eq categoria.id ? 'selected' : ''}>
                                        <c:out value="${categoria.nome}"/>
                                    </option>
                                </c:forEach>
                            </select><label for="flag">Flag</label><select id="flag" name="flag" class="form-select mb-3">
                                <option value="">
                                    Todas as flags
                                </option>
                                <c:forEach var="flag" items="${flags}">
                                    <option value="${flag.id}" ${param.flag eq flag.id ? 'selected' : ''}>
                                        <c:out value="${flag.nome}"/>
                                    </option>
                                </c:forEach>
                            </select><button class="primary" type="submit">Aplicar filtros</button></form></section>
</aside>
            </div>
        </main>
        <script src="${pageContext.request.contextPath}/js/tema.js"></script>
    </body>
</html>
