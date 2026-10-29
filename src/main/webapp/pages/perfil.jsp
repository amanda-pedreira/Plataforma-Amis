
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
</head>
<body class="bg-color-claro">

<div class="container mt-4">

    <div class="row mb-4">
        <div class="col">
            <h1>AMIS</h1>
            <a href="${pageContext.request.contextPath}/find-all-postagens" class="btn btn-outline-secondary btn-sm">Voltar ao feed</a>
        </div>
        <div class="col-auto">
            <button id="botao-tema"
                    class="btn btn-outline-secondary"
                    onclick="mudarTema()">
                Modo escuro
            </button>
        </div>
    </div>

    <div class="caixa">
        <h2>Meu perfil</h2>
        <div class="alert alert-info">Temporário: informe o ID do usuário ou da página. Depois do login verdadeiro, o perfil será identificado automaticamente e cada pessoa poderá alterar apenas a própria conta.</div>

        <form action="${pageContext.request.contextPath}/find-all-usuarios"
              method="get">

            <input type="hidden" name="pagina" value="perfil">

            <div class="mb-3">
                <label class="form-label">ID do usuário</label>
                <input type="number" name="id"
                       class="form-control"
                       value="${param.id}" required>
            </div>

            <button type="submit" class="btn btn-roxo">
                Buscar
            </button>
        </form>
    </div>

    <c:forEach var="usuario" items="${usuarios}">

        <c:if test="${usuario.idUsuario eq param.id}">

            <div class="caixa">

                <h2><c:out value="${usuario.nome}" /></h2>

                <p>
                    @<c:out value="${usuario.username}" />
                </p>

                <p>
                    ID: ${usuario.idUsuario}
                </p>

                <p>
                    Tipo: <c:out value="${usuario.tipo}" />
                </p>

                <p>
                    E-mail: <c:out value="${usuario.email}" />
                </p>

                <p>
                    Bio: <c:out value="${usuario.bio}" />
                </p>

                <p>
                    Data de criação:
                    <c:out value="${usuario.dataCriacao}" />
                </p>

                <div class="alert alert-warning">Temporário: as opções de editar e excluir ainda não verificam quem está logado.</div>
                <div class="row mt-4">
                    <div class="col-6 col-md-3">
                        <strong>0</strong>
                        <p>Postagens</p>
                    </div>
                    <div class="col-6 col-md-3">
                        <strong>0</strong>
                        <p>Registros no diário</p>
                    </div>
                    <div class="col-6 col-md-3">
                        <strong>0</strong>
                        <p>Páginas seguidas</p>
                    </div>
                    <div class="col-6 col-md-3">
                        <strong>0</strong>
                        <p>Itens salvos</p>
                    </div>
                </div>

                <c:url var="linkEditar" value="/pages/perfil-form.jsp">
                    <c:param name="id" value="${usuario.idUsuario}" />
                    <c:param name="tipo" value="${usuario.tipo}" />
                    <c:param name="foto" value="${usuario.foto}" />
                    <c:param name="username" value="${usuario.username}" />
                    <c:param name="nome" value="${usuario.nome}" />
                    <c:param name="email" value="${usuario.email}" />
                    <c:param name="bio" value="${usuario.bio}" />
                    <c:param name="status" value="${usuario.status}" />
                </c:url>

                <a href="${linkEditar}" class="btn btn-roxo">
                    Editar conta
                </a>

                <form action="${pageContext.request.contextPath}/delete-usuario"
                      method="post" class="d-inline">

                    <input type="hidden" name="id"
                           value="${usuario.idUsuario}">

                    <button type="submit" class="btn btn-outline-danger">
                        Excluir conta
                    </button>
                </form>

            </div>

            <div class="mb-3">
                <button class="btn btn-roxo">Minhas postagens</button>
                <button class="btn btn-outline-secondary">Salvos</button>
                <button class="btn btn-outline-secondary">Páginas seguidas</button>
            </div>

            <div class="caixa">
                <p>As postagens e os itens salvos serão conectados depois.</p>
            </div>

        </c:if>

    </c:forEach>

</div>

<script src="${pageContext.request.contextPath}/js/tema.js"></script>

</body>
</html>
