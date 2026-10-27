package br.com.amis.servlet;

import br.com.amis.dao.FlagDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete-flag")
public class DeleteFlagServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws IOException {

        String id = req.getParameter("id");

        new FlagDAO().deleteFlagById(id);

        resp.sendRedirect(req.getContextPath() + "/find-all-flags");
    }
}