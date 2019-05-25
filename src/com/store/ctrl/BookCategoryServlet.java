package com.store.ctrl;

import com.store.model.Book;
import com.store.service.BookService;
import com.store.service.impl.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/bookCategory")
public class BookCategoryServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String categoryId = req.getParameter("categoryId");
        BookService bookService = new BookServiceImpl();

        List<Book> bookList = null;
        try {
            bookList = bookService.getBooksByCategoryId(categoryId);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        req.setAttribute("bookList",bookList);

        req.getRequestDispatcher("bookList.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}