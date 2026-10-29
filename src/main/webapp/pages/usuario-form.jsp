
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Editar usuário - AMIS</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
</head>
<body>

<div class="container mt-5">

    <h2>Editar usuário ou página</h2>

    <div class="alert alert-warning mt-3">
        TEMPORÁRIO: FUTURAMENTE O ADM SÓ PODERÁ ALTERAR
        DE ATIVO PARA INATIVO.
    </div>

    <form action="${pageContext.request.contextPath}/create-usuario"
          method="post">

        <input type="hidden" name="id" value="${param.id}">

        <div class="mb-3">
            <label class="form-label">Tipo</label>
            <select name="tipo" class="form-select">
                <option value="PESSOAL"
                    ${param.tipo == 'PESSOAL' ? 'selected' : ''}>
                    PESSOAL
                </option>
                <option value="PAGINA"
                    ${param.tipo == 'PAGINA' ? 'selected' : ''}>
                    PAGINA
                </option>
            </select>
        </div>

        <div class="mb-3">
            <label class="form-label">Foto (URL)</label>
            <input type="text" name="foto" class="form-control"
                   value="${param.foto}">
        </div>

        <div class="mb-3">
            <label class="form-label">Username</label>
            <input type="text" name="username" class="form-control"
                   value="${param.username}">
        </div>

        <div class="mb-3">
            <label class="form-label">Nome</label>
            <input type="text" name="nome" class="form-control"
                   value="${param.nome}">
        </div>

        <div class="mb-3">
            <label class="form-label">E-mail</label>
            <input type="email" name="email" class="form-control"
                   value="${param.email}">
        </div>

        <div class="mb-3">
            <label class="form-label">Bio</label>
            <textarea name="bio" class="form-control">${param.bio}</textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Status</label>
            <select name="status" class="form-select">
                <option value="ATIVO"
                    ${param.status == 'ATIVO' ? 'selected' : ''}>
                    ATIVO
                </option>
                <option value="INATIVO"
                    ${param.status == 'INATIVO' ? 'selected' : ''}>
                    INATIVO
                </option>
            </select>
        </div>

        <button type="submit" class="btn btn-primary">
            Salvar alterações
        </button>

        <a href="${pageContext.request.contextPath}/find-all-usuarios"
           class="btn btn-secondary">
            Voltar
        </a>

    </form>

</div>

</body>
</html>
