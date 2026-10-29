
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

    <div class="alert alert-warning">
        TEMPORÁRIO: FUTURAMENTE O ADM SÓ PODERÁ ALTERAR
        DE ATIVO PARA INATIVO.
    </div>

    <a href="${pageContext.request.contextPath}/admin.jsp"
       class="btn btn-outline-secondary mb-3">
        Voltar
    </a>

    <div class="admin-panel admin-table-panel"><div class="table-responsive"><table class="table table-hover align-middle admin-table">

        <tr>
            <th>ID</th>
            <th>Tipo</th>
            <th>Username</th>
            <th>Nome</th>
            <th>E-mail</th>
            <th>Status</th>
            <th>Ação</th>
        </tr>

        <c:forEach var="usuario" items="${usuarios}">

            <tr>
                <td>${usuario.idUsuario}</td>
                <td><c:out value="${usuario.tipo}" /></td>
                <td><c:out value="${usuario.username}" /></td>
                <td><c:out value="${usuario.nome}" /></td>
                <td><c:out value="${usuario.email}" /></td>
                <td><c:out value="${usuario.status}" /></td>

                <td>
                    <c:url var="linkEditar" value="/pages/usuario-form.jsp">
                        <c:param name="id" value="${usuario.idUsuario}" />
                        <c:param name="tipo" value="${usuario.tipo}" />
                        <c:param name="foto" value="${usuario.foto}" />
                        <c:param name="username" value="${usuario.username}" />
                        <c:param name="nome" value="${usuario.nome}" />
                        <c:param name="email" value="${usuario.email}" />
                        <c:param name="bio" value="${usuario.bio}" />
                        <c:param name="status" value="${usuario.status}" />
                    </c:url>

                    <a href="${linkEditar}"
                       class="btn btn-primary btn-sm">
                        Editar
                    </a>
                </td>
            </tr>

        </c:forEach>

    </table></div></div>

</div>

</body>
</html>
