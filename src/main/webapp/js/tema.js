function aplicarTema() {
    var escuro = localStorage.getItem("temaAmis") === "escuro";
    document.body.classList.toggle("bg-color-escuro", escuro);
    document.body.classList.toggle("bg-color-claro", !escuro);
    var botao = document.getElementById("botao-tema");
    if (botao) {
        botao.textContent = escuro ? "☀" : "☾";
        botao.title = escuro ? "Modo claro" : "Modo escuro";
    }
}

function mudarTema() {
    var escuro = document.body.classList.contains("bg-color-escuro");
    localStorage.setItem("temaAmis", escuro ? "claro" : "escuro");
    aplicarTema();
}

document.addEventListener("DOMContentLoaded", aplicarTema);
