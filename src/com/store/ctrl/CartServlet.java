package com.store.ctrl;

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

@WebServlet("/addCart")
public class CartServlet extends HttpServlet {

    CartService cartService = new CartServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");
        String bookId = req.getParameter("bookId");
        int number = Integer.parseInt(req.getParameter("bookNumber"));

        Cart cart = null;
        try {
            cart = cartService.getCartByBookIdAndUserId(bookId, userId);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (cart == null) {
            Cart newCart = new Cart(userId, bookId, number);
            try {
                cartService.addCart(newCart);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else {
            boolean result = false;
            try {
                result = cartService.updateNumber(cart.getId(), cart.getBookNumber() + number);
            } catch (SQLException e) {
                e.printStackTrace();
            }
            if (!result) {
                resp.setContentType("text/html");
                resp.setCharacterEncoding("utf-8");
                PrintWriter out = resp.getWriter();
                out.println("加入购物车失败！");
                out.flush();
                out.close();
            }
        }

        resp.setContentType("text/html");
        resp.setCharacterEncoding("utf-8");
        PrintWriter out = resp.getWriter();
        out.println("加入购物车成功！");
        out.flush();
        out.close();
    }
}
