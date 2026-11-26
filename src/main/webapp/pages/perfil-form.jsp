<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Editar perfil - AMIS</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet">
        <link rel="stylesheet"
          href="${pageContext.request.contextPath}/css/perfil.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/amis-visual.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/visual-v4.css"><link rel="stylesheet" href="${pageContext.request.contextPath}/css/perfis-v4.css"></head>
    <body class="bg-color-claro amis-organizado amis-tela visual-v4 perfil-v4"><header class="amis-topo">
    <div class="amis-menu container">
        <a href="${pageContext.request.contextPath}/find-all-postagens"><img class="logo-nova" src="${pageContext.request.contextPath}/img/visual/logo.png" alt="amis."></a>
        <nav class="amis-links">
            <a class="" href="${pageContext.request.contextPath}/find-all-postagens">▦ Feed</a>
            <a class="" href="${pageContext.request.contextPath}/journal">▤ Diário</a>
        </nav>
        <div class="amis-direita">
            <button type="button" id="botao-tema" class="amis-tema" onclick="mudarTema()" aria-label="Alternar tema">☾</button>
            <details class="perfil-menu">
                <summary><img class="avatar-novo" src="${pageContext.request.contextPath}/img/visual/pessoa.png" alt=""> <c:out value="${sessionScope.loggedUser}"/></summary>
                <a href="${pageContext.request.contextPath}/find-all-usuarios?pagina=perfil">Perfil</a>
                <c:if test="${sessionScope.admin eq 1}"><a href="${pageContext.request.contextPath}/admin.jsp">Admin</a></c:if>
                <a href="${pageContext.request.contextPath}/logout">Sair</a>
            </details>
        </div>
    </div>
</header>
        <div class="perfil-edicao"><a class="perfil-voltar" href="${pageContext.request.contextPath}/find-all-usuarios?pagina=perfil">← Voltar ao perfil</a>
            <div class="amis-painel">
                <div class="perfil-form-head"><span class="perfil-form-icon">✎</span><div><h2>Editar perfil</h2><p>Atualize suas informações pessoais.</p></div></div>
                <a href="${pageContext.request.contextPath}/pages/senha.jsp" class="perfil-senha-link">Alterar senha</a>

                <form action="${pageContext.request.contextPath}/create-usuario"
              method="post">
                    <input type="hidden" name="origem" value="perfil">
                    <div class="mb-3">
                        <label class="form-label">Nome</label>
                        <input type="text" name="nome" class="form-control"
                       value="<c:out value='${param.nome}'/>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Username</label>
                        <input type="text" name="username" class="form-control"
                       value="<c:out value='${param.username}'/>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">E-mail</label>
                        <input type="email" name="email" class="form-control"
                       value="<c:out value='${param.email}'/>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Foto (URL)</label>
                        <input type="text" name="foto" class="form-control"
                       value="<c:out value='${param.foto}'/>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Bio</label>
                        <textarea name="bio"
                          class="form-control"><c:out value="${param.bio}" /></textarea>
                    </div>
                    <div class="perfil-form-actions"><button type="submit" class="btn btn-roxo">Salvar alterações</button>
                    <a href="${pageContext.request.contextPath}/find-all-usuarios?pagina=perfil"
               class="perfil-secundario">
                        Voltar
                    </a>
                </div></form>
            </div>
        </div>
    <script src="${pageContext.request.contextPath}/js/tema.js"></script></body>
</html>
