package br.com.amis.servlet;

import br.com.amis.dao.JournalDAO;
import br.com.amis.model.Journal;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/journal")
public class JournalServlet extends HttpServlet {
    private JournalDAO dao = new JournalDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getSession().getAttribute("idUsuario") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        int idUsuario = (Integer) req.getSession().getAttribute("idUsuario");
        req.setAttribute("registros", dao.listar(idUsuario, req.getParameter("buscaData")));
        String editar = req.getParameter("editar");
        if (editar != null) {
            req.setAttribute("registroEditar", dao.buscar(Integer.parseInt(editar), idUsuario));
        }
        req.getRequestDispatcher("/WEB-INF/journal.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        if (req.getSession().getAttribute("idUsuario") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        int idUsuario = (Integer) req.getSession().getAttribute("idUsuario");
        String acao = req.getParameter("acao");
        boolean sucesso;
        if ("excluir".equals(acao)) {
            sucesso = dao.excluir(Integer.parseInt(req.getParameter("idRegistro")), idUsuario);
        } else {
            String data = req.getParameter("data");
            String humor = req.getParameter("humor");
            String descricao = req.getParameter("descricao");
            String titulo = req.getParameter("titulo");
            if ("editar".equals(acao)) {
                int idRegistro = Integer.parseInt(req.getParameter("idRegistro"));
                sucesso = dao.editar(new Journal(idRegistro, idUsuario, data, humor, descricao, titulo));
            } else {
                sucesso = dao.cadastrar(new Journal(0, idUsuario, data, humor, descricao, titulo));
            }
        }
        if (sucesso) {
            resp.sendRedirect(req.getContextPath() + "/journal");
        } else {
            resp.sendRedirect(req.getContextPath() + "/journal?resultado=erro");
        }
    }
}
