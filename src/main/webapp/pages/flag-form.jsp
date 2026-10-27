<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Flag - AMIS</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>
<body>

<div class="container mt-5">

    <h2>Cadastrar / Editar Flag</h2>

    <form action="${pageContext.request.contextPath}/create-flag"
          method="post">

        <div class="mb-3">

            <label class="form-label">Nome da flag</label>

            <input type="text"
                   name="flag-nome"
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

        <a href="${pageContext.request.contextPath}/find-all-flags"
           class="btn btn-secondary">
            Cancelar
        </a>

    </form>

</div>

</body>
</html>