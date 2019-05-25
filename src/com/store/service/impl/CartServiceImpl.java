package com.store.service.impl;

import com.store.dao.BookDao;
import com.store.dao.CartDao;
import com.store.model.Book;
import com.store.model.Cart;
import com.store.service.CartService;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class CartServiceImpl implements CartService {
    private CartDao cartDao = new CartDao();
    private BookDao bookDao = new BookDao();

    @Override
    public boolean addCart(Cart cart) throws SQLException {
        if (cart == null) {
            System.out.println("购物车为null");
            return false;
        }
        return cartDao.addCart(cart);
    }

    @Override
    public Cart getCartByBookIdAndUserId(String bookId, String userId) throws SQLException {
        return cartDao.getCartByBookIdAndUserId(bookId, userId);
    }

    @Override
    public boolean updateNumber(String cartId,int nNumber) throws SQLException {
        return cartDao.updatebookNumber(cartId,nNumber);
    }

    @Override
    public HashMap<Book,Integer> getBooksById(String userId) throws SQLException{
        return cartDao.getBooksById(userId);
    }

    @Override
    public List<Book> getCartByUserId(String userId) throws SQLException{
        List<Cart> cartList = cartDao.getCartByUserId(userId);
        List<Book> bookList = new ArrayList<>();
        for(Cart cart : cartList){
            String bookId = cart.getBookId();
            bookList.add(bookDao.getBookById(bookId));
        }
        return bookList;
    }
}
