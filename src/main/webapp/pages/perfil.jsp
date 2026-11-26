<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Perfil - AMIS</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
        <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/perfil.css">
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
        <div class="container mt-4 amis-perfil-pagina" style="max-width:1050px">
            <c:forEach var="usuario" items="${usuarios}">
                <c:if test="${usuario.idUsuario eq sessionScope.idUsuario}">
                    <div class="amis-painel amis-perfil-principal perfil-social">
                        <div class="perfil-capa">
                        </div>
                        <div class="amis-perfil-cabecalho">
                            <c:choose>
                                    <c:when test="${not empty usuario.foto}"><img class="perfil-foto" src="<c:out value='${usuario.foto}'/>" alt="" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/img/visual/${usuario.tipo eq 'PAGINA' ? 'pagina' : 'pessoa'}.png';"></c:when>
                                    <c:when test="${fn:toLowerCase(usuario.tipo) eq 'pagina' or fn:toLowerCase(usuario.tipo) eq 'página'}"><img class="perfil-foto" src="${pageContext.request.contextPath}/img/visual/pagina.png" alt=""></c:when>
                                    <c:otherwise><img class="perfil-foto" src="${pageContext.request.contextPath}/img/visual/pessoa.png" alt=""></c:otherwise>
                                </c:choose>
                            <div>
                                <h2 class="amis-perfil-nome">
                                    <c:out value="${usuario.nome}" />
                                </h2>
                                <p class="amis-perfil-usuario">
                                    @<c:out value="${usuario.username}" />
                                </p>
                                <p class="amis-perfil-bio"><c:out value="${usuario.bio}" /></p>
                            </div>
                        </div>
                        <p class="amis-perfil-desde">
                            Na AMIS desde
                            <c:out value="${usuario.dataCriacao}" />
                        </p>
                        <c:if test="${param.erro == '1'}">
                            <div class="alert alert-warning">
                                Não foi possível realizar a alteração.
                            </div>
                        </c:if>
                        <c:url var="linkEditar" value="/pages/perfil-form.jsp">
                            <c:param name="foto" value="${usuario.foto}" />
                            <c:param name="username" value="${usuario.username}" />
                            <c:param name="nome" value="${usuario.nome}" />
                            <c:param name="email" value="${usuario.email}" />
                            <c:param name="bio" value="${usuario.bio}" />
                        </c:url>
                        <div class="amis-perfil-acoes">

                            <details class="perfil-opcoes">
                                <summary aria-label="Opções da conta">•••</summary>
                                <div class="perfil-opcoes-lista">
                                    <a href="${linkEditar}">✎ &nbsp; Editar perfil</a><a href="${pageContext.request.contextPath}/pages/senha.jsp">Alterar senha</a>
                                <form onsubmit="return confirm('Tem certeza de que deseja excluir sua conta?')" action="${pageContext.request.contextPath}/delete-usuario"
                      method="post" class="d-inline">
                                    <input type="hidden" name="origem" value="perfil">
                                    <button type="submit" class="btn btn-outline-danger">Excluir conta</button>
                                </form>
                                </div>
                            </details>
                        </div>
                    </div>
                    <div class="amis-abas">
                        <a class="${empty param.aba or param.aba eq 'minhas-postagens' ? 'aba-ativa' : ''}" href="${pageContext.request.contextPath}/find-all-usuarios?pagina=perfil&aba=minhas-postagens">Minhas postagens</a>
                        <a class="${param.aba eq 'pessoas-salvas' ? 'aba-ativa' : ''}" href="${pageContext.request.contextPath}/find-all-usuarios?pagina=perfil&aba=pessoas-salvas">Pessoas salvas</a>
                        <a class="${param.aba eq 'postagens-salvas' ? 'aba-ativa' : ''}" href="${pageContext.request.contextPath}/find-all-usuarios?pagina=perfil&aba=postagens-salvas">Posts salvos</a>
                        <a class="${param.aba eq 'paginas-seguidas' ? 'aba-ativa' : ''}" href="${pageContext.request.contextPath}/find-all-usuarios?pagina=perfil&aba=paginas-seguidas">Páginas seguidas</a>
                    </div>
                    <c:if test="${empty param.aba or param.aba eq 'minhas-postagens'}">
                        <div class="amis-painel amis-lista-perfil" id="minhas-postagens">
                            <h3>Minhas postagens</h3>
                            <c:forEach var="postagem" items="${minhasPostagens}">
                                <div class="amis-registro perfil-post"><div class="perfil-post-autor"><c:choose><c:when test="${not empty usuario.foto}"><img class="avatar-novo" src="<c:out value='${usuario.foto}'/>" alt="" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/img/visual/${fn:toLowerCase(usuario.tipo) eq 'pagina' ? 'pagina' : 'pessoa'}.png';"/></c:when><c:otherwise><img class="avatar-novo" src="${pageContext.request.contextPath}/img/visual/${fn:toLowerCase(usuario.tipo) eq 'pagina' or fn:toLowerCase(usuario.tipo) eq 'página' ? 'pagina' : 'pessoa'}.png" alt=""/></c:otherwise></c:choose><div><b><c:out value="${usuario.nome}"/></b><small>@<c:out value="${usuario.username}"/></small></div></div><div class="perfil-post-categoria"><c:out value="${postagem.categoria}"/></div>
                                    <strong>
                                        <a href="${pageContext.request.contextPath}/find-all-postagens?id=${postagem.idPostagem}&comentarios=${postagem.idPostagem}">
                                            <c:out value="${postagem.titulo}" />
                                        </a>
                                    </strong>
                                    <small>${postagem.dataPostagem}</small>
                                    <p class="perfil-post-texto"><c:out value="${postagem.texto}" /></p><c:if test="${not empty postagem.flag}"><span class="perfil-post-flag"><c:out value="${postagem.flag}"/></span></c:if>
                                </div>
                            </c:forEach>
                            <c:if test="${empty minhasPostagens}">
                                <p>Nenhuma postagem cadastrada.</p>
                            </c:if>
                        </div>
                    </c:if>
                    <c:if test="${param.aba eq 'postagens-salvas'}">
                        <div class="amis-painel amis-lista-perfil" id="postagens-salvas">
                            <h3>Postagens salvas</h3>
                            <c:forEach var="post" items="${itensSalvos}">
                                <div class="amis-registro perfil-post"><div class="perfil-post-categoria"><c:out value="${post.categoria}"/></div>
                                    <strong>
                                        <a href="${pageContext.request.contextPath}/find-all-postagens?id=${post.idPostagem}&comentarios=${post.idPostagem}">
                                            <c:out value="${post.titulo}" />
                                        </a>
                                    </strong>
                                    <p class="perfil-post-texto"><c:out value="${post.texto}" /></p><c:if test="${not empty post.flag}"><span class="perfil-post-flag"><c:out value="${post.flag}"/></span></c:if>
                                    <form action="${pageContext.request.contextPath}/item-salvo" method="post">
                                        <input type="hidden" name="acao" value="remover">
                                        <input type="hidden" name="origem" value="perfil">
                                        <input type="hidden" name="idPostagem" value="${post.idPostagem}">
                                        <button class="btn btn-outline-danger btn-sm">Remover dos salvos</button>
                                    </form>
                                </div>
                            </c:forEach>
                            <c:if test="${empty itensSalvos}">
                                <p>Nenhuma postagem salva.</p>
                            </c:if>
                        </div>
                    </c:if>
                    <c:if test="${param.aba eq 'pessoas-salvas'}">
                        <div class="amis-painel amis-lista-perfil" id="pessoas-salvas">
                            <h3>Pessoas salvas</h3>
                            <c:forEach var="pessoa" items="${pessoasSalvas}">
                                <div class="perfil-relacao">
                                    <c:choose>
                                    <c:when test="${not empty pessoa.foto}"><img class="avatar-novo" src="<c:out value='${pessoa.foto}'/>" alt="" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/img/visual/${pessoa.tipo eq 'PAGINA' ? 'pagina' : 'pessoa'}.png';"></c:when>
                                    <c:when test="${fn:toLowerCase(pessoa.tipo) eq 'pagina' or fn:toLowerCase(pessoa.tipo) eq 'página'}"><img class="avatar-novo" src="${pageContext.request.contextPath}/img/visual/pagina.png" alt=""></c:when>
                                    <c:otherwise><img class="avatar-novo" src="${pageContext.request.contextPath}/img/visual/pessoa.png" alt=""></c:otherwise>
                                </c:choose>
                                    <div class="perfil-relacao-info"><a href="${pageContext.request.contextPath}/perfil-publico?id=${pessoa.idUsuario}">
                                        <c:out value="${pessoa.nome}" />
                                    </a><small>@<c:out value="${pessoa.username}"/></small></div>
                                    <form action="${pageContext.request.contextPath}/relacionamento" method="post" class="d-inline">
                                        <input type="hidden" name="tipo" value="pessoa">
                                        <input type="hidden" name="acao" value="remover">
                                        <input type="hidden" name="origem" value="perfil">
                                        <input type="hidden" name="idDestino" value="${pessoa.idUsuario}">
                                        <button class="btn btn-outline-danger btn-sm">Remover</button>
                                    </form>
                                </div>
                            </c:forEach>
                            <c:if test="${empty pessoasSalvas}">
                                <p>Nenhuma pessoa salva.</p>
                            </c:if>
                        </div>
                    </c:if>
                    <c:if test="${param.aba eq 'paginas-seguidas'}">
                        <div class="amis-painel amis-lista-perfil" id="paginas-seguidas">
                            <h3>Páginas seguidas</h3>
                            <c:forEach var="pagina" items="${paginasSeguidas}">
                                <div class="perfil-relacao">
                                    <c:choose>
                                    <c:when test="${not empty pagina.foto}"><img class="avatar-novo" src="<c:out value='${pagina.foto}'/>" alt="" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/img/visual/${pagina.tipo eq 'PAGINA' ? 'pagina' : 'pessoa'}.png';"></c:when>
                                    <c:when test="${fn:toLowerCase(pagina.tipo) eq 'pagina' or fn:toLowerCase(pagina.tipo) eq 'página'}"><img class="avatar-novo" src="${pageContext.request.contextPath}/img/visual/pagina.png" alt=""></c:when>
                                    <c:otherwise><img class="avatar-novo" src="${pageContext.request.contextPath}/img/visual/pessoa.png" alt=""></c:otherwise>
                                </c:choose>
                                    <div class="perfil-relacao-info"><a href="${pageContext.request.contextPath}/perfil-publico?id=${pagina.idUsuario}">
                                        <c:out value="${pagina.nome}" />
                                    </a><small>@<c:out value="${pagina.username}"/></small></div>
                                    <form action="${pageContext.request.contextPath}/relacionamento" method="post" class="d-inline">
                                        <input type="hidden" name="tipo" value="pagina">
                                        <input type="hidden" name="acao" value="remover">
                                        <input type="hidden" name="origem" value="perfil">
                                        <input type="hidden" name="idDestino" value="${pagina.idUsuario}">
                                        <button class="btn btn-outline-danger btn-sm">Deixar de seguir</button>
                                    </form>
                                </div>
                            </c:forEach>
                            <c:if test="${empty paginasSeguidas}">
                                <p>Nenhuma página seguida.</p>
                            </c:if>
                        </div>
                    </c:if>
                </c:if>
            </c:forEach>
        </div>
        <script src="${pageContext.request.contextPath}/js/tema.js"></script>
    </body>
</html>
