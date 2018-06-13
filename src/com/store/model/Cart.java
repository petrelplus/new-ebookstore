package com.store.model;

import com.store.util.UUidUtil;

public class Cart {
    private String id;

    private String userId;

    private String bookId;

    private Integer bookNumber;

    public Cart(String userId, String bookId, Integer bookNumber) {
        this.id = UUidUtil.getUUid();
        this.userId = userId;
        this.bookId = bookId;
        this.bookNumber = bookNumber;
    }

    public Cart(String id, String userId, String bookId, Integer bookNumber) {
        this.id = id;
        this.userId = userId;
        this.bookId = bookId;
        this.bookNumber = bookNumber;
    }

    public Cart(){

    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getBookId() {
        return bookId;
    }

    public void setBookId(String bookId) {
        this.bookId = bookId;
    }

    public Integer getBookNumber() {
        return bookNumber;
    }

    public void setBookNumber(Integer bookNumber) {
        this.bookNumber = bookNumber;
    }
}
