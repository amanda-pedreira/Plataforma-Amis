<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>AMIS</title>
    </head>
    <body>
        <header>
            <a class="logo" href="${pageContext.request.contextPath}/inicio">
                <img src="<c:out value='${configuracao.logo}'/>" alt="AMIS" width="120">
            </a>
            <div>
                <a href="${pageContext.request.contextPath}/login">Entrar</a>
                <a class="botao" href="${pageContext.request.contextPath}/pages/cadastro.jsp">Criar conta</a>
            </div>
        </header>
        <main>
            <section class="secao secao-1">
                <div class="texto">
                    <small>
                        <c:out value="${banner.subtitulo}"/>
                    </small>
                    <h1>
                        <c:out value="${banner.titulo}"/>
                    </h1>
                    <p>
                        <c:out value="${banner.texto}"/>
                    </p>
                    <a class="botao" href="${pageContext.request.contextPath}/pages/cadastro.jsp">Faça parte da AMIS</a>
                </div>
                <img src="<c:out value='${banner.imagem}'/>" alt="Apresentação da AMIS" width="320">
            </section>
            <hr>
            <section class="secao secao-2">
                <div class="texto">
                    <small>Nossa essência</small>
                    <h2>
                        <c:out value="${sobre.titulo}"/>
                    </h2>
                    <p>
                        <c:out value="${sobre.texto}"/>
                    </p>
                </div>
            </section>
            <hr>
            <c:forEach items="${servicos}" var="servico">
                <section class="secao servico">
                    <div class="texto">
                        <small>
                            <c:out value="${servico.nome}"/>
                        </small>
                        <h2>
                            <c:out value="${servico.titulo}"/>
                        </h2>
                        <p>
                            <c:out value="${servico.texto}"/>
                        </p>
                    </div>
                    <img src="<c:out value='${servico.imagem}'/>" alt="Apresentação do serviço" width="320">
                </section>
                <hr>
            </c:forEach>
            <section class="contato">
                <h2>Entre em contato conosco</h2>
                <p>
                    <c:out value="${configuracao.email}"/>
                </p>
            </section>
            <hr>
        </main>
        <footer>
            <a class="logo" href="${pageContext.request.contextPath}/inicio">
                <img src="<c:out value='${configuracao.logo}'/>" alt="AMIS" width="120">
            </a>
            <p>Projeto Integrador — Amanda, Emilly e Isabele</p>
        </footer>
    </body>
</html>
