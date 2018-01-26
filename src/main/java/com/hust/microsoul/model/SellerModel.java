package com.hust.microsoul.model;

public class SellerModel {
    private Integer idSeller;

    private String accountName;

    private String password;

    private String zhifubaoAccount;

    private String email;

    private Integer qqAccount;

    private String district;

    private String realName;

    private String address;

    private Integer telephone;

    private Integer state;

    private Integer orderSellerId;

    public Integer getIdSeller() {
        return idSeller;
    }

    public void setIdSeller(Integer idSeller) {
        this.idSeller = idSeller;
    }

    public String getAccountName() {
        return accountName;
    }

    public void setAccountName(String accountName) {
        this.accountName = accountName == null ? null : accountName.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getZhifubaoAccount() {
        return zhifubaoAccount;
    }

    public void setZhifubaoAccount(String zhifubaoAccount) {
        this.zhifubaoAccount = zhifubaoAccount == null ? null : zhifubaoAccount.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getQqAccount() {
        return qqAccount;
    }

    public void setQqAccount(Integer qqAccount) {
        this.qqAccount = qqAccount;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district == null ? null : district.trim();
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName == null ? null : realName.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public Integer getTelephone() {
        return telephone;
    }

    public void setTelephone(Integer telephone) {
        this.telephone = telephone;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getOrderSellerId() {
        return orderSellerId;
    }

    public void setOrderSellerId(Integer orderSellerId) {
        this.orderSellerId = orderSellerId;
    }

    @Override
    public String toString() {
        return "SellerModel{" +
                "idSeller=" + idSeller +
                ", accountName='" + accountName + '\'' +
                ", password='" + password + '\'' +
                ", zhifubaoAccount='" + zhifubaoAccount + '\'' +
                ", email='" + email + '\'' +
                ", qqAccount=" + qqAccount +
                ", district='" + district + '\'' +
                ", realName='" + realName + '\'' +
                ", address='" + address + '\'' +
                ", telephone=" + telephone +
                ", state=" + state +
                ", orderSellerId=" + orderSellerId +
                '}';
    }
}