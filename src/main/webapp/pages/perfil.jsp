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
                            <div class="amis-avatar">
                                <c:out value="${fn:substring(usuario.nome, 0, 1)}" />
                            </div>
                            <div>
                                <h2 class="amis-perfil-nome">
                                    <c:out value="${usuario.nome}" />
                                </h2>
                                <p class="amis-perfil-usuario">
                                    @
                                    <c:out value="${usuario.username}" />
                                </p>
                                <p class="amis-perfil-bio">
                                    <c:out value="${usuario.bio}" />
                                </p>
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
                            <a href="${linkEditar}" class="btn btn-roxo">Editar perfil</a>
                            <details class="perfil-opcoes">
                                <summary aria-label="Opções da conta">⋯</summary>
                                <form onsubmit="return confirm('Tem certeza de que deseja excluir sua conta?')" action="${pageContext.request.contextPath}/delete-usuario"
                      method="post" class="d-inline">
                                    <input type="hidden" name="origem" value="perfil">
                                    <button type="submit" class="btn btn-outline-danger">Excluir conta</button>
                                </form>
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
                                <div class="amis-registro">
                                    <strong>
                                        <a href="${pageContext.request.contextPath}/find-all-postagens?id=${postagem.idPostagem}&comentarios=${postagem.idPostagem}">
                                            <c:out value="${postagem.titulo}" />
                                        </a>
                                    </strong>
                                    <small>${postagem.dataPostagem}</small>
                                    <p>
                                        <c:out value="${postagem.texto}" />
                                    </p>
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
                                <div class="amis-registro">
                                    <strong>
                                        <a href="${pageContext.request.contextPath}/find-all-postagens?id=${post.idPostagem}&comentarios=${post.idPostagem}">
                                            <c:out value="${post.titulo}" />
                                        </a>
                                    </strong>
                                    <p>
                                        <c:out value="${post.texto}" />
                                    </p>
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
                                <div class="mb-2">
                                    <a href="${pageContext.request.contextPath}/perfil-publico?id=${pessoa.idUsuario}">
                                        <c:out value="${pessoa.nome}" />
                                    </a>
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
                                <div class="mb-2">
                                    <a href="${pageContext.request.contextPath}/perfil-publico?id=${pagina.idUsuario}">
                                        <c:out value="${pagina.nome}" />
                                    </a>
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
