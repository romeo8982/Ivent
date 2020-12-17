package Servlets;

import DBTest.DBConnector;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

@WebServlet(name = "continueRegister", value="/continueRegister")
public class continueRegister extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String url = "/Display.jsp";
        String surname;
        try {
            DBConnector dbConnector = new DBConnector();
            surname=dbConnector.getAllUsers().get(0).getSurname();
            request.setAttribute("userName", surname );
            request.getRequestDispatcher(url).forward(request,response);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            request.setAttribute("userName", "Error" );
            request.getRequestDispatcher(url).forward(request,response);}
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");
        try (PrintWriter out = response.getWriter()) {
            out.println("<h3> Testing Servlets </h3>");
        }
    }
}
