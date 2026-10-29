<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Categorias - AMIS</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
</head>
<body class="amis-organizado admin-area">

<div class="container admin-container admin-interna">

    <h2>Categorias</h2>
    <p>Gerenciamento das categorias das postagens</p>

    <a href="${pageContext.request.contextPath}/admin.jsp"
       class="btn btn-outline-secondary mb-3">
        Voltar
    </a>

    <a href="${pageContext.request.contextPath}/pages/categoria-form.jsp"
       class="btn btn-primary mb-3">
        Nova categoria
    </a>

    <div class="admin-panel admin-table-panel"><div class="table-responsive"><table class="table table-hover align-middle admin-table">

        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Ações</th>
        </tr>

        <c:forEach var="categoria" items="${categorias}">

            <tr>
                <td>${categoria.id}</td>
                <td>${categoria.nome}</td>

                <td>
                    <a href="${pageContext.request.contextPath}/pages/categoria-form.jsp?id=${categoria.id}&nome=${categoria.nome}"
                       class="btn btn-outline-primary btn-sm">
                        Editar
                    </a>

                    <form action="${pageContext.request.contextPath}/delete-categoria"
                          method="post"
                          style="display:inline;">

                        <input type="hidden"
                               name="id"
                               value="${categoria.id}">

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