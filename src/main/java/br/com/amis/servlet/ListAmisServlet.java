package br.com.amis.servlet;

import br.com.amis.dao.AmisDAO;
import br.com.amis.model.Amis;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/find-all-amis")
public class ListAmisServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        List<Amis> amis = new AmisDAO().findAllAmis();

        req.setAttribute("amis", amis);

        req.getRequestDispatcher("/dashboard.jsp").forward(req, resp);

    }

}