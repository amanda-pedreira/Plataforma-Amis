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
        String idTexto = req.getParameter("idUsuario");
        if (idTexto != null && !idTexto.isEmpty()) {
            try {
                int idUsuario = Integer.parseInt(idTexto);
                req.setAttribute("registros", dao.listar(idUsuario));
                String editar = req.getParameter("editar");
                if (editar != null) {
                    req.setAttribute("registroEditar", dao.buscar(Integer.parseInt(editar), idUsuario));
                }
            } catch (NumberFormatException e) {
                req.setAttribute("mensagem", "Informe um ID válido.");
            }
        }
        req.getRequestDispatcher("/pages/journal.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        int idUsuario;
        int idRegistro;
        try {
            idUsuario = Integer.parseInt(req.getParameter("idUsuario"));
            String acao = req.getParameter("acao");
            boolean sucesso;
            if ("excluir".equals(acao)) {
                idRegistro = Integer.parseInt(req.getParameter("idRegistro"));
                sucesso = dao.excluir(idRegistro, idUsuario);
            } else {
                String data = req.getParameter("data");
                String humor = req.getParameter("humor");
                String descricao = req.getParameter("descricao");
                if (data == null || !data.matches("\\d{2}/\\d{2}/\\d{4}") ||
                        humor == null || humor.trim().isEmpty() ||
                        descricao == null || descricao.trim().isEmpty()) {
                    sucesso = false;
                } else if ("editar".equals(acao)) {
                    idRegistro = Integer.parseInt(req.getParameter("idRegistro"));
                    sucesso = dao.editar(new Journal(idRegistro, idUsuario, data, humor, descricao));
                } else {
                    sucesso = dao.cadastrar(new Journal(0, idUsuario, data, humor, descricao));
                }
            }
            resp.sendRedirect(req.getContextPath() + "/journal?idUsuario=" + idUsuario +
                    (sucesso ? "&resultado=ok" : "&resultado=erro"));
        } catch (Exception e) {
            resp.sendRedirect(req.getContextPath() + "/journal?resultado=erro");
        }
    }
}
