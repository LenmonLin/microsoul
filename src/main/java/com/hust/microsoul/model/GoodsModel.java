package com.hust.microsoul.model;

public class GoodsModel {
    private Integer goodsId;

    private String detail;

    private String imageUrl;

    private String category;

    private Integer store;

    private Integer unitPrice;

    private String goodsName;

    private Integer discount;

    private Integer purchaseQuantity;

    private Integer collectionGoodsId;

    private Integer sellerGoodsId;

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail == null ? null : detail.trim();
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl == null ? null : imageUrl.trim();
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category == null ? null : category.trim();
    }

    public Integer getStore() {
        return store;
    }

    public void setStore(Integer store) {
        this.store = store;
    }

    public Integer getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Integer unitPrice) {
        this.unitPrice = unitPrice;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public Integer getDiscount() {
        return discount;
    }

    public void setDiscount(Integer discount) {
        this.discount = discount;
    }

    public Integer getPurchaseQuantity() {
        return purchaseQuantity;
    }

    public void setPurchaseQuantity(Integer purchaseQuantity) {
        this.purchaseQuantity = purchaseQuantity;
    }

    public Integer getCollectionGoodsId() {
        return collectionGoodsId;
    }

    public void setCollectionGoodsId(Integer collectionGoodsId) {
        this.collectionGoodsId = collectionGoodsId;
    }

    public Integer getSellerGoodsId() {
        return sellerGoodsId;
    }

    public void setSellerGoodsId(Integer sellerGoodsId) {
        this.sellerGoodsId = sellerGoodsId;
    }
}