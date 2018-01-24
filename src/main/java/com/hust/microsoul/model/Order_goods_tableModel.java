package com.hust.microsoul.model;

public class Order_goods_tableModel {
    private Integer orderGoodsId;

    private Integer orderOrderGoodsId;

    private Integer num;

    private Float grade;

    private Integer goodsOrderGoodsId;

    public Integer getOrderGoodsId() {
        return orderGoodsId;
    }

    public void setOrderGoodsId(Integer orderGoodsId) {
        this.orderGoodsId = orderGoodsId;
    }

    public Integer getOrderOrderGoodsId() {
        return orderOrderGoodsId;
    }

    public void setOrderOrderGoodsId(Integer orderOrderGoodsId) {
        this.orderOrderGoodsId = orderOrderGoodsId;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Float getGrade() {
        return grade;
    }

    public void setGrade(Float grade) {
        this.grade = grade;
    }

    public Integer getGoodsOrderGoodsId() {
        return goodsOrderGoodsId;
    }

    public void setGoodsOrderGoodsId(Integer goodsOrderGoodsId) {
        this.goodsOrderGoodsId = goodsOrderGoodsId;
    }
}