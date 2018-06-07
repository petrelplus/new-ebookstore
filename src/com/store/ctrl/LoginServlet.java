package com.store.ctrl;

import com.store.service.UserService;
import com.store.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String userName = req.getParameter("username");
        String password = req.getParameter("password");

        UserService userService = new UserServiceImpl();

        try {
            if(userService.checkUser(userName,password)){
                HttpSession httpSession = req.getSession();
                httpSession.setAttribute("user",userService.getUserByName(userName));
                req.getRequestDispatcher("index.jsp").forward(req,resp);
            }else {
                out.println("<script>");
                out.println("alert('用户名或密码错误！')");
                out.println("history.back(-1)");
                out.println("</script>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
