package br.com.amis.servlet;

import br.com.amis.dao.*;
import br.com.amis.model.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/admin/conteudos")
public class ConteudoSiteServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("banner", new BannerDAO().consultar());
        req.setAttribute("sobre", new SobreDAO().consultar());
        req.setAttribute("servicos", new ServicoDAO().consultar());
        req.setAttribute("configuracao", new ConfiguracaoDAO().consultar());
        req.getRequestDispatcher("/WEB-INF/conteudos.jsp").forward(req, resp);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        String acao = req.getParameter("acao");
        if ("banner".equals(acao)) {
            new BannerDAO().atualizar(new Banner("1", req.getParameter("subtitulo"), req.getParameter("titulo"), req.getParameter("texto"), req.getParameter("imagem")));
        }
        else if ("sobre".equals(acao)) {
            new SobreDAO().atualizar(new Sobre("1", req.getParameter("titulo"), req.getParameter("texto")));
        }
        else if ("servico".equals(acao)) {
            new ServicoDAO().atualizar(new Servico(req.getParameter("id"), req.getParameter("nome"), req.getParameter("titulo"), req.getParameter("texto"), req.getParameter("imagem")));
        }
        else if ("configuracao".equals(acao)) {
            new ConfiguracaoDAO().atualizar(new Configuracao("1", req.getParameter("logo"), req.getParameter("email")));
        }
        resp.sendRedirect(req.getContextPath() + "/admin/conteudos");
    }
}
