package br.com.amis.servlet;

import br.com.amis.dao.ItemSalvoDAO;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/item-salvo")
public class ItemSalvoServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        try {
            int idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
            int idPostagem = Integer.parseInt(req.getParameter("idPostagem"));
            ItemSalvoDAO dao = new ItemSalvoDAO();
            if ("remover".equals(req.getParameter("acao"))) dao.remover(idUsuario, idPostagem);
            else dao.salvar(idUsuario, idPostagem);
            resp.sendRedirect(req.getContextPath() + "/find-all-usuarios?pagina=perfil&id=" + idUsuario);
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/find-all-postagens");
        }
    }
}
