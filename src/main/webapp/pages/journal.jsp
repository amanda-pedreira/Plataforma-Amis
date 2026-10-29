<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Journal - AMIS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
</head>
<body class="bg-color-claro amis-organizado">
<div class="container my-4" style="max-width:850px">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2>Meu Journal</h2>
        <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/find-all-postagens">Voltar ao feed</a>
    </div>
    <p>Um espaço para registrar seus momentos e sentimentos.</p>
    <div class="alert alert-info">Em desenvolvimento: em breve você poderá escolher as datas em um calendário e acompanhar seus registros de um jeito mais visual!</div>
    <div class="alert alert-warning">Temporário: como ainda não temos login, informe seu ID para consultar seus registros. Por enquanto, eles não estão protegidos por uma conta.</div>

    <form action="${pageContext.request.contextPath}/journal" method="get" class="card card-body mb-4">
        <label class="form-label" for="idUsuario">Seu ID de usuário</label>
        <div class="d-flex gap-2">
            <input class="form-control" id="idUsuario" type="number" name="idUsuario" min="1" value="<c:out value='${param.idUsuario}'/>" required>
            <button class="btn btn-primary" type="submit">Consultar</button>
        </div>
    </form>

    <c:if test="${param.resultado == 'ok'}"><div class="alert alert-success">Registro salvo!</div></c:if>
    <c:if test="${param.resultado == 'erro'}"><div class="alert alert-danger">Não foi possível salvar. Confira o ID e a data no formato DD/MM/AAAA.</div></c:if>
    <c:if test="${not empty mensagem}"><div class="alert alert-danger"><c:out value="${mensagem}"/></div></c:if>

    <c:if test="${not empty param.idUsuario}">
        <div class="card card-body mb-4">
            <h4><c:choose><c:when test="${not empty registroEditar}">Editar registro</c:when><c:otherwise>Novo registro</c:otherwise></c:choose></h4>
            <form action="${pageContext.request.contextPath}/journal" method="post">
                <input type="hidden" name="idUsuario" value="<c:out value='${param.idUsuario}'/>">
                <c:if test="${not empty registroEditar}">
                    <input type="hidden" name="acao" value="editar">
                    <input type="hidden" name="idRegistro" value="${registroEditar.idRegistro}">
                </c:if>
                <div class="mb-3">
                    <label class="form-label">Data</label>
                    <input class="form-control" type="text" name="data" placeholder="30/07/2026" maxlength="10" pattern="[0-9]{2}/[0-9]{2}/[0-9]{4}" title="Digite a data no formato DD/MM/AAAA" value="<c:out value='${registroEditar.data}'/>" required>
                    <div class="form-text">Digite no formato DD/MM/AAAA.</div>
                </div>
                <div class="mb-3">
                    <label class="form-label">Como você se sentiu?</label>
                    <select name="humor" class="form-select" required>
                        <option value="">Selecione</option>
                        <option value="Feliz" ${registroEditar.humor == 'Feliz' ? 'selected' : ''}>Feliz</option>
                        <option value="Triste" ${registroEditar.humor == 'Triste' ? 'selected' : ''}>Triste</option>
                        <option value="Ansiosa" ${registroEditar.humor == 'Ansiosa' ? 'selected' : ''}>Ansiosa</option>
                        <option value="Calma" ${registroEditar.humor == 'Calma' ? 'selected' : ''}>Calma</option>
                        <option value="Animada" ${registroEditar.humor == 'Animada' ? 'selected' : ''}>Animada</option>
                        <option value="Grata" ${registroEditar.humor == 'Grata' ? 'selected' : ''}>Grata</option>
                        <option value="Outro" ${registroEditar.humor == 'Outro' ? 'selected' : ''}>Outro</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label class="form-label">Descrição</label>
                    <textarea class="form-control" name="descricao" rows="4" required><c:out value="${registroEditar.descricao}"/></textarea>
                </div>
                <button type="submit" class="btn btn-primary"><c:choose><c:when test="${not empty registroEditar}">Salvar alterações</c:when><c:otherwise>Salvar registro</c:otherwise></c:choose></button>
                <c:if test="${not empty registroEditar}"><a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/journal?idUsuario=${param.idUsuario}">Cancelar</a></c:if>
            </form>
        </div>
        <h4>Meus registros</h4>
        <c:if test="${empty registros}"><p class="text-muted">Nenhum registro encontrado para esse ID.</p></c:if>
        <c:forEach var="registro" items="${registros}">
            <div class="card card-body mb-3">
                <div class="d-flex justify-content-between align-items-center">
                    <strong><c:out value="${registro.data}"/></strong>
                    <span class="badge bg-secondary"><c:out value="${registro.humor}"/></span>
                </div>
                <p class="mt-2" style="white-space:pre-wrap"><c:out value="${registro.descricao}"/></p>
                <div class="d-flex gap-2">
                    <a class="btn btn-outline-primary btn-sm" href="${pageContext.request.contextPath}/journal?idUsuario=${param.idUsuario}&amp;editar=${registro.idRegistro}">Editar</a>
                    <form action="${pageContext.request.contextPath}/journal" method="post">
                        <input type="hidden" name="acao" value="excluir">
                        <input type="hidden" name="idUsuario" value="${param.idUsuario}">
                        <input type="hidden" name="idRegistro" value="${registro.idRegistro}">
                        <button type="submit" class="btn btn-outline-danger btn-sm">Excluir</button>
                    </form>
                </div>
            </div>
        </c:forEach>
    </c:if>
</div>
</body>
</html>
