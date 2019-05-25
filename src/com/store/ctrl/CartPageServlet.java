package com.store.ctrl;

import com.store.model.Book;
import com.store.model.Cart;
import com.store.service.CartService;
import com.store.service.impl.CartServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


@WebServlet("/cartPage")
public class CartPageServlet extends HttpServlet {

    CartService cartService = new CartServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");

        List<Book> bookList = new ArrayList<>();
        try {
            bookList = cartService.getCartByUserId(userId);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        req.setAttribute("bookList",bookList);

        req.getRequestDispatcher("cart.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}

