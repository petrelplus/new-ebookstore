package com.store.service.impl;

import com.store.dao.BookDao;
import com.store.model.Book;
import com.store.service.BookService;

import java.sql.SQLException;
import java.util.List;

public class BookServiceImpl implements BookService {

    private BookDao bookDao = new BookDao();

    @Override
    public Book getBookById(String id) throws SQLException {
        return bookDao.getBookById(id);
    }

    @Override
    public List<Book> getAllBooks() throws SQLException {
        return bookDao.getAllBook();
    }

    @Override
    public List<Book> getBooksByName(String bookName) throws SQLException {
        return bookDao.getBooksByName(bookName);
    }

    @Override
    public void deleteBookById(String bookId) throws SQLException {
        bookDao.deleteBookById(bookId);
    }
}
