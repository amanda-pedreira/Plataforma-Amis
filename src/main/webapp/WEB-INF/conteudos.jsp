<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>AMIS</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/inicio.css">
    </head>
    <body>
        <header>
            <span class="logo">amis.</span>
            <a href="${pageContext.request.contextPath}/admin.jsp">Voltar ao administrativo</a>
        </header>
        <main class="edicao">
            <h1>Conteúdos da página inicial</h1>
            <form method="post" action="${pageContext.request.contextPath}/admin/conteudos">
                <h2>Banner inicial</h2>
                <input type="hidden" name="acao" value="banner">
                <label>
                    Subtítulo
                    <input name="subtitulo" value="<c:out value='${banner.subtitulo}'/>" required>
                </label>
                <label>
                    Título
                    <input name="titulo" value="<c:out value='${banner.titulo}'/>" required>
                </label>
                <label>
                    Texto
                    <textarea name="texto" rows="4" required><c:out value='${banner.texto}'/></textarea>
                </label>
                <label>
                    Link da imagem
                    <input name="imagem" value="<c:out value='${banner.imagem}'/>" required>
                </label>
                <button class="botao">Salvar alterações</button>
            </form>
            <form method="post" action="${pageContext.request.contextPath}/admin/conteudos">
                <h2>Nossa essência</h2>
                <input type="hidden" name="acao" value="sobre">
                <label>
                    Título
                    <input name="titulo" value="<c:out value='${sobre.titulo}'/>" required>
                </label>
                <label>
                    Texto
                    <textarea name="texto" rows="4" required><c:out value='${sobre.texto}'/></textarea>
                </label>
                <button class="botao">Salvar alterações</button>
            </form>
            <c:forEach items="${servicos}" var="servico">
                <form method="post" action="${pageContext.request.contextPath}/admin/conteudos">
                    <h2>
                        <c:out value="${servico.nome}"/>
                    </h2>
                    <input type="hidden" name="acao" value="servico">
                    <input type="hidden" name="id" value="${servico.id}">
                    <label>
                        Nome do serviço
                        <input name="nome" value="<c:out value='${servico.nome}'/>" required>
                    </label>
                    <label>
                        Título
                        <input name="titulo" value="<c:out value='${servico.titulo}'/>" required>
                    </label>
                    <label>
                        Texto
                        <textarea name="texto" rows="4" required><c:out value='${servico.texto}'/></textarea>
                    </label>
                    <label>
                        Link da imagem
                        <input name="imagem" value="<c:out value='${servico.imagem}'/>" required>
                    </label>
                    <button class="botao">Salvar alterações</button>
                </form>
            </c:forEach>
            <form method="post" action="${pageContext.request.contextPath}/admin/conteudos">
                <h2>Logo e contato</h2>
                <input type="hidden" name="acao" value="configuracao">
                <label>
                    Link da logo
                    <input name="logo" value="<c:out value='${configuracao.logo}'/>" required>
                </label>
                <label>
                    E-mail
                    <input name="email" value="<c:out value='${configuracao.email}'/>" required>
                </label>
                <button class="botao">Salvar alterações</button>
            </form>
            <a href="${pageContext.request.contextPath}/inicio">Ver página inicial</a>
        </main>
    </body>
</html>
