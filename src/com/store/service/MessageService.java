package com.store.service;

import com.store.model.Message;

import java.sql.SQLException;

public interface MessageService {
    boolean addMessage(Message message)throws SQLException;
    boolean checkID(Message message)throws SQLException ;
}
