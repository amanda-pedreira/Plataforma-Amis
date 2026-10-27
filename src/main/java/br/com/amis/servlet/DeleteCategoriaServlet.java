package br.com.amis.servlet;

import br.com.amis.dao.CategoriaDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete-categoria")
public class DeleteCategoriaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        String id = req.getParameter("id");

        new CategoriaDAO().deleteCategoriaById(id);

        resp.sendRedirect(req.getContextPath() + "/find-all-categorias");
    }
}