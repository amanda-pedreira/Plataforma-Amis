package br.com.amis.servlet;

import br.com.amis.dao.ItemSalvoDAO;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/item-salvo")
public class ItemSalvoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        if (req.getSession().getAttribute("idUsuario") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        int idUsuario = (Integer) req.getSession().getAttribute("idUsuario");
        int idPostagem = Integer.parseInt(req.getParameter("idPostagem"));
        ItemSalvoDAO dao = new ItemSalvoDAO();
        if ("remover".equals(req.getParameter("acao"))) {
            dao.remover(idUsuario, idPostagem);

        } else {
            dao.salvar(idUsuario, idPostagem);

        }
        if ("perfil".equals(req.getParameter("origem"))) {
            resp.sendRedirect(req.getContextPath() + "/find-all-usuarios?pagina=perfil&aba=postagens-salvas");
        } else {
            resp.sendRedirect(req.getContextPath() + "/find-all-postagens");
        }
    }
}
