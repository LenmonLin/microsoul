package com.hust.microsoul.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class CollectionModelExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public CollectionModelExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andBuyerCollectionIdIsNull() {
            addCriterion("BUYER_COLLECTION_ID is null");
            return (Criteria) this;
        }

        public Criteria andBuyerCollectionIdIsNotNull() {
            addCriterion("BUYER_COLLECTION_ID is not null");
            return (Criteria) this;
        }

        public Criteria andBuyerCollectionIdEqualTo(Integer value) {
            addCriterion("BUYER_COLLECTION_ID =", value, "buyerCollectionId");
            return (Criteria) this;
        }

        public Criteria andBuyerCollectionIdNotEqualTo(Integer value) {
            addCriterion("BUYER_COLLECTION_ID <>", value, "buyerCollectionId");
            return (Criteria) this;
        }

        public Criteria andBuyerCollectionIdGreaterThan(Integer value) {
            addCriterion("BUYER_COLLECTION_ID >", value, "buyerCollectionId");
            return (Criteria) this;
        }

        public Criteria andBuyerCollectionIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("BUYER_COLLECTION_ID >=", value, "buyerCollectionId");
            return (Criteria) this;
        }

        public Criteria andBuyerCollectionIdLessThan(Integer value) {
            addCriterion("BUYER_COLLECTION_ID <", value, "buyerCollectionId");
            return (Criteria) this;
        }

        public Criteria andBuyerCollectionIdLessThanOrEqualTo(Integer value) {
            addCriterion("BUYER_COLLECTION_ID <=", value, "buyerCollectionId");
            return (Criteria) this;
        }

        public Criteria andBuyerCollectionIdIn(List<Integer> values) {
            addCriterion("BUYER_COLLECTION_ID in", values, "buyerCollectionId");
            return (Criteria) this;
        }

        public Criteria andBuyerCollectionIdNotIn(List<Integer> values) {
            addCriterion("BUYER_COLLECTION_ID not in", values, "buyerCollectionId");
            return (Criteria) this;
        }

        public Criteria andBuyerCollectionIdBetween(Integer value1, Integer value2) {
            addCriterion("BUYER_COLLECTION_ID between", value1, value2, "buyerCollectionId");
            return (Criteria) this;
        }

        public Criteria andBuyerCollectionIdNotBetween(Integer value1, Integer value2) {
            addCriterion("BUYER_COLLECTION_ID not between", value1, value2, "buyerCollectionId");
            return (Criteria) this;
        }

        public Criteria andGoodsCollectionIdIsNull() {
            addCriterion("GOODS_COLLECTION_ID is null");
            return (Criteria) this;
        }

        public Criteria andGoodsCollectionIdIsNotNull() {
            addCriterion("GOODS_COLLECTION_ID is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsCollectionIdEqualTo(Integer value) {
            addCriterion("GOODS_COLLECTION_ID =", value, "goodsCollectionId");
            return (Criteria) this;
        }

        public Criteria andGoodsCollectionIdNotEqualTo(Integer value) {
            addCriterion("GOODS_COLLECTION_ID <>", value, "goodsCollectionId");
            return (Criteria) this;
        }

        public Criteria andGoodsCollectionIdGreaterThan(Integer value) {
            addCriterion("GOODS_COLLECTION_ID >", value, "goodsCollectionId");
            return (Criteria) this;
        }

        public Criteria andGoodsCollectionIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("GOODS_COLLECTION_ID >=", value, "goodsCollectionId");
            return (Criteria) this;
        }

        public Criteria andGoodsCollectionIdLessThan(Integer value) {
            addCriterion("GOODS_COLLECTION_ID <", value, "goodsCollectionId");
            return (Criteria) this;
        }

        public Criteria andGoodsCollectionIdLessThanOrEqualTo(Integer value) {
            addCriterion("GOODS_COLLECTION_ID <=", value, "goodsCollectionId");
            return (Criteria) this;
        }

        public Criteria andGoodsCollectionIdIn(List<Integer> values) {
            addCriterion("GOODS_COLLECTION_ID in", values, "goodsCollectionId");
            return (Criteria) this;
        }

        public Criteria andGoodsCollectionIdNotIn(List<Integer> values) {
            addCriterion("GOODS_COLLECTION_ID not in", values, "goodsCollectionId");
            return (Criteria) this;
        }

        public Criteria andGoodsCollectionIdBetween(Integer value1, Integer value2) {
            addCriterion("GOODS_COLLECTION_ID between", value1, value2, "goodsCollectionId");
            return (Criteria) this;
        }

        public Criteria andGoodsCollectionIdNotBetween(Integer value1, Integer value2) {
            addCriterion("GOODS_COLLECTION_ID not between", value1, value2, "goodsCollectionId");
            return (Criteria) this;
        }

        public Criteria andTimeIsNull() {
            addCriterion("TIME is null");
            return (Criteria) this;
        }

        public Criteria andTimeIsNotNull() {
            addCriterion("TIME is not null");
            return (Criteria) this;
        }

        public Criteria andTimeEqualTo(Date value) {
            addCriterion("TIME =", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeNotEqualTo(Date value) {
            addCriterion("TIME <>", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeGreaterThan(Date value) {
            addCriterion("TIME >", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("TIME >=", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeLessThan(Date value) {
            addCriterion("TIME <", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeLessThanOrEqualTo(Date value) {
            addCriterion("TIME <=", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeIn(List<Date> values) {
            addCriterion("TIME in", values, "time");
            return (Criteria) this;
        }

        public Criteria andTimeNotIn(List<Date> values) {
            addCriterion("TIME not in", values, "time");
            return (Criteria) this;
        }

        public Criteria andTimeBetween(Date value1, Date value2) {
            addCriterion("TIME between", value1, value2, "time");
            return (Criteria) this;
        }

        public Criteria andTimeNotBetween(Date value1, Date value2) {
            addCriterion("TIME not between", value1, value2, "time");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}