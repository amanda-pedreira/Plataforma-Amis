
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
            <a class="amis-admin-link" href="${pageContext.request.contextPath}/admin.jsp">Admin</a>
        </div>
    </div>
</header>
<div class="container mt-4 amis-feed">
    <div class="amis-feed-titulo"><div><h2>Seu feed</h2><p>Um espaço para compartilhar e conversar.</p></div><a href="${pageContext.request.contextPath}/pages/postagem-form.jsp" class="btn btn-roxo">+ Nova postagem</a></div>
    <div class="row justify-content-center">
        <div class="col-lg-9 col-xl-8">

            <h2 class="visually-hidden">Feed</h2>
            <div class="alert alert-warning" role="alert">
                Temporário: todos podem alterar e excluir postagens. Depois, cada usuário poderá alterar ou excluir apenas suas próprias postagens.
            </div>



            <c:forEach var="postagem" items="${postagens}">

                <article class="postagem amis-post">
                    <div class="amis-post-autor"><span class="amis-post-avatar"><c:out value="${fn:substring(nomesAutores[postagem.idUsuario], 0, 1)}" /></span><div>

                    <p class="mb-0 amis-post-nome">
                        <a href="${pageContext.request.contextPath}/perfil-publico?id=${postagem.idUsuario}">
                            <c:out value="${nomesAutores[postagem.idUsuario]}" />
                        </a>
                    </p><span class="amis-post-legenda">Publicação na AMIS</span></div></div>
                    <h4><c:out value="${postagem.titulo}" /></h4>

                    <p class="amis-post-texto"><c:out value="${postagem.texto}" /></p>

                    <p class="amis-post-categoria">
                        Categoria:
                        <c:out value="${postagem.categoria}" />
                    </p>

                    <p class="amis-post-flag">
                        Flag:
                        <c:out value="${postagem.flag}" />
                    </p>

                    <c:url var="editar" value="/pages/postagem-form.jsp">
                        <c:param name="id" value="${postagem.idPostagem}" />
                        <c:param name="idUsuario" value="${postagem.idUsuario}" />
                        <c:param name="idCategoria" value="${postagem.idCategoria}" />
                        <c:param name="idFlag" value="${postagem.idFlag}" />
                        <c:param name="titulo" value="${postagem.titulo}" />
                        <c:param name="texto" value="${postagem.texto}" />
                    </c:url>

                    <div class="amis-post-acoes">
                    <a href="${editar}" class="btn btn-outline-secondary btn-sm">
                        Editar
                    </a>

                    <button class="btn btn-outline-secondary btn-sm" type="button" data-bs-toggle="collapse" data-bs-target="#salvar${postagem.idPostagem}">Salvar postagem</button>
                    <div class="collapse mt-2" id="salvar${postagem.idPostagem}">
                        <form action="${pageContext.request.contextPath}/item-salvo" method="post" class="card card-body">
                            <p>Salvar: <strong><c:out value="${postagem.titulo}" /></strong></p>
                            <input type="hidden" name="idPostagem" value="${postagem.idPostagem}">
                            <label>Seu ID (temporário)</label>
                            <input type="number" name="idUsuario" min="1" class="form-control mb-2" required>
                            <button class="btn btn-primary btn-sm">Salvar</button>
                        </form>
                    </div>

                    <button class="btn btn-outline-secondary btn-sm" type="button"
                            data-bs-toggle="collapse" data-bs-target="#comentar${postagem.idPostagem}">
                        Comentar
                    </button>
                    <a class="btn btn-outline-secondary btn-sm"
                       href="${pageContext.request.contextPath}/find-all-comentarios?idPostagem=${postagem.idPostagem}">
                        Ver comentários
                    </a>

                    <div class="collapse mt-3" id="comentar${postagem.idPostagem}">
                        <div class="card card-body">
                            <p class="mb-2"><strong>Comentando na postagem:</strong>
                                <c:out value="${postagem.titulo}" /></p>
                            <form action="${pageContext.request.contextPath}/create-comentario" method="post">
                                <input type="hidden" name="idPostagem" value="${postagem.idPostagem}">
                                <div class="mb-2">
                                    <label class="form-label">ID do usuário (temporário)</label>
                                    <input type="number" name="idUsuario" min="1" class="form-control" required>
                                </div>
                                <div class="mb-2">
                                    <label class="form-label">Seu comentário</label>
                                    <textarea name="texto" rows="3" class="form-control" required></textarea>
                                </div>
                                <button type="submit" class="btn btn-roxo btn-sm">Publicar comentário</button>
                            </form>
                        </div>
                    </div>

                    <form action="${pageContext.request.contextPath}/delete-postagem"
                          method="post" class="d-inline">

                        <input type="hidden" name="id"
                               value="${postagem.idPostagem}">

                        <button type="submit" class="btn btn-danger btn-sm">
                            Excluir
                        </button>

                    </form>
                    </div>

                </article>

            </c:forEach>

            <c:if test="${empty postagens}">
                <p>Nenhuma postagem encontrada.</p>
            </c:if>

        </div>
    </div>

</div>

<script src="${pageContext.request.contextPath}/js/tema.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    var botoes = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    botoes.forEach(function(botao) { new bootstrap.Tooltip(botao); });
</script>
</body>
</html>
