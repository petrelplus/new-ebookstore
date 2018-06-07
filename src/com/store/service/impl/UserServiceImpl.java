package com.store.service.impl;

import com.store.dao.UserDao;
import com.store.model.User;
import com.store.service.UserService;

import java.sql.SQLException;

public class UserServiceImpl implements UserService {

    private UserDao userDao = new UserDao();

    @Override
    public boolean checkUser(String userName, String password) throws SQLException {
        User user = userDao.getUserByName(userName);

        if (user == null) {
            return false;
        } else if (!user.getPassword().equals(password)) {
            return false;
        } else {
            return true;
        }
    }

    @Override
    public Object getUserByName(String userName) throws SQLException {
        return userDao.getUserByName(userName);
    }

    @Override
    public boolean checkUserName(String userName) throws SQLException {
        User user = userDao.getUserByName(userName);

        if(user != null){
            return false;
        }else return true;
    }

    @Override
    public boolean regiaterUser(User user) throws SQLException {
        return userDao.addUser(user);
    }
}
