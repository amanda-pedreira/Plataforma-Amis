<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Flags - AMIS</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
</head>
<body class="amis-organizado admin-area">

<div class="container admin-container admin-interna">

    <h2>Flags</h2>
    <p>Gerenciamento das flags das postagens</p>

    <a href="${pageContext.request.contextPath}/admin.jsp"
       class="btn btn-outline-secondary mb-3">
        Voltar
    </a>

    <a href="${pageContext.request.contextPath}/pages/flag-form.jsp"
       class="btn btn-primary mb-3">
        Nova flag
    </a>

    <div class="admin-panel admin-table-panel"><div class="table-responsive"><table class="table table-hover align-middle admin-table">

        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Ações</th>
        </tr>

        <c:forEach var="flag" items="${flags}">

            <tr>
                <td>${flag.id}</td>
                <td>${flag.nome}</td>

                <td>
                    <a href="${pageContext.request.contextPath}/pages/flag-form.jsp?id=${flag.id}&nome=${flag.nome}"
                       class="btn btn-outline-primary btn-sm">
                        Editar
                    </a>

                    <form action="${pageContext.request.contextPath}/delete-flag"
                          method="post"
                          style="display:inline;">

                        <input type="hidden"
                               name="id"
                               value="${flag.id}">

                        <button type="submit" class="btn btn-outline-danger btn-sm">
                            Excluir
                        </button>

                    </form>
                </td>
            </tr>

        </c:forEach>

    </table></div></div>

</div>

</body>
</html>