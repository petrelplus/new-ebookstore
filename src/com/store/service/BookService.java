package com.store.service;

import com.store.model.Book;

import java.sql.SQLException;

public interface BookService {
    Book getBookById(String id) throws SQLException;
}
