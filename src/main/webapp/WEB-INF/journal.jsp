<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Journal - AMIS</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/prototipo-v4.css">
</head>
    <body class="bg-color-claro">
        <header><nav><a class="logo" href="${pageContext.request.contextPath}/find-all-postagens"><img src="${pageContext.request.contextPath}/img/visual/logo.png" alt="amis." style="width:110px;height:auto;display:block;"></a><div class="menu"><a  href="${pageContext.request.contextPath}/find-all-postagens">▦ &nbsp; Feed</a><a class="active" href="${pageContext.request.contextPath}/journal">▤ &nbsp; Diário</a></div><div class="profile"><button id="botao-tema" onclick="mudarTema()" aria-label="Mudar tema">☾</button><details><summary><img class="avatar" src="${pageContext.request.contextPath}/img/visual/pessoa.png" alt=""><strong><c:out value="${sessionScope.loggedUser}"/></strong></summary><div class="dropdown"><a href="${pageContext.request.contextPath}/find-all-usuarios?pagina=perfil">Perfil</a><c:if test="${sessionScope.admin eq 1}"><a href="${pageContext.request.contextPath}/admin.jsp">Admin</a></c:if><a href="${pageContext.request.contextPath}/logout">Sair</a></div></details></div></nav></header>
        <main><section id="diario" class="page">
            <section class="diaryhead">

                <h1>A vida que acontece em mim.</h1>
                <p class="muted">Registre seus pensamentos, sentimentos e reflexões do dia.</p>
            </section>
            <c:if test="${param.resultado eq 'erro'}">
                <p role="alert">Não foi possível guardar o registro. Confira os campos.</p>
            </c:if>
            <section class="card">

                <h2>
                    <c:choose>
                        <c:when test="${not empty registroEditar}">
                            Revisitando uma memória
                        </c:when>
                        <c:otherwise>
                            Nova entrada no Diário
                        </c:otherwise>
                    </c:choose>
                </h2>
                <form action="${pageContext.request.contextPath}/journal" method="post">
                    <c:if test="${not empty registroEditar}">
                        <input type="hidden" name="acao" value="editar">
                        <input type="hidden" name="idRegistro" value="${registroEditar.idRegistro}">
                    </c:if>
                    <label for="data">Data</label>
                    <input id="data" type="date" name="data" value="<c:out value='${registroEditar.data}'/>" required>
                    <label>Como você se sentiu hoje?</label>
                    <div class="moods">
                        <label>
                            <input type="radio" name="humor" value="Feliz" ${registroEditar.humor eq 'Feliz' ? 'checked' : ''} required>
                            <span>
                                <b><img class="humor-icon" src="${pageContext.request.contextPath}/img/visual/arte-6.svg" alt=""></b>
                                Feliz
                            </span>
                        </label>
                        <label>
                            <input type="radio" name="humor" value="Tranquila" ${registroEditar.humor eq 'Tranquila' ? 'checked' : ''} required>
                            <span>
                                <b><img class="humor-icon" src="${pageContext.request.contextPath}/img/visual/arte-7.svg" alt=""></b>
                                Tranquila
                            </span>
                        </label>
                        <label>
                            <input type="radio" name="humor" value="Normal" ${registroEditar.humor eq 'Normal' ? 'checked' : ''} required>
                            <span>
                                <b><img class="humor-icon" src="${pageContext.request.contextPath}/img/visual/arte-8.svg" alt=""></b>
                                Normal
                            </span>
                        </label>
                        <label>
                            <input type="radio" name="humor" value="Triste" ${registroEditar.humor eq 'Triste' ? 'checked' : ''} required>
                            <span>
                                <b><img class="humor-icon" src="${pageContext.request.contextPath}/img/visual/arte-9.svg" alt=""></b>
                                Triste
                            </span>
                        </label>
                        <label>
                            <input type="radio" name="humor" value="Difícil" ${registroEditar.humor eq 'Difícil' ? 'checked' : ''} required>
                            <span>
                                <b><img class="humor-icon" src="${pageContext.request.contextPath}/img/visual/arte-10.svg" alt=""></b>
                                Difícil
                            </span>
                        </label>
                        <c:if test="${not empty registroEditar and registroEditar.humor ne 'Feliz' and registroEditar.humor ne 'Tranquila' and registroEditar.humor ne 'Normal' and registroEditar.humor ne 'Triste' and registroEditar.humor ne 'Difícil'}">
                            <label>
                                <input type="radio" name="humor" value="<c:out value='${registroEditar.humor}'/>" checked>
                                <span>
                                    <c:out value="${registroEditar.humor}"/>
                                </span>
                            </label>
                        </c:if>
                    </div>
                    <label>Título</label><p>
                        <input class="titulo" name="titulo" aria-label="Título" placeholder="Um título para esse momento..." maxlength="150" value="<c:out value='${registroEditar.titulo}'/>" required>
                    </p>
                    <label>Sua reflexão</label><p>
                        <textarea name="descricao" aria-label="Seu registro" rows="6" maxlength="4000" placeholder="Escreva sobre seu dia, sentimentos e aprendizados..." required><c:out value="${registroEditar.descricao}"/></textarea>
                    </p>
                    <div class="formactions"><button class="primary" type="submit">
                        <c:choose>
                            <c:when test="${not empty registroEditar}">
                                Salvar alterações
                            </c:when>
                            <c:otherwise>
                                Salvar entrada
                            </c:otherwise>
                        </c:choose>
                    </button>
                    <c:if test="${not empty registroEditar}">
                        <a href="${pageContext.request.contextPath}/journal">Cancelar edição</a>
                    </c:if>
                    </div>
                </form>
            </section>
            <section class="card">
                <div class="history-head"><h2>Meus registros</h2>
                <form class="busca-data" action="${pageContext.request.contextPath}/journal" method="get">

                    <input id="buscaData" type="date" name="buscaData" value="<c:out value='${param.buscaData}'/>" onchange="this.form.submit()">
                    <a class="clear" href="${pageContext.request.contextPath}/journal">Limpar</a>
                </form></div>
                <c:if test="${empty registros}">
                    <p class="papel">
                        <c:choose>
                            <c:when test="${not empty param.buscaData}">
                                Nenhum registro encontrado nessa data.
                            </c:when>
                            <c:otherwise>
                                Sua história começa com uma página em branco.
                            </c:otherwise>
                        </c:choose>
                    </p>
                </c:if>
                <c:forEach var="registro" items="${registros}">
                    <article class="entry journal-record">
                            <div class="entry-tools">
                                    <a href="${pageContext.request.contextPath}/journal?editar=${registro.idRegistro}">Editar</a>
                                    <form action="${pageContext.request.contextPath}/journal" method="post" onsubmit="return confirm('Deseja excluir esta lembrança?')">
                                        <input type="hidden" name="acao" value="excluir">
                                        <input type="hidden" name="idRegistro" value="${registro.idRegistro}">
                                        <button type="submit" class="excluir">Excluir</button>
                                    </form>
                                </div><div class="record-meta"><span class="muted">${fn:substring(registro.data, 8, 10)}/${fn:substring(registro.data, 5, 7)}/${fn:substring(registro.data, 0, 4)}</span><span class="record-mood" data-humor="<c:out value='${registro.humor}'/>"><c:choose><c:when test="${registro.humor eq 'Feliz'}"><img src="${pageContext.request.contextPath}/img/visual/arte-6.svg" alt=""></c:when><c:when test="${registro.humor eq 'Tranquila'}"><img src="${pageContext.request.contextPath}/img/visual/arte-7.svg" alt=""></c:when><c:when test="${registro.humor eq 'Normal'}"><img src="${pageContext.request.contextPath}/img/visual/arte-8.svg" alt=""></c:when><c:when test="${registro.humor eq 'Triste'}"><img src="${pageContext.request.contextPath}/img/visual/arte-9.svg" alt=""></c:when><c:when test="${registro.humor eq 'Difícil'}"><img src="${pageContext.request.contextPath}/img/visual/arte-10.svg" alt=""></c:when></c:choose><c:out value="${registro.humor}"/></span></div>
                            <h2>
                                <c:out value="${registro.titulo}"/>
                            </h2>
                            <p class="descricao"><c:out value="${registro.descricao}"/></p>
                        </article>
                </c:forEach>
            </section>
        </section></main>
    <script src="${pageContext.request.contextPath}/js/tema.js"></script>
    </body>
</html>
