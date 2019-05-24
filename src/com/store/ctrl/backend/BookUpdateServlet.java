package com.store.ctrl.backend;

import com.store.model.Book;
import com.store.service.BookService;
import com.store.service.impl.BookServiceImpl;
import com.store.util.UUidUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/backend/book/update")
public class BookUpdateServlet extends HttpServlet {

    private BookService bookService = new BookServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bookId = req.getParameter("bookId");
        String bookName = req.getParameter("bookName");
        double bookPrice = Double.valueOf(req.getParameter("bookPrice"));
        String bookType = req.getParameter("bookType");
        String bookDescription = req.getParameter("bookDescription");

        Book book = new Book();
        book.setId(bookId);
        book.setName(bookName);
        book.setPrice(bookPrice);
        book.setSecondClassifyId(bookType);
        book.setDescription(bookDescription);

        try {
            bookService.updateBook(book);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
