package com.store.service.impl;

import com.store.dao.BookDao;
import com.store.model.Book;
import com.store.service.BookService;

import java.sql.SQLException;

public class BookServiceImpl implements BookService {
    private BookDao bookDao = new BookDao();

    @Override
    public Book getBookById(String id) throws SQLException {
        return bookDao.getBookById(id);
    }
}
