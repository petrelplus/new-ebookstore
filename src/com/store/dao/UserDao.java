package com.store.dao;

import com.store.model.User;
import com.store.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    private Connection connection = DBUtil.getConnection();

    public User getUserByName(String name) throws SQLException {
        String sql = "select * from tb_user where username='" + name + "'";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);

        ResultSet resultSet = preparedStatement.executeQuery();

        List<User> users = getResult(resultSet);

        if (users.size() > 0) {
            return users.get(0);
        } else return null;
    }


    public boolean addUser(User user) throws SQLException {
        String sql = "insert into tb_user values (?,?,?,?,?,?,?,?,?)";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setString(1, user.getId());
        preparedStatement.setString(2, user.getUserName());
        preparedStatement.setString(3, user.getPassword());
        preparedStatement.setString(4, user.getRealName());
        preparedStatement.setString(5, user.getEmail());
        preparedStatement.setString(6, user.getAddress());
        preparedStatement.setString(7, user.getTelephone());
        preparedStatement.setInt(8, user.getStatus());
        preparedStatement.setString(9, user.getActivationCode());

        return preparedStatement.executeUpdate() > 0;
    }

    private List<User> getResult(ResultSet resultSet) throws SQLException {
        List<User> users = new ArrayList<>();

        while (resultSet.next()) {
            User user = new User();

            user.setId(resultSet.getString("id"));
            user.setUserName(resultSet.getString("username"));
            user.setPassword(resultSet.getString("password"));
            user.setEmail(resultSet.getString("email"));
            user.setAddress(resultSet.getString("address"));
            user.setRealName(resultSet.getString("real_name"));
            user.setTelephone(resultSet.getString("telephone"));
            user.setStatus(resultSet.getInt("status"));
            user.setActivationCode(resultSet.getString("activation_code"));

            users.add(user);
        }

        return users;
    }

}
