package com.store.ctrl;

import com.store.model.Message;
import com.store.service.MessageService;
import com.store.service.impl.MessageServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

public class MessageServlet  extends HttpServlet{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setCharacterEncoding("utf-8");
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        String email = req.getParameter("email");
        String name = req.getParameter("name");
        if(name == null)
            name = "匿名";
        String type = req.getParameter("type");
        String text = req.getParameter("text");
        if(text.length() > 255)
        {
            out.println("<script>");
            out.println("alert('留言内容太长啦！')");
            out.println("history.back(-1)");
            out.println("</script>");
            return;
        }
        else {
            Message message = new Message();
            message.setName(name);
            message.setEmail(email);
            message.setType(type);
            message.setText(text);
            MessageService service = new MessageServiceImpl();
            try {
                Boolean result = service.checkID(message);
                if(result)
                {
                    result = service.addMessage(message);
                }
                else {
                    throw new Exception("ID 重复，无法修改");
                }
                if(!result)
                {
                    throw new Exception("插入失败");
                }
            }
            catch (Exception se)
            {
                se.printStackTrace();
                out.println("<script>");
                out.println("alert('留言失败！')");
                out.println("history.back(-1)");
                out.println("</script>");
                return;
            }
            out.println("<script>");
            out.println("alert('留言成功！会尽快联系您哒！再次谢谢您的支持！')");
            out.println("history.back(-1)");
            out.println("</script>");
        }
    }
}
