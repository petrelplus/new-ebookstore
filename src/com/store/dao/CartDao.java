package com.store.dao;

import com.store.model.Cart;
import com.store.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CartDao {
    private Connection connection = DBUtil.getConnection();

    public boolean addCart(Cart cart) throws SQLException {
        String sql = "insert into tb_cart values (?, ?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setString(1, cart.getId());
        preparedStatement.setString(2, cart.getBookId());
        preparedStatement.setString(3, cart.getUserId());
        preparedStatement.setInt(4, cart.getBookNumber());

        return preparedStatement.executeUpdate() > 0;
    }

    public Cart getCartByBookIdAndUserId(String bookId, String userId) throws SQLException {
        String sql = "select * from tb_cart where book_id = ? and user_id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, bookId);
        preparedStatement.setString(2, userId);

        ResultSet resultSet = preparedStatement.executeQuery();
        if (resultSet == null) {
            return null;
        } else {
            List<Cart> carts = getResult(resultSet);
            if (carts.size() == 0) {
                return null;
            } else {
                return carts.get(0);
            }
        }
    }

    private List<Cart> getResult(ResultSet resultSet) throws SQLException {
        List<Cart> carts = new ArrayList<>();

        while (resultSet.next()) {
            String id = resultSet.getString("id");
            String bookId = resultSet.getString("book_id");
            String userId = resultSet.getString("user_id");
            int number = resultSet.getInt("book_number");
            Cart cart = new Cart(id, userId, bookId, number);

            carts.add(cart);
        }

        return carts;
    }

    public boolean updatebookNumber(String cartId, int nNumber) throws SQLException {
        String sql = "UPDATE tb_cart set book_number = ? where id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setInt(1, nNumber);
        preparedStatement.setString(2, cartId);

        return preparedStatement.executeUpdate() > 0;
    }
}
