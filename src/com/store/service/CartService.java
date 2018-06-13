package com.store.service;

import com.store.model.Cart;

import java.sql.SQLException;

public interface CartService {

    boolean addCart(Cart cart) throws SQLException;

    Cart getCartByBookIdAndUserId(String bookId, String userId) throws SQLException;

    boolean updateNumber(String cartId, int nNumber) throws SQLException;
}
