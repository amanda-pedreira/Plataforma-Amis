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
    <body class="inicio">
        <header>
            <a class="logo" href="${pageContext.request.contextPath}/inicio">
                <c:choose>
                    <c:when test="${empty configuracao.logo or configuracao.logo eq 'img/logo.svg' or configuracao.logo eq 'img/visual/logo.png'}">
                        <img src="${pageContext.request.contextPath}/img/visual/logo.png" alt="amis." class="logo-nova">
                    </c:when>
                    <c:otherwise>
                        <img src="<c:out value='${configuracao.logo}'/>" alt="amis." class="logo-nova">
                    </c:otherwise>
                </c:choose>
            </a>
            <div>
                <button type="button" id="botao-tema" onclick="mudarTema()" aria-label="Alternar tema">☾</button>
                <a href="${pageContext.request.contextPath}/login">Entrar</a>
                <a class="botao" href="${pageContext.request.contextPath}/pages/cadastro.jsp">Criar conta</a>
            </div>
        </header>
        <main>
            <section class="secao secao-1">
                <div class="texto">
                    <h1>
                        <c:out value="${banner.titulo}"/>
                    </h1>
                    <p>
                        <c:out value="${banner.texto}"/>
                    </p>
                    <a class="botao" href="${pageContext.request.contextPath}/pages/cadastro.jsp">Faça parte da AMIS</a>
                </div>
                <div class="arte">
                    <c:choose>
                        <c:when test="${empty banner.imagem or banner.imagem eq 'img/banner.svg'}">
                            <img src="${pageContext.request.contextPath}/img/perfil-real.png" alt="Feed da AMIS">
                        </c:when>
                        <c:otherwise>
                            <img src="<c:out value='${banner.imagem}'/>" alt="Apresentação da AMIS">
                        </c:otherwise>
                    </c:choose>
                    <img class="imagem-menor" src="${pageContext.request.contextPath}/img/journal-real.png" alt="Diário da AMIS">
                </div>
            </section>
            <section class="secao secao-2">
                <div class="texto">
                    
                    <h2>
                        <c:out value="${sobre.titulo}"/>
                    </h2>
                    <p>
                        <c:out value="${sobre.texto}"/>
                    </p>
                </div>
            </section>
            <div class="servicos">
            <c:forEach items="${servicos}" var="servico">
                <section class="secao servico">
                    <div class="texto">
                        <h2>
                            <c:out value="${servico.titulo}"/>
                        </h2>
                        <p>
                            <c:out value="${servico.texto}"/>
                        </p>
                    </div>
                    <c:choose>
                        <c:when test="${empty servico.imagem or servico.imagem eq 'img/perfil.svg'}"><img src="${pageContext.request.contextPath}/img/perfil-real.png" alt="Feed da AMIS"></c:when>
                        <c:when test="${servico.imagem eq 'img/journal.svg'}"><img src="${pageContext.request.contextPath}/img/journal-real.png" alt="Diário da AMIS"></c:when>
                        <c:when test="${servico.imagem eq 'img/paginas.svg'}"><img src="${pageContext.request.contextPath}/img/paginas-real.png" alt="Páginas da AMIS"></c:when>
                        <c:otherwise><img src="<c:out value='${servico.imagem}'/>" alt="Apresentação do serviço"></c:otherwise>
                    </c:choose>
                </section>
            </c:forEach>
            </div>
            <section class="contato">
                
                <div class="contato-texto">
                    <h2>Estamos aqui para ouvir você.</h2>
                    <p>Tem alguma dúvida, sugestão ou ideia para a AMIS? Entre em contato com nossa equipe. Queremos construir uma comunidade que faça sentido para quem faz parte dela.</p>
                </div>
                <a class="botao contato-botao" href="mailto:<c:out value='${configuracao.email}'/>">
                    ✉ &nbsp; Entrar em contato
                </a>
            </section>
        </main>
        <script src="${pageContext.request.contextPath}/js/tema.js"></script>
    </body>
</html>
