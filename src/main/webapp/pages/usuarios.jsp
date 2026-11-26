<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Usuários e páginas - AMIS</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    </head>
    <body class="amis-organizado admin-area">
        <div class="container admin-container admin-interna">
            <h2>Usuários e páginas</h2>
            <p>Gerenciamento dos cadastros da plataforma</p>
            <a href="${pageContext.request.contextPath}/admin.jsp"
       class="btn btn-outline-secondary mb-3">
                Voltar
            </a>
            <form method="get" class="d-flex gap-2 mb-3">
                <input class="form-control" name="pesquisa" placeholder="Nome ou username" value="<c:out value='${param.pesquisa}'/>">
                <button class="btn btn-primary">Pesquisar</button>
                <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/find-all-usuarios">Todos</a>
            </form>
            <div class="admin-panel admin-table-panel">
                <div class="table-responsive">
                    <table class="table table-hover align-middle admin-table">
                        <tr>
                            <th>
                                ID
                            </th>
                            <th>
                                Tipo
                            </th>
                            <th>
                                Username
                            </th>
                            <th>
                                Nome
                            </th>
                            <th>
                                E-mail
                            </th>
                            <th>
                                Status
                            </th>
                            <th>
                                Ação
                            </th>
                        </tr>
                        <c:forEach var="usuario" items="${usuarios}">
                            <tr>
                                <td>
                                    ${usuario.idUsuario}
                                </td>
                                <td>
                                    <c:out value="${usuario.tipo}" />
                                </td>
                                <td>
                                    <c:out value="${usuario.username}" />
                                </td>
                                <td>
                                    <c:out value="${usuario.nome}" />
                                </td>
                                <td>
                                    <c:out value="${usuario.email}" />
                                </td>
                                <td>
                                    <c:out value="${usuario.status}" />
                                </td>
                                <td>
                                    <form action="${pageContext.request.contextPath}/alterar-status" method="post">
                                        <input type="hidden" name="id" value="${usuario.idUsuario}">
                                        <input type="hidden" name="status" value="${usuario.status eq 'ATIVO' ? 'INATIVO' : 'ATIVO'}">
                                        <button class="btn btn-outline-secondary btn-sm">${usuario.status eq 'ATIVO' ? 'Inativar' : 'Reativar'}</button>
                                    </form>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
