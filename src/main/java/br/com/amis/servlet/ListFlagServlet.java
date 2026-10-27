package br.com.amis.servlet;

import br.com.amis.dao.FlagDAO;
import br.com.amis.model.Flag;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/find-all-flags")
public class ListFlagServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Flag> flags = new FlagDAO().findAllFlags();

        req.setAttribute("flags", flags);

        req.getRequestDispatcher("/pages/flags.jsp").forward(req, resp);
    }
}