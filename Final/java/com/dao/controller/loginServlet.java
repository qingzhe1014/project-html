package com.dao.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.dao.bean.Login;
import com.dao.LoginDao;


public class loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    public loginServlet() {
        // TODO Auto-generated constructor stub
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String Email = request.getParameter("email");
        String Password = request.getParameter("password");

        Login login = new Login();

        login.setEmail(Email);
        login.setPassword(Password);

        LoginDao loginDao = new LoginDao();

        try
        {
            String userValidate = loginDao.authenticateUser(login);
            if(userValidate.equals("Admin_Role"))
            {
                System.out.println("Admin's Home");

                HttpSession session = request.getSession();
                session.setAttribute("Admin", Email);
                request.setAttribute("Email", Email);

                request.getRequestDispatcher("/admin/index.jsp").forward(request, response);;
            }
            else if(userValidate.equals("User_Role"))
            {
                System.out.println("User's Home");

                HttpSession session = request.getSession();
                session.setMaxInactiveInterval(10*60);
                session.setAttribute("User", Email);
                request.setAttribute("Email", Email);

                request.getRequestDispatcher("home.html").forward(request, response);
            }
            else
            {
                System.out.println("Error Message= "+userValidate);
                request.setAttribute("errMessage", userValidate);

                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
        }
        catch (IOException e1)
        {
            e1.printStackTrace();
        }
        catch (Exception e2)
        {
            e2.printStackTrace();
        }
    }

}