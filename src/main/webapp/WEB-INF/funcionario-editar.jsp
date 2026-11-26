<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Funcionários - AMIS</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    </head>
    <body class="amis-organizado admin-area">
        <div class="container admin-container admin-interna">
            <h2>Alterar funcionário</h2>
            <a href="${pageContext.request.contextPath}/funcionarios" class="btn btn-outline-secondary mb-3">Voltar</a>
            <section class="admin-bloco">
                <form action="${pageContext.request.contextPath}/funcionarios" method="post" class="row g-3">
                    <input type="hidden" name="id" value="${f.idFuncionario}">
                    <div class="col-md-3">
                        <label>ID ${f.idFuncionario} - Nome</label>
                        <input name="nome" value="<c:out value='${f.nome}'/>" class="form-control" required>
                    </div>
                    <div class="col-md-3">
                        <label>E-mail</label>
                        <input type="email" name="email" value="<c:out value='${f.email}'/>" class="form-control" required>
                    </div>
                    <div class="col-md-3">
                        <label>Username</label>
                        <input name="username" value="<c:out value='${f.username}'/>" class="form-control" required>
                    </div>
                    <div class="col-md-3">
                        <label>Cargo</label>
                        <input name="cargo" value="<c:out value='${f.cargo}'/>" class="form-control" required>
                    </div>
                    <div class="col-md-2">
                        <label>Status</label>
                        <select name="status" class="form-select">
                            <option value="ATIVO" ${f.status eq 'ATIVO' ? 'selected' : ''}>
                                ATIVO
                            </option>
                            <option value="INATIVO" ${f.status eq 'INATIVO' ? 'selected' : ''}>
                                INATIVO
                            </option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <label>Permissão</label>
                        <select name="permissao" class="form-select">
                            <option value="1" ${f.permissao eq '1' ? 'selected' : ''}>
                                Gestor de Conteúdo
                            </option>
                            <option value="2" ${f.permissao eq '2' ? 'selected' : ''}>
                                Moderador de Comunidade
                            </option>
                            <option value="3" ${f.permissao eq '3' ? 'selected' : ''}>
                                Administrador Geral
                            </option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <label>&nbsp;</label>
                        <button class="btn btn-primary btn-sm d-block">Salvar</button>
                    </div>
                </form>
            </section>
        </div>
    </body>
</html>
