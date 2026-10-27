package br.com.amis.servlet;

import br.com.amis.dao.CategoriaDAO;
import br.com.amis.model.Categoria;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-categoria")
public class CreateCategoriaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        String id = req.getParameter("id");
        String nome = req.getParameter("categoria-nome");

        CategoriaDAO categoriaDAO = new CategoriaDAO();
        Categoria categoria = new Categoria(id, nome);

        if (id.isBlank()) {

            categoriaDAO.createCategoria(categoria);

        } else {

            categoriaDAO.updateCategoria(categoria);
        }

        resp.sendRedirect(req.getContextPath() + "/find-all-categorias");
    }
}