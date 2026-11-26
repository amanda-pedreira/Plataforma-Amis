<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<h2>
    Alterar senha
</h2>
<c:if test="${param.ok eq 'true'}">
    Senha alterada.
</c:if>
<c:if test="${param.ok eq 'false'}">
    Confira a senha atual e a confirmação.
</c:if>
<form action="${pageContext.request.contextPath}/alterar-senha" method="post">
    <p>
        Senha atual
        <input type="password" name="atual" required>
    </p>
    <p>
        Nova senha
        <input type="password" name="nova" required>
    </p>
    <p>
        Confirmar nova senha
        <input type="password" name="confirmacao" required>
    </p>
    <button>Salvar</button>
</form>
<a href="${pageContext.request.contextPath}/find-all-usuarios?pagina=perfil">
    Voltar
</a>
