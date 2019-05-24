package com.store.ctrl.backend;

import com.store.model.Book;
import com.store.model.User;
import com.store.service.BookService;
import com.store.service.UserService;
import com.store.service.impl.BookServiceImpl;
import com.store.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/backend/index")
public class IndexServlet extends HttpServlet {

    private BookService bookService = new BookServiceImpl();

    private UserService userService = new UserServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("后台管理页面");
        try {
            List<Book> bookList = bookService.getAllBooks();
            List<User> userList = userService.getAllUsers();

            req.setAttribute("bookNum", bookList.size());
            req.setAttribute("userNum", userList.size());
        } catch (Exception e) {
            e.printStackTrace();
        }

        req.getRequestDispatcher("/backend/index.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
