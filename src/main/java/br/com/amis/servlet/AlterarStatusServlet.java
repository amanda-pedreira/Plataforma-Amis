package br.com.amis.servlet;

import br.com.amis.dao.UsuarioDAO;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/alterar-status")
public class AlterarStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        String status = req.getParameter("status");
        if ("ATIVO".equals(status) || "INATIVO".equals(status)) {
            new UsuarioDAO().alterarStatus(Integer.parseInt(req.getParameter("id")), status);
        }
        resp.sendRedirect(req.getContextPath() + "/find-all-usuarios");
    }
}
