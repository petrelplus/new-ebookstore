package com.store.service.impl;

import com.store.dao.CartDao;
import com.store.model.Cart;
import com.store.service.CartService;

import java.sql.SQLException;

public class CartServiceImpl implements CartService {
    private CartDao cartDao = new CartDao();

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
}
