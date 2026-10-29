<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br"><head><meta charset="UTF-8"><title>Comentários - AMIS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
</head>
<body class="bg-color-claro amis-organizado"><div class="container mt-4">
<h2>Comentários</h2>
<c:if test="${not empty param.idPostagem}"><p>Comentários da postagem nº <c:out value="${param.idPostagem}" /></p></c:if>
<div class="alert alert-warning">Temporário: qualquer pessoa pode excluir comentários. Depois, isso dependerá do usuário logado.</div>
<a class="btn btn-secondary mb-3" href="${pageContext.request.contextPath}/find-all-postagens">Voltar ao feed</a>
<c:forEach var="comentario" items="${comentarios}">
<c:if test="${empty param.idPostagem or comentario.idPostagem == param.idPostagem}">
<div class="card mb-3"><div class="card-body">
<p class="mb-1"><strong>Postagem:</strong> <c:out value="${comentario.idPostagem}" /> | <strong>Usuário:</strong> <c:out value="${comentario.idUsuario}" /></p>
<p><c:out value="${comentario.texto}" /></p>
<form action="${pageContext.request.contextPath}/delete-comentario" method="post">
<input type="hidden" name="id" value="${comentario.idComentario}">
<button type="submit" class="btn btn-danger btn-sm">Excluir</button></form></div></div></c:if></c:forEach>
<c:if test="${empty comentarios}"><p>Nenhum comentário encontrado.</p></c:if>
</div></body></html>
