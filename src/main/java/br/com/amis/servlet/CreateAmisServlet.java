package br.com.amis.servlet;

import br.com.amis.dao.AmisDAO;
import br.com.amis.model.Amis;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/create-amis")
public class CreateAmisServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {

        String amisName = req.getParameter("amis-name");

        Amis amisItem = new Amis(amisName);

        new AmisDAO().createAmis(amisItem);

        resp.sendRedirect("/find-all-amis");

    }

}