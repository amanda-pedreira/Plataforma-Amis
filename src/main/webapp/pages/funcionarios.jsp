<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br"><head><meta charset="UTF-8"><title>Funcionários - AMIS</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
</head>
<body class="amis-organizado admin-area"><div class="container admin-container admin-interna">
<h2>Funcionários</h2>
<p class="alert alert-warning">Sem login temporariamente. Cargo, status e permissão são apenas informações cadastradas. Ainda não controlam o acesso ao site.</p>
<a href="${pageContext.request.contextPath}/admin.jsp" class="btn btn-outline-secondary mb-3">Voltar ao ADM</a>
<section class="admin-bloco"><h4>Cadastrar funcionário</h4>
<form action="${pageContext.request.contextPath}/funcionarios" method="post" class="row g-3">
<div class="col-md-6"><label>Nome</label><input name="nome" class="form-control" required></div>
<div class="col-md-6"><label>E-mail</label><input name="email" type="email" class="form-control" required></div>
<div class="col-md-4"><label>Cargo</label><select name="cargo" class="form-select"><option>Administrador</option><option>Suporte</option><option>Moderador</option></select></div>
<div class="col-md-4"><label>Status</label><select name="status" class="form-select"><option>ATIVO</option><option>INATIVO</option></select></div>
<div class="col-md-4"><label>Permissão (futura)</label><select name="permissao" class="form-select"><option>TOTAL</option><option>SUPORTE</option><option>CONSULTA</option></select></div>
<div class="col-12"><button class="btn btn-primary">Cadastrar</button></div></form></section>
<section class="admin-bloco"><h4>Funcionários cadastrados</h4>
<c:forEach var="f" items="${funcionarios}">
<div class="card admin-funcionario-card mb-3"><div class="card-body">
<form action="${pageContext.request.contextPath}/funcionarios" method="post" class="row g-3">
<input type="hidden" name="id" value="${f.idFuncionario}">
<div class="col-md-3"><label>ID ${f.idFuncionario} - Nome</label><input name="nome" value="<c:out value='${f.nome}'/>" class="form-control" required></div>
<div class="col-md-3"><label>E-mail</label><input type="email" name="email" value="<c:out value='${f.email}'/>" class="form-control" required></div>
<div class="col-md-2"><label>Cargo</label><select name="cargo" class="form-select"><option value="Administrador" ${f.cargo eq 'Administrador' ? 'selected' : ''}>Administrador</option><option value="Suporte" ${f.cargo eq 'Suporte' ? 'selected' : ''}>Suporte</option><option value="Moderador" ${f.cargo eq 'Moderador' ? 'selected' : ''}>Moderador</option></select></div>
<div class="col-md-2"><label>Status</label><select name="status" class="form-select"><option value="ATIVO" ${f.status eq 'ATIVO' ? 'selected' : ''}>ATIVO</option><option value="INATIVO" ${f.status eq 'INATIVO' ? 'selected' : ''}>INATIVO</option></select></div>
<div class="col-md-2"><label>Permissão</label><select name="permissao" class="form-select"><option value="TOTAL" ${f.permissao eq 'TOTAL' ? 'selected' : ''}>TOTAL</option><option value="SUPORTE" ${f.permissao eq 'SUPORTE' ? 'selected' : ''}>SUPORTE</option><option value="CONSULTA" ${f.permissao eq 'CONSULTA' ? 'selected' : ''}>CONSULTA</option></select></div>
<div class="col-md-2"><label>&nbsp;</label><button class="btn btn-primary btn-sm d-block">Salvar</button></div>
</form>
<form action="${pageContext.request.contextPath}/funcionarios" method="post" class="mt-2"><input type="hidden" name="acao" value="excluir"><input type="hidden" name="id" value="${f.idFuncionario}"><button class="btn btn-outline-danger btn-sm">Excluir</button></form>
</div></div></c:forEach>
<c:if test="${empty funcionarios}"><p>Nenhum funcionário cadastrado.</p></c:if>
</section></div></body></html>
