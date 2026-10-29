
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Administração - AMIS</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">

    <h2>Administração AMIS</h2>
    <p>Gerenciamento da plataforma</p>
    <div class="alert alert-warning">Sem login temporariamente. A área administrativa está liberada apenas para testes.</div>
    <a href="${pageContext.request.contextPath}/find-all-postagens" class="btn btn-outline-secondary btn-sm">Voltar ao feed</a>

    <div class="row mt-4">

        <div class="col-md-4 mb-3">
            <a href="${pageContext.request.contextPath}/find-all-categorias"
               class="text-decoration-none">

                <div class="card">
                    <div class="card-body">
                        <h5>Categorias</h5>
                        <p>Gerenciar categorias das postagens</p>
                    </div>
                </div>

            </a>
        </div>

        <div class="col-md-4 mb-3">
            <a href="${pageContext.request.contextPath}/find-all-flags"
               class="text-decoration-none">

                <div class="card">
                    <div class="card-body">
                        <h5>Flags</h5>
                        <p>Gerenciar flags das postagens</p>
                    </div>
                </div>

            </a>
        </div>

        <div class="col-md-4 mb-3">
            <a href="${pageContext.request.contextPath}/find-all-usuarios"
               class="text-decoration-none">

                <div class="card">
                    <div class="card-body">
                        <h5>Usuários e páginas</h5>
                        <p>Visualizar cadastros e gerenciar status</p>
                    </div>
                </div>

            </a>
        </div>

    </div>

</div>

</body>
</html>
