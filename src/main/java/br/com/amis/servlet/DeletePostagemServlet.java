
package br.com.amis.servlet;

import br.com.amis.dao.PostagemDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete-postagem")
public class DeletePostagemServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String id = req.getParameter("id");

        PostagemDAO dao = new PostagemDAO();

        dao.deletePostagemById(Integer.parseInt(id));

        resp.sendRedirect(req.getContextPath() + "/find-all-postagens");
    }
}
