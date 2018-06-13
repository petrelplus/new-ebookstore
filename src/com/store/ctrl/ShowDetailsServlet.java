package com.store.ctrl;

import com.store.model.Book;
import com.store.service.BookService;
import com.store.service.impl.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class ShowDetailsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");

        BookService bookService = new BookServiceImpl();

        Book book = null;
        try {
            book = bookService.getBookById(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        req.setAttribute("book",book);

        req.getRequestDispatcher("bookInfo.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
