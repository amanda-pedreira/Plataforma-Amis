package br.com.amis.servlet;

import br.com.amis.dao.FlagDAO;
import br.com.amis.model.Flag;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-flag")
public class CreateFlagServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        String id = req.getParameter("id");
        String nome = req.getParameter("flag-nome");

        FlagDAO flagDAO = new FlagDAO();
        Flag flag = new Flag(id, nome);

        if (id.isBlank()) {

            flagDAO.createFlag(flag);

        } else {

            flagDAO.updateFlag(flag);
        }

        resp.sendRedirect(req.getContextPath() + "/find-all-flags");
    }
}