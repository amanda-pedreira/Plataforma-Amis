
function mudarTema() {
    document.body.classList.toggle("bg-color-escuro");
    document.body.classList.toggle("bg-color-claro");

    let botao = document.getElementById("botao-tema");

    if (document.body.classList.contains("bg-color-escuro")) {
        botao.textContent = "Modo claro";
    } else {
        botao.textContent = "Modo escuro";
    }
}
