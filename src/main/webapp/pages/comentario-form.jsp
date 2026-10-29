<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html><html lang="pt-br"><head><meta charset="UTF-8"><title>Comentar postagem - AMIS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
</head>
<body class="bg-color-claro amis-organizado"><div class="container mt-4"><h2>Comentar postagem</h2>
<p>Postagem nº <strong>${param.idPostagem}</strong></p>
<form action="${pageContext.request.contextPath}/create-comentario" method="post">
<div class="mb-3"><label class="form-label">ID da postagem</label><input type="number" min="1" name="idPostagem" value="${param.idPostagem}" class="form-control" required></div>
<div class="mb-3"><label class="form-label">ID do usuário</label><input type="number" min="1" name="idUsuario" class="form-control" required></div>
<div class="mb-3"><label class="form-label">Comentário</label><textarea name="texto" rows="4" class="form-control" required></textarea></div>
<button type="submit" class="btn btn-roxo">Salvar</button>
<a href="${pageContext.request.contextPath}/find-all-comentarios" class="btn btn-secondary">Voltar</a>
</form></div></body></html>
