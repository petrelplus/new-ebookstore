package com.store.service;

import com.store.model.Book;
import com.store.model.Cart;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

public interface CartService {

    boolean addCart(Cart cart) throws SQLException;

    Cart getCartByBookIdAndUserId(String bookId, String userId) throws SQLException;

    boolean updateNumber(String cartId, int nNumber) throws SQLException;

    HashMap<Book,Integer> getBooksById(String userId) throws SQLException;

    List<Book> getCartByUserId(String userId) throws SQLException;
}
