
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Editar perfil - AMIS</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/perfil.css">
</head>
<body class="bg-color-claro">

<div class="container mt-5">

    <div class="caixa">

        <h2>Editar perfil</h2>

        <form action="${pageContext.request.contextPath}/create-usuario"
              method="post">

            <input type="hidden" name="id" value="${param.id}">
            <input type="hidden" name="tipo" value="${param.tipo}">
            <input type="hidden" name="status" value="${param.status}">
            <input type="hidden" name="origem" value="perfil">

            <div class="mb-3">
                <label class="form-label">ID do usuário</label>
                <input type="text" class="form-control"
                       value="${param.id}" disabled>
            </div>

            <div class="mb-3">
                <label class="form-label">Nome</label>
                <input type="text" name="nome" class="form-control"
                       value="${param.nome}">
            </div>

            <div class="mb-3">
                <label class="form-label">Username</label>
                <input type="text" name="username" class="form-control"
                       value="${param.username}">
            </div>

            <div class="mb-3">
                <label class="form-label">E-mail</label>
                <input type="email" name="email" class="form-control"
                       value="${param.email}">
            </div>

            <div class="mb-3">
                <label class="form-label">Foto (URL)</label>
                <input type="text" name="foto" class="form-control"
                       value="${param.foto}">
            </div>

            <div class="mb-3">
                <label class="form-label">Bio</label>
                <textarea name="bio"
                          class="form-control">${param.bio}</textarea>
            </div>

            <button type="submit" class="btn btn-roxo">
                Salvar alterações
            </button>

            <a href="${pageContext.request.contextPath}/find-all-usuarios?pagina=perfil&id=${param.id}"
               class="btn btn-secondary">
                Voltar
            </a>

        </form>

    </div>

</div>

</body>
</html>
