<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Postagem - AMIS</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/prototipo-v4.css">
</head>
    <body class="bg-color-claro">
        <header><nav><a class="logo" href="${pageContext.request.contextPath}/find-all-postagens"><img src="${pageContext.request.contextPath}/img/visual/logo.png" alt="amis." style="width:110px;height:auto;display:block;"></a><div class="menu"><a class="active" href="${pageContext.request.contextPath}/find-all-postagens">▦ &nbsp; Feed</a><a  href="${pageContext.request.contextPath}/journal">▤ &nbsp; Diário</a></div><div class="profile"><button id="botao-tema" onclick="mudarTema()" aria-label="Mudar tema">☾</button><details><summary><img class="avatar" src="${pageContext.request.contextPath}/img/visual/pessoa.png" alt=""><strong><c:out value="${sessionScope.loggedUser}"/></strong></summary><div class="dropdown"><a href="${pageContext.request.contextPath}/find-all-usuarios?pagina=perfil">Perfil</a><c:if test="${sessionScope.admin eq 1}"><a href="${pageContext.request.contextPath}/admin.jsp">Admin</a></c:if><a href="${pageContext.request.contextPath}/logout">Sair</a></div></details></div></nav></header>
        <main><section id="form" class="page"><p><a href="${pageContext.request.contextPath}/find-all-postagens">← Voltar para o Feed</a></p>
            <div class="card">
                <div class="formhead"><h1>Nova postagem</h1><p class="muted">Compartilhe suas ideias, percepções, desabafos ou algo que esteja vivendo.</p></div>
                <form action="${pageContext.request.contextPath}/create-postagem"
          method="post">
                    <div class="mb-4"><label class="form-label">Título da postagem</label><input type="text" name="titulo" class="form-control" placeholder="Dê um título para sua publicação"></div>
                    <div class="mb-4"><label class="form-label">Conteúdo</label><textarea name="texto" class="form-control" rows="6" required placeholder="O que você gostaria de compartilhar?"></textarea></div>
                    <div class="formrow">
                        <div ><label class="form-label">Categoria</label><select name="idCategoria" class="form-select" required><option value="">Selecione uma categoria</option><c:forEach var="categoria" items="${categorias}"><option value="${categoria.id}"><c:out value="${categoria.nome}"/></option></c:forEach></select></div>
                        <div ><label class="form-label">Flag</label><select name="idFlag" class="form-select" required><option value="">Selecione uma flag</option><c:forEach var="flag" items="${flags}"><option value="${flag.id}"><c:out value="${flag.nome}"/></option></c:forEach></select></div>
                    </div><div class="formactions"><a class="outline" style="margin:0" href="${pageContext.request.contextPath}/find-all-postagens">Cancelar</a><button type="submit" class="primary">Publicar</button>
                </div></form>
            </div>
        </section></main>
        <script src="${pageContext.request.contextPath}/js/tema.js"></script>
    </body>
</html>
