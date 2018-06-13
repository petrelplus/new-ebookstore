package com.store.ctrl;

import com.store.model.User;
import com.store.service.UserService;
import com.store.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();

        String userName = req.getParameter("username");
        String password = req.getParameter("password");
        String repassword = req.getParameter("repassword");
        String realName = req.getParameter("realname");
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        String telphone = req.getParameter("telphone");

        UserService userService = new UserServiceImpl();

        try {
            if (!userService.checkUserName(userName)) {
                out.println("<script>");
                out.println("alert('用户名已存在！')");
                out.println("history.back(-1)");
                out.println("</script>");
                out.flush();

            } else if (userName == null || password == null) {
                out.println("<script>");
                out.println("alert('用户名和密码不能为空！')");
                out.println("history.back(-1)");
                out.println("</script>");
                out.flush();
            } else if (!password.equals(repassword)) {
                out.println("<script>");
                out.println("alert('确认密码与原密码不符！')");
                out.println("history.back(-1)");
                out.println("</script>");
                out.flush();
            } else {
                User user = new User(password, userName, realName, email, address, telphone);
                boolean result = false;
                try {
                    result = userService.regiaterUser(user);
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                if (result) {
                    req.getSession().setAttribute("user",user);

                    out.println("<script>");
                    out.println("alert('注册成功!');");
                    out.println("window.location.href='/index.jsp';");
                    out.println("</script>");
                    out.flush();
                }else {
                    out.println("<script>");
                    out.println("alert('注册失败!');");
                    out.println("history.back(-1)");
                    out.println("</script>");
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
