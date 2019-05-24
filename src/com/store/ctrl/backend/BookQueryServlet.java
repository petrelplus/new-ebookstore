package com.store.ctrl.backend;

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

@WebServlet("/backend/book/query")
public class BookQueryServlet extends HttpServlet {

    private BookService bookService = new BookServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bookName = req.getParameter("bookName");
        System.out.println(bookName);

        try {
            List<Book> bookList = bookService.getBooksByName(bookName);
            req.setAttribute("bookList", bookList);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        req.getRequestDispatcher("/backend/book/itemList.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
