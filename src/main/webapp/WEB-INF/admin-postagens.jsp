<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Postagens - AMIS</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
    </head>
    <body class="amis-organizado admin-area">
        <div class="container admin-container admin-interna">
            <h2>Gerenciar postagens</h2>
            <a class="btn btn-outline-secondary mb-3" href="${pageContext.request.contextPath}/admin.jsp">Voltar</a>
            <form method="get" class="d-flex gap-2 mb-3">
                <input class="form-control" name="pesquisa" placeholder="Título ou texto" value="<c:out value='${param.pesquisa}'/>">
                <button class="btn btn-primary">Pesquisar</button>
                <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/admin/postagens">Todos</a>
            </form>
            <c:forEach var="p" items="${postagens}">
                <section class="admin-bloco">
                    <c:forEach var="u" items="${usuarios}">
                        <c:if test="${u.idUsuario eq p.idUsuario}">
                            <strong>
                                <c:out value="${u.nome}"/>
                            </strong>
                            · @
                            <c:out value="${u.username}"/>
                        </c:if>
                    </c:forEach>
                    <p>
                        <c:out value="${p.dataPostagem}"/>
                        ·
                        <c:out value="${p.categoria}"/>
                        ·
                        <c:out value="${p.flag}"/>
                    </p>
                    <h4>
                        <c:out value="${p.titulo}"/>
                    </h4>
                    <p style="white-space:pre-wrap;overflow-wrap:anywhere">
                        <c:out value="${p.texto}"/>
                    </p>
                    <form method="post" action="${pageContext.request.contextPath}/admin/postagens" onsubmit="return confirm('Excluir postagem?')">
                        <input type="hidden" name="id" value="${p.idPostagem}">
                        <button class="btn btn-outline-danger">Excluir publicação</button>
                    </form>
                </section>
            </c:forEach>
            <c:if test="${empty postagens}">
                <p>Nenhuma postagem encontrada.</p>
            </c:if>
        </div>
    </body>
</html>
