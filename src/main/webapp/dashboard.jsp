<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>
    <meta charset="UTF-8">
    <title>Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/layout.css">
</head>
<body class="amis-organizado">
<div>
    <h1>Amis</h1>
    <table>
        <tr>
                        <th>Name</th>
        </tr>
        <c:forEach var="amisItem" items="${amis}">
            <tr>
                <td></td>
                <td>${amisItem.name}</td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>