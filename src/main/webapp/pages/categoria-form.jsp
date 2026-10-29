<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Categoria - AMIS</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
</head>
<body class="amis-organizado admin-area">

<div class="container admin-container admin-interna">

    <h2>Cadastrar / Editar Categoria</h2>

    <div class="admin-panel admin-form-panel"><form action="${pageContext.request.contextPath}/create-categoria"
          method="post">

        <div class="mb-3">

            <label class="form-label">Nome da categoria</label>

            <input type="text"
                   name="categoria-nome"
                   class="form-control"
                   value="${param.nome}"
                   maxlength="100"
                   required>

            <input type="hidden"
                   name="id"
                   value="${param.id}">

        </div>

        <button type="submit" class="btn btn-primary">
            Salvar
        </button>

        <a href="${pageContext.request.contextPath}/find-all-categorias"
           class="btn btn-outline-secondary">
            Cancelar
        </a>

    </form></div>

</div>

</body>
</html>