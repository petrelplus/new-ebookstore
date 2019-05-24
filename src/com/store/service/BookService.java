package com.store.service;

import com.store.model.Book;

import java.sql.SQLException;
import java.util.List;

public interface BookService {

    Book getBookById(String id) throws SQLException;

    List<Book> getAllBooks() throws SQLException;

    List<Book> getBooksByName(String bookName) throws SQLException;

    void deleteBookById(String bookId) throws SQLException;

    void addBook(Book book) throws SQLException;

    void updateBook(Book book) throws SQLException;
}
