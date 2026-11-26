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
            <h2>Funcionários</h2>
            <p>Gerencie as contas de acesso da equipe.</p>
            <a href="${pageContext.request.contextPath}/admin.jsp" class="btn btn-outline-secondary mb-3">Voltar ao ADM</a>
            <c:if test="${param.erro eq '1'}">
                <div class="alert alert-danger">
                    Não foi possível salvar ou excluir. Confira os dados e as senhas.
                </div>
            </c:if>
            <c:if test="${param.sucesso eq '1'}">
                <div class="alert alert-success">
                    Alteração realizada.
                </div>
            </c:if>
            <section class="admin-bloco">
                <h4>Cadastrar funcionário</h4>
                <form action="${pageContext.request.contextPath}/funcionarios" method="post" class="row g-3">
                    <div class="col-md-6">
                        <label>Nome</label>
                        <input name="nome" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label>E-mail</label>
                        <input name="email" type="email" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label>Username</label>
                        <input name="username" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label>Senha</label>
                        <input type="password" name="senha" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label>Confirmar senha</label>
                        <input type="password" name="confirmarSenha" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <label>Cargo</label>
                        <input name="cargo" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <label>Status</label>
                        <select name="status" class="form-select">
                            <option>
                                ATIVO
                            </option>
                            <option>
                                INATIVO
                            </option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label>Permissão</label>
                        <select name="permissao" class="form-select">
                            <option value="1">
                                Gestor de Conteúdo
                            </option>
                            <option value="2">
                                Moderador de Comunidade
                            </option>
                            <option value="3">
                                Administrador Geral
                            </option>
                        </select>
                    </div>
                    <div class="col-12">
                        <button class="btn btn-primary">Cadastrar</button>
                    </div>
                </form>
            </section>
            <section class="admin-bloco">
                <h4>Funcionários cadastrados</h4>
                <c:forEach var="f" items="${funcionarios}">
                    <div class="card admin-funcionario-card mb-3">
                        <div class="card-body">
                            <h5>
                                <c:out value="${f.nome}"/>
                            </h5>
                            <p>
                                @
                                <c:out value="${f.username}"/>
                                ·
                                <c:out value="${f.email}"/>
                            </p>
                            <p>
                                Cargo:
                                <c:out value="${f.cargo}"/>
                                · Status:
                                <c:out value="${f.status}"/>
                            </p>
                            <p>
                                Permissão:
                                <c:if test="${f.permissao eq '1'}">
                                    Gestor de Conteúdo
                                </c:if>
                                <c:if test="${f.permissao eq '2'}">
                                    Moderador de Comunidade
                                </c:if>
                                <c:if test="${f.permissao eq '3'}">
                                    Administrador Geral
                                </c:if>
                            </p>
                            <a class="btn btn-outline-secondary btn-sm" href="${pageContext.request.contextPath}/funcionarios?id=${f.idFuncionario}">Alterar</a>
                            <form action="${pageContext.request.contextPath}/funcionarios" method="post" class="mt-2">
                                <input type="hidden" name="acao" value="excluir">
                                <input type="hidden" name="id" value="${f.idFuncionario}">
                                <button class="btn btn-outline-danger btn-sm">Excluir</button>
                            </form>
                        </div>
                    </div>
                </c:forEach>
                <c:if test="${empty funcionarios}">
                    <p>Nenhum funcionário cadastrado.</p>
                </c:if>
            </section>
        </div>
    </body>
</html>
