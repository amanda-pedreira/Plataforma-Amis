
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Postagem - AMIS</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/style.css">
</head>
<body class="bg-color-claro">

<div class="container mt-4">

    <h2>Postagem</h2>

    <form action="${pageContext.request.contextPath}/create-postagem"
          method="post">

        <input type="hidden" name="id" value="${param.id}">

        <div class="mb-3">
            <label class="form-label">ID do usuário</label>
            <input type="number" name="idUsuario"
                   class="form-control"
                   value="${param.idUsuario}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">ID da categoria</label>
            <input type="number" name="idCategoria"
                   class="form-control"
                   value="${param.idCategoria}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">ID da flag</label>
            <input type="number" name="idFlag"
                   class="form-control"
                   value="${param.idFlag}" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Título</label>
            <input type="text" name="titulo"
                   class="form-control"
                   value="${param.titulo}">
        </div>

        <div class="mb-3">
            <label class="form-label">Texto</label>
            <textarea name="texto" class="form-control"
                      rows="5" required>${param.texto}</textarea>
        </div>

        <button type="submit" class="btn btn-roxo">
            Salvar
        </button>

        <a href="${pageContext.request.contextPath}/find-all-postagens"
           class="btn btn-secondary">
            Voltar
        </a>

    </form>

</div>

</body>
</html>
