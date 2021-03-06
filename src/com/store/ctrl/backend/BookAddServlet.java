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

@WebServlet("/backend/book/add")
public class BookAddServlet extends HttpServlet {

    private BookService bookService = new BookServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String bookName = req.getParameter("bookName");
        double bookPrice = Double.valueOf(req.getParameter("bookPrice"));
        String bookType = req.getParameter("bookType");
        String bookDescription = req.getParameter("bookDescription");

        Book book = new Book();
        book.setName(bookName);
        book.setId(UUidUtil.getUUid());
        book.setPrice(bookPrice);
        book.setSecondClassifyId(bookType);
        book.setDescription(bookDescription);

        try {
            bookService.addBook(book);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
