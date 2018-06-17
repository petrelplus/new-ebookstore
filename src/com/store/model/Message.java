package com.store.model;

import com.store.util.UUidUtil;

import java.util.Date;
import java.util.UUID;

public class Message {
    private String messageID;
    private Date date;
    private String name;
    private String email;
    private String Type;
    private String text;

    public Message()
    {
        messageID = UUidUtil.getUUid();
        date = new Date();
    }
    public String getMessageID() {
        return messageID;
    }

    public String getEmail() {
        return email;
    }

    public String getName() {
        return name;
    }

    public String getText() {
        return text;
    }

    public String getType() {
        return Type;
    }

    public Date getDate() {
        return date;
    }

    public void setMessageID(String messageID) {
        this.messageID = messageID;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setText(String text) {
        this.text = text;
    }

    public void setType(String type) {
        Type = type;
    }

}
