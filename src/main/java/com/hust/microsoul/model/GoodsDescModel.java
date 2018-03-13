package com.hust.microsoul.model;

import java.util.Date;

public class GoodsDescModel {
    private Integer goodDescId;

    private Integer goodId;

    private Date created;

    private Date updated;

    private String goodDesc;

    public Integer getGoodDescId() {
        return goodDescId;
    }

    public void setGoodDescId(Integer goodDescId) {
        this.goodDescId = goodDescId;
    }

    public Integer getGoodId() {
        return goodId;
    }

    public void setGoodId(Integer goodId) {
        this.goodId = goodId;
    }

    public Date getCreated() {
        return created;
    }

    public void setCreated(Date created) {
        this.created = created;
    }

    public Date getUpdated() {
        return updated;
    }

    public void setUpdated(Date updated) {
        this.updated = updated;
    }

    public String getGoodDesc() {
        return goodDesc;
    }

    public void setGoodDesc(String goodDesc) {
        this.goodDesc = goodDesc == null ? null : goodDesc.trim();
    }
}