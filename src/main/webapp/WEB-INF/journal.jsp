<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Journal - AMIS</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/journal.css">
</head>
<body>
<main>
<header><a class="logo" href="${pageContext.request.contextPath}/find-all-postagens">amis.</a><nav><a href="${pageContext.request.contextPath}/find-all-postagens">Feed</a><a href="${pageContext.request.contextPath}/journal" class="ativo">Journal</a><a href="${pageContext.request.contextPath}/find-all-usuarios">Perfil</a></nav></header>
<section class="intro"><small>UM ESPAÇO SÓ SEU</small><h1>A vida que acontece em mim.</h1><p>Nem todos os dias precisam ser extraordinários para merecerem ser lembrados.</p></section>
<c:if test="${param.resultado eq 'erro'}"><p role="alert">Não foi possível guardar o registro. Confira os campos.</p></c:if>
<section class="papel">
<small>MEU JOURNAL</small>
<h2><c:choose><c:when test="${not empty registroEditar}">Revisitando uma memória</c:when><c:otherwise>Como foi o seu dia?</c:otherwise></c:choose></h2>
<form action="${pageContext.request.contextPath}/journal" method="post">
<c:if test="${not empty registroEditar}"><input type="hidden" name="acao" value="editar"><input type="hidden" name="idRegistro" value="${registroEditar.idRegistro}"></c:if>
<label for="data">Data</label>
<input id="data" type="date" name="data" value="<c:out value='${registroEditar.data}'/>" required>
<p class="rotulo">Nesse dia, eu me senti...</p>
<div class="humores">
<label><input type="radio" name="humor" value="Feliz" ${registroEditar.humor eq 'Feliz' ? 'checked' : ''} required><span><b>😊</b>Feliz</span></label>
<label><input type="radio" name="humor" value="Tranquila" ${registroEditar.humor eq 'Tranquila' ? 'checked' : ''} required><span><b>😌</b>Tranquila</span></label>
<label><input type="radio" name="humor" value="Normal" ${registroEditar.humor eq 'Normal' ? 'checked' : ''} required><span><b>😐</b>Normal</span></label>
<label><input type="radio" name="humor" value="Triste" ${registroEditar.humor eq 'Triste' ? 'checked' : ''} required><span><b>😔</b>Triste</span></label>
<label><input type="radio" name="humor" value="Difícil" ${registroEditar.humor eq 'Difícil' ? 'checked' : ''} required><span><b>😣</b>Difícil</span></label>
<c:if test="${not empty registroEditar and registroEditar.humor ne 'Feliz' and registroEditar.humor ne 'Tranquila' and registroEditar.humor ne 'Normal' and registroEditar.humor ne 'Triste' and registroEditar.humor ne 'Difícil'}"><label><input type="radio" name="humor" value="<c:out value='${registroEditar.humor}'/>" checked><span><c:out value="${registroEditar.humor}"/></span></label></c:if>
</div>
<input class="titulo" name="titulo" aria-label="Título" placeholder="Um título para esse momento..." maxlength="150" value="<c:out value='${registroEditar.titulo}'/>" required>
<textarea name="descricao" aria-label="Seu registro" rows="6" maxlength="4000" placeholder="Querido diário, hoje..." required><c:out value="${registroEditar.descricao}"/></textarea>
<button class="guardar" type="submit"><c:choose><c:when test="${not empty registroEditar}">Salvar alterações</c:when><c:otherwise>Guardar este momento</c:otherwise></c:choose></button>
<c:if test="${not empty registroEditar}"><a href="${pageContext.request.contextPath}/journal">Cancelar edição</a></c:if>
<p class="privado">♡ Entre você e suas memórias.</p>
</form></section>
<section class="historia"><h2>Páginas da minha história</h2><p>Pequenos momentos que fazem parte de quem eu sou.</p>
<c:if test="${empty registros}"><p class="papel">Sua história começa com uma página em branco.</p></c:if>
<c:forEach var="registro" items="${registros}">
<div class="linha"><div class="dia"><strong>${registro.dia}</strong><small>${fn:substring(registro.data, 5, 7)}/${fn:substring(registro.data, 0, 4)}</small></div>
<article class="memoria"><div class="topo"><small><c:choose><c:when test="${registro.humor eq 'Feliz'}">😊</c:when><c:when test="${registro.humor eq 'Tranquila'}">😌</c:when><c:when test="${registro.humor eq 'Normal'}">😐</c:when><c:when test="${registro.humor eq 'Triste'}">😔</c:when><c:when test="${registro.humor eq 'Difícil'}">😣</c:when></c:choose> <c:out value="${registro.humor}"/></small>
<details><summary aria-label="Opções">•••</summary><a href="${pageContext.request.contextPath}/journal?editar=${registro.idRegistro}">Editar</a><form action="${pageContext.request.contextPath}/journal" method="post" onsubmit="return confirm('Deseja excluir esta lembrança?')"><input type="hidden" name="acao" value="excluir"><input type="hidden" name="idRegistro" value="${registro.idRegistro}"><button type="submit" class="excluir">Excluir</button></form></details></div>
<h3><c:out value="${registro.titulo}"/></h3><p class="descricao"><c:out value="${registro.descricao}"/></p></article></div>
</c:forEach></section></main></body></html>
