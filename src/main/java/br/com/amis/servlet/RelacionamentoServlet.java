package br.com.amis.servlet;

import br.com.amis.dao.RelacionamentoDAO;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/relacionamento")
public class RelacionamentoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        if (req.getSession().getAttribute("idUsuario") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        int idUsuario = (Integer) req.getSession().getAttribute("idUsuario");
        int idDestino = Integer.parseInt(req.getParameter("idDestino"));
        String tabela = "PESSOA_SALVA";
        String coluna = "ID_PESSOA";
        if ("pagina".equals(req.getParameter("tipo"))) {
            tabela = "PAGINA_SEGUIDA";
            coluna = "ID_PAGINA";
        }
        RelacionamentoDAO dao = new RelacionamentoDAO();
        if ("remover".equals(req.getParameter("acao"))) {
            dao.remover(tabela, coluna, idUsuario, idDestino);

        } else {
            if (idUsuario != idDestino) {
                dao.salvar(tabela, coluna, idUsuario, idDestino);
            }

        }
        if ("perfil".equals(req.getParameter("origem"))) {
            resp.sendRedirect(req.getContextPath() + "/find-all-usuarios?pagina=perfil&aba=" + ("pagina".equals(req.getParameter("tipo")) ? "paginas-seguidas" : "pessoas-salvas"));
        } else {
            resp.sendRedirect(req.getContextPath() + "/perfil-publico?id=" + idDestino);
        }
    }
}
