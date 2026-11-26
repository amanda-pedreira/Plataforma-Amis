<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <title>Alterar senha - AMIS</title>
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
 <main class="perfil-edicao"><a class="perfil-voltar" href="${pageContext.request.contextPath}/find-all-usuarios?pagina=perfil">← Voltar ao perfil</a><section class="amis-painel"><div class="perfil-form-head"><span class="perfil-form-icon">⌑</span><div><h2>Alterar senha</h2><p>Atualize a senha da sua conta.</p></div></div>
 <c:if test="${param.ok eq 'true'}"><div class="alert alert-success">Senha alterada.</div></c:if><c:if test="${param.ok eq 'false'}"><div class="alert alert-warning">Confira a senha atual e a confirmação.</div></c:if>
 <form action="${pageContext.request.contextPath}/alterar-senha" method="post"><label class="form-label" for="atual">Senha atual</label><input class="form-control" id="atual" type="password" name="atual" required><label class="form-label" for="nova">Nova senha</label><input class="form-control" id="nova" type="password" name="nova" required><label class="form-label" for="confirmacao">Confirmar nova senha</label><input class="form-control" id="confirmacao" type="password" name="confirmacao" required><div class="perfil-form-actions"><a class="perfil-secundario" href="${pageContext.request.contextPath}/find-all-usuarios?pagina=perfil">Cancelar</a><button class="btn btn-roxo">Salvar senha</button></div></form></section></main><script src="${pageContext.request.contextPath}/js/tema.js"></script></body></html>
