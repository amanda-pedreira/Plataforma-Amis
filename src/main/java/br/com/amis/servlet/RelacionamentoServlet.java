package br.com.amis.servlet;

import br.com.amis.dao.RelacionamentoDAO;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/relacionamento")
public class RelacionamentoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            int idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
            int idDestino = Integer.parseInt(req.getParameter("idDestino"));
            String tipo = req.getParameter("tipo");
            String acao = req.getParameter("acao");
            String tabela = "pagina".equals(tipo) ? "PAGINA_SEGUIDA" : "PESSOA_SALVA";
            String coluna = "pagina".equals(tipo) ? "ID_PAGINA" : "ID_PESSOA";
            RelacionamentoDAO dao = new RelacionamentoDAO();
            if ("remover".equals(acao)) dao.remover(tabela, coluna, idUsuario, idDestino);
            else if (idUsuario != idDestino) dao.salvar(tabela, coluna, idUsuario, idDestino);
            resp.sendRedirect(req.getContextPath() + "/find-all-usuarios?pagina=perfil&id=" + idUsuario);
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/find-all-postagens");
        }
    }
}
