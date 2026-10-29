
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
</head>
<body class="bg-color-claro">

<div class="container mt-4">

    <div class="row mb-4">
        <div class="col">
            <h1>AMIS</h1>
        </div>

        <div class="col-auto">
            <a href="${pageContext.request.contextPath}/find-all-usuarios?pagina=perfil"
               class="btn btn-roxo">Perfil</a>
            <a href="${pageContext.request.contextPath}/admin.jsp"
               class="btn btn-outline-secondary" data-bs-toggle="tooltip"
               title="Botão temporário: área administrativa sem login">Área administrativa</a>

            <button id="botao-tema"
                    class="btn btn-outline-secondary"
                    onclick="mudarTema()">
                Modo escuro
            </button>
        </div>
    </div>

    <div class="row justify-content-center">
        <div class="col-md-8">

            <h2>Feed</h2>
            <div class="alert alert-warning" role="alert">
                Temporário: todos podem alterar e excluir postagens. Depois, cada usuário poderá alterar ou excluir apenas suas próprias postagens.
            </div>

            <a href="${pageContext.request.contextPath}/pages/postagem-form.jsp"
               class="btn btn-roxo mb-3">
                Nova postagem
            </a>

            <c:forEach var="postagem" items="${postagens}">

                <div class="postagem">

                    <h4><c:out value="${postagem.titulo}" /></h4>

                    <p><c:out value="${postagem.texto}" /></p>

                    <p>
                        Categoria:
                        <c:out value="${postagem.categoria}" />
                    </p>

                    <p>
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

                    <a href="${editar}" class="btn btn-primary btn-sm">
                        Editar
                    </a>

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
