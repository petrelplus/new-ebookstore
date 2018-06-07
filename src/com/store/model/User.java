package com.store.model;

import com.store.util.UUidUtil;

public class User {
    private String id;

    private String password;

    private String userName;

    private String realName;

    private String email;

    private String address;

    private String telephone;

    private Integer status;

    private String activationCode;

    public User(String password, String userName, String realName, String email, String address, String telephone) {
        this.id = UUidUtil.getUUid();
        this.password = password;
        this.userName = userName;
        this.realName = realName;
        this.email = email;
        this.address = address;
        this.telephone = telephone;
        this.status = 0;
        this.activationCode = null;
    }

    public User(){

    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getActivationCode() {
        return activationCode;
    }

    public void setActivationCode(String activationCode) {
        this.activationCode = activationCode;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
