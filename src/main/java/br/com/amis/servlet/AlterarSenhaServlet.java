package br.com.amis.servlet;

import br.com.amis.dao.UsuarioDAO;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/alterar-senha")
public class AlterarSenhaServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        Integer id = (Integer) req.getSession().getAttribute("idUsuario");
        if (id == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        String nova = req.getParameter("nova");
        boolean ok = nova != null && !nova.isEmpty() && nova.equals(req.getParameter("confirmacao")) && new UsuarioDAO().alterarSenha(id, req.getParameter("atual"), nova);
        resp.sendRedirect(req.getContextPath() + "/pages/senha.jsp?ok=" + ok);
    }
}
