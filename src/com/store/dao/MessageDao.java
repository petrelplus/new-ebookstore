package com.store.dao;

import com.store.model.Cart;
import com.store.model.Message;
import com.store.util.DBUtil;
import com.store.util.UUidUtil;

import java.sql.*;
import java.util.UUID;

public class MessageDao {
    private Connection connection;
    public MessageDao()
    {
        connection = DBUtil.getConnection();
    }
    public boolean addMessage(Message message) throws SQLException {
        String sql = "insert into tb_message values (?, ?, ?, ?, ?, ?)";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, message.getMessageID());
        preparedStatement.setString(2, message.getName());
        preparedStatement.setString(3, message.getEmail());
        preparedStatement.setString(4, message.getType());
        preparedStatement.setString(5, message.getText());
        preparedStatement.setDate(6, new Date(message.getDate().getTime()));
        return preparedStatement.executeUpdate() > 0;
    }
    public boolean checkID(Message message)throws SQLException
    {
        Statement statement = connection.createStatement();
        ResultSet resultSet =statement.executeQuery("SELECT * FROM tb_message WHERE message_id =\""+message.getMessageID() + "\"");
        while (resultSet.wasNull())
        {
            message.setMessageID(UUidUtil.getUUid());
            resultSet =statement.executeQuery("SELECT * FROM tb_message WHERE message_id =\""+message.getMessageID() + "\"");
        }
        return true;
    }

}
