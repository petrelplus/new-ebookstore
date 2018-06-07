package com.store.service;

import com.store.model.User;

import java.sql.SQLException;

public interface UserService {

    boolean checkUser(String userName, String password) throws SQLException;

    Object getUserByName(String userName) throws SQLException;

    boolean checkUserName(String userName) throws SQLException;

    boolean regiaterUser(User user) throws SQLException;
}
