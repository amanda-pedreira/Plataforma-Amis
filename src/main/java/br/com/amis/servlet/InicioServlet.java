package br.com.amis.servlet;

import br.com.amis.dao.*;
import br.com.amis.model.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/inicio")
public class InicioServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("banner", new BannerDAO().consultar());
        req.setAttribute("sobre", new SobreDAO().consultar());
        req.setAttribute("servicos", new ServicoDAO().consultar());
        req.setAttribute("configuracao", new ConfiguracaoDAO().consultar());
        req.getRequestDispatcher("/WEB-INF/inicio.jsp").forward(req, resp);
    }
}
