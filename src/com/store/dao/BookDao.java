package com.store.dao;

import com.store.model.Book;
import com.store.util.DBUtil;
import javafx.scene.control.ButtonBar;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookDao {
    private Connection connection = DBUtil.getConnection();

    public List<Book> getAllBook() throws SQLException {
        String sql = "select * from tb_book";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);

        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet == null) {
            return null;
        } else {
            return getResult(resultSet);
        }
    }

    public List<Book> getMiaoShaBooks() throws SQLException {
        String sql = "select * from tb_book where second_classify_id= 2 ";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);

        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet == null) {
            return null;
        } else {
            return getResult(resultSet);
        }
    }

    public Book getBookById(String id) throws SQLException {
        String sql = "select * from tb_book where id=" + id;
        PreparedStatement preparedStatement = connection.prepareStatement(sql);

        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet == null) {
            return null;
        } else {
            return getResult(resultSet).get(0);
        }
    }

    private List<Book> getResult(ResultSet resultSet) throws SQLException {
        List<Book> books = new ArrayList<>();

        while (resultSet.next()) {
            Book book = new Book();

            book.setId(resultSet.getString("id"));
            book.setName(resultSet.getString("name"));
            book.setPrice(resultSet.getDouble("price"));
            book.setDescription(resultSet.getString("description"));
            book.setImgPath(resultSet.getString("img_path"));
            book.setSecondClassifyId(resultSet.getString("second_classify_id"));
            book.setAuthor(resultSet.getString("author"));

            books.add(book);
        }

        return books;
    }


    public List<Book> getBooksByName(String bookName) throws SQLException {
        String sql = "select * from tb_book where name like \"%" + bookName + "%\"";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet == null) {
            return null;
        } else {
            return getResult(resultSet);
        }
    }

    public void deleteBookById(String bookId) throws SQLException {
        String sql = "delete from tb_book where id = ?";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, bookId);
        preparedStatement.executeUpdate();
    }

    public void insertBook(Book book) throws SQLException {
        String sql = "insert into tb_book (id,name,price,description,second_classify_id, author) values (?,?,?,?,?,?)";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, book.getId());
        preparedStatement.setString(2, book.getName());
        preparedStatement.setDouble(3, book.getPrice());
        preparedStatement.setString(4, book.getDescription());
        preparedStatement.setString(5, book.getSecondClassifyId());
        preparedStatement.setString(6, book.getAuthor());
        preparedStatement.executeUpdate();
    }

    public void updateBook(Book book) throws SQLException {
        String sql = "update tb_book set name=?, price=?, description=?, second_classify_id=?, author=? where id=?";

        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, book.getName());
        preparedStatement.setDouble(2, book.getPrice());
        preparedStatement.setString(3, book.getDescription());
        preparedStatement.setString(4, book.getSecondClassifyId());
        preparedStatement.setString(5, book.getId());
        preparedStatement.setString(6, book.getAuthor());

        preparedStatement.executeUpdate();
    }
}
