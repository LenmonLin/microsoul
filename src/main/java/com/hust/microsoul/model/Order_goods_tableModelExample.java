package com.hust.microsoul.model;

import java.util.ArrayList;
import java.util.List;

public class Order_goods_tableModelExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public Order_goods_tableModelExample() {
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

        public Criteria andOrderGoodsIdIsNull() {
            addCriterion("ORDER_GOODS_ID is null");
            return (Criteria) this;
        }

        public Criteria andOrderGoodsIdIsNotNull() {
            addCriterion("ORDER_GOODS_ID is not null");
            return (Criteria) this;
        }

        public Criteria andOrderGoodsIdEqualTo(Integer value) {
            addCriterion("ORDER_GOODS_ID =", value, "orderGoodsId");
            return (Criteria) this;
        }

        public Criteria andOrderGoodsIdNotEqualTo(Integer value) {
            addCriterion("ORDER_GOODS_ID <>", value, "orderGoodsId");
            return (Criteria) this;
        }

        public Criteria andOrderGoodsIdGreaterThan(Integer value) {
            addCriterion("ORDER_GOODS_ID >", value, "orderGoodsId");
            return (Criteria) this;
        }

        public Criteria andOrderGoodsIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("ORDER_GOODS_ID >=", value, "orderGoodsId");
            return (Criteria) this;
        }

        public Criteria andOrderGoodsIdLessThan(Integer value) {
            addCriterion("ORDER_GOODS_ID <", value, "orderGoodsId");
            return (Criteria) this;
        }

        public Criteria andOrderGoodsIdLessThanOrEqualTo(Integer value) {
            addCriterion("ORDER_GOODS_ID <=", value, "orderGoodsId");
            return (Criteria) this;
        }

        public Criteria andOrderGoodsIdIn(List<Integer> values) {
            addCriterion("ORDER_GOODS_ID in", values, "orderGoodsId");
            return (Criteria) this;
        }

        public Criteria andOrderGoodsIdNotIn(List<Integer> values) {
            addCriterion("ORDER_GOODS_ID not in", values, "orderGoodsId");
            return (Criteria) this;
        }

        public Criteria andOrderGoodsIdBetween(Integer value1, Integer value2) {
            addCriterion("ORDER_GOODS_ID between", value1, value2, "orderGoodsId");
            return (Criteria) this;
        }

        public Criteria andOrderGoodsIdNotBetween(Integer value1, Integer value2) {
            addCriterion("ORDER_GOODS_ID not between", value1, value2, "orderGoodsId");
            return (Criteria) this;
        }

        public Criteria andOrderOrderGoodsIdIsNull() {
            addCriterion("ORDER_ORDER_GOODS_ID is null");
            return (Criteria) this;
        }

        public Criteria andOrderOrderGoodsIdIsNotNull() {
            addCriterion("ORDER_ORDER_GOODS_ID is not null");
            return (Criteria) this;
        }

        public Criteria andOrderOrderGoodsIdEqualTo(Integer value) {
            addCriterion("ORDER_ORDER_GOODS_ID =", value, "orderOrderGoodsId");
            return (Criteria) this;
        }

        public Criteria andOrderOrderGoodsIdNotEqualTo(Integer value) {
            addCriterion("ORDER_ORDER_GOODS_ID <>", value, "orderOrderGoodsId");
            return (Criteria) this;
        }

        public Criteria andOrderOrderGoodsIdGreaterThan(Integer value) {
            addCriterion("ORDER_ORDER_GOODS_ID >", value, "orderOrderGoodsId");
            return (Criteria) this;
        }

        public Criteria andOrderOrderGoodsIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("ORDER_ORDER_GOODS_ID >=", value, "orderOrderGoodsId");
            return (Criteria) this;
        }

        public Criteria andOrderOrderGoodsIdLessThan(Integer value) {
            addCriterion("ORDER_ORDER_GOODS_ID <", value, "orderOrderGoodsId");
            return (Criteria) this;
        }

        public Criteria andOrderOrderGoodsIdLessThanOrEqualTo(Integer value) {
            addCriterion("ORDER_ORDER_GOODS_ID <=", value, "orderOrderGoodsId");
            return (Criteria) this;
        }

        public Criteria andOrderOrderGoodsIdIn(List<Integer> values) {
            addCriterion("ORDER_ORDER_GOODS_ID in", values, "orderOrderGoodsId");
            return (Criteria) this;
        }

        public Criteria andOrderOrderGoodsIdNotIn(List<Integer> values) {
            addCriterion("ORDER_ORDER_GOODS_ID not in", values, "orderOrderGoodsId");
            return (Criteria) this;
        }

        public Criteria andOrderOrderGoodsIdBetween(Integer value1, Integer value2) {
            addCriterion("ORDER_ORDER_GOODS_ID between", value1, value2, "orderOrderGoodsId");
            return (Criteria) this;
        }

        public Criteria andOrderOrderGoodsIdNotBetween(Integer value1, Integer value2) {
            addCriterion("ORDER_ORDER_GOODS_ID not between", value1, value2, "orderOrderGoodsId");
            return (Criteria) this;
        }

        public Criteria andNumIsNull() {
            addCriterion("NUM is null");
            return (Criteria) this;
        }

        public Criteria andNumIsNotNull() {
            addCriterion("NUM is not null");
            return (Criteria) this;
        }

        public Criteria andNumEqualTo(Integer value) {
            addCriterion("NUM =", value, "num");
            return (Criteria) this;
        }

        public Criteria andNumNotEqualTo(Integer value) {
            addCriterion("NUM <>", value, "num");
            return (Criteria) this;
        }

        public Criteria andNumGreaterThan(Integer value) {
            addCriterion("NUM >", value, "num");
            return (Criteria) this;
        }

        public Criteria andNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("NUM >=", value, "num");
            return (Criteria) this;
        }

        public Criteria andNumLessThan(Integer value) {
            addCriterion("NUM <", value, "num");
            return (Criteria) this;
        }

        public Criteria andNumLessThanOrEqualTo(Integer value) {
            addCriterion("NUM <=", value, "num");
            return (Criteria) this;
        }

        public Criteria andNumIn(List<Integer> values) {
            addCriterion("NUM in", values, "num");
            return (Criteria) this;
        }

        public Criteria andNumNotIn(List<Integer> values) {
            addCriterion("NUM not in", values, "num");
            return (Criteria) this;
        }

        public Criteria andNumBetween(Integer value1, Integer value2) {
            addCriterion("NUM between", value1, value2, "num");
            return (Criteria) this;
        }

        public Criteria andNumNotBetween(Integer value1, Integer value2) {
            addCriterion("NUM not between", value1, value2, "num");
            return (Criteria) this;
        }

        public Criteria andGradeIsNull() {
            addCriterion("GRADE is null");
            return (Criteria) this;
        }

        public Criteria andGradeIsNotNull() {
            addCriterion("GRADE is not null");
            return (Criteria) this;
        }

        public Criteria andGradeEqualTo(Float value) {
            addCriterion("GRADE =", value, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeNotEqualTo(Float value) {
            addCriterion("GRADE <>", value, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeGreaterThan(Float value) {
            addCriterion("GRADE >", value, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeGreaterThanOrEqualTo(Float value) {
            addCriterion("GRADE >=", value, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeLessThan(Float value) {
            addCriterion("GRADE <", value, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeLessThanOrEqualTo(Float value) {
            addCriterion("GRADE <=", value, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeIn(List<Float> values) {
            addCriterion("GRADE in", values, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeNotIn(List<Float> values) {
            addCriterion("GRADE not in", values, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeBetween(Float value1, Float value2) {
            addCriterion("GRADE between", value1, value2, "grade");
            return (Criteria) this;
        }

        public Criteria andGradeNotBetween(Float value1, Float value2) {
            addCriterion("GRADE not between", value1, value2, "grade");
            return (Criteria) this;
        }

        public Criteria andGoodsOrderGoodsIdIsNull() {
            addCriterion("GOODS_ORDER_GOODS_ID is null");
            return (Criteria) this;
        }

        public Criteria andGoodsOrderGoodsIdIsNotNull() {
            addCriterion("GOODS_ORDER_GOODS_ID is not null");
            return (Criteria) this;
        }

        public Criteria andGoodsOrderGoodsIdEqualTo(Integer value) {
            addCriterion("GOODS_ORDER_GOODS_ID =", value, "goodsOrderGoodsId");
            return (Criteria) this;
        }

        public Criteria andGoodsOrderGoodsIdNotEqualTo(Integer value) {
            addCriterion("GOODS_ORDER_GOODS_ID <>", value, "goodsOrderGoodsId");
            return (Criteria) this;
        }

        public Criteria andGoodsOrderGoodsIdGreaterThan(Integer value) {
            addCriterion("GOODS_ORDER_GOODS_ID >", value, "goodsOrderGoodsId");
            return (Criteria) this;
        }

        public Criteria andGoodsOrderGoodsIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("GOODS_ORDER_GOODS_ID >=", value, "goodsOrderGoodsId");
            return (Criteria) this;
        }

        public Criteria andGoodsOrderGoodsIdLessThan(Integer value) {
            addCriterion("GOODS_ORDER_GOODS_ID <", value, "goodsOrderGoodsId");
            return (Criteria) this;
        }

        public Criteria andGoodsOrderGoodsIdLessThanOrEqualTo(Integer value) {
            addCriterion("GOODS_ORDER_GOODS_ID <=", value, "goodsOrderGoodsId");
            return (Criteria) this;
        }

        public Criteria andGoodsOrderGoodsIdIn(List<Integer> values) {
            addCriterion("GOODS_ORDER_GOODS_ID in", values, "goodsOrderGoodsId");
            return (Criteria) this;
        }

        public Criteria andGoodsOrderGoodsIdNotIn(List<Integer> values) {
            addCriterion("GOODS_ORDER_GOODS_ID not in", values, "goodsOrderGoodsId");
            return (Criteria) this;
        }

        public Criteria andGoodsOrderGoodsIdBetween(Integer value1, Integer value2) {
            addCriterion("GOODS_ORDER_GOODS_ID between", value1, value2, "goodsOrderGoodsId");
            return (Criteria) this;
        }

        public Criteria andGoodsOrderGoodsIdNotBetween(Integer value1, Integer value2) {
            addCriterion("GOODS_ORDER_GOODS_ID not between", value1, value2, "goodsOrderGoodsId");
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