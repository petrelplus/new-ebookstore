package com.store.service.impl;

import com.store.dao.MessageDao;
import com.store.model.Message;
import com.store.service.MessageService;

import java.sql.SQLException;

public class MessageServiceImpl implements MessageService{
    private MessageDao messageDao;

    public MessageServiceImpl()
    {
        messageDao = new MessageDao();
    }
    @Override
    public boolean addMessage(Message message)throws SQLException  {
        messageDao.addMessage(message);
        return true;
    }

    @Override
    public boolean checkID(Message message)throws SQLException {
        messageDao.checkID(message);
        return true;
    }
}
