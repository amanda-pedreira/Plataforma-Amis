package br.com.amis.servlet;

import br.com.amis.dao.CategoriaDAO;
import br.com.amis.model.Categoria;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/find-all-categorias")
public class ListCategoriaServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Categoria> categorias = new CategoriaDAO().findAllCategorias();

        req.setAttribute("categorias", categorias);

        req.getRequestDispatcher("/pages/categorias.jsp").forward(req, resp);
    }
}