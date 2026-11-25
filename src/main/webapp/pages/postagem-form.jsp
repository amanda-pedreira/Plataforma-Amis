
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Postagem - AMIS</title>

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
<div class="container mt-4 amis-form-post">
<div class="amis-painel">

    <h2>Nova postagem</h2>

    <form action="${pageContext.request.contextPath}/create-postagem"
          method="post">



        

        <div class="mb-3">
            <label class="form-label">Categoria</label>
            <div class="amis-opcoes">
                <c:forEach var="categoria" items="${categorias}">
                    <label class="amis-opcao">
                        <input type="radio" name="idCategoria" value="${categoria.id}" required>
                        <span><c:out value="${categoria.nome}"/></span>
                    </label>
                </c:forEach>
            </div>
        </div>

        <div class="mb-3">
            <label class="form-label">Flag</label>
            <div class="amis-opcoes">
                <c:forEach var="flag" items="${flags}">
                    <label class="amis-opcao">
                        <input type="radio" name="idFlag" value="${flag.id}" required>
                        <span><c:out value="${flag.nome}"/></span>
                    </label>
                </c:forEach>
            </div>
        </div>

        <div class="mb-3">
            <label class="form-label">Título</label>
            <input type="text" name="titulo"
                   class="form-control"
                   >
        </div>

        <div class="mb-3">
            <label class="form-label">Texto</label>
            <textarea name="texto" class="form-control"
                      rows="5" required></textarea>
        </div>

        <button type="submit" class="btn btn-roxo">
            Publicar
        </button>

        <a href="${pageContext.request.contextPath}/find-all-postagens"
           class="btn btn-secondary">
            Voltar
        </a>

    </form>

</div>
</div>

<script src="${pageContext.request.contextPath}/js/tema.js"></script>
</body>
</html>
