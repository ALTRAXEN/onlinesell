package com.shu.onlinesell.bean;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserInfoExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table user_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table user_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table user_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    public UserInfoExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table user_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table user_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
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

        public Criteria andUserIdIsNull() {
            addCriterion("user_id is null");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNotNull() {
            addCriterion("user_id is not null");
            return (Criteria) this;
        }

        public Criteria andUserIdEqualTo(String value) {
            addCriterion("user_id =", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotEqualTo(String value) {
            addCriterion("user_id <>", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThan(String value) {
            addCriterion("user_id >", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThanOrEqualTo(String value) {
            addCriterion("user_id >=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThan(String value) {
            addCriterion("user_id <", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThanOrEqualTo(String value) {
            addCriterion("user_id <=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLike(String value) {
            addCriterion("user_id like", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotLike(String value) {
            addCriterion("user_id not like", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdIn(List<String> values) {
            addCriterion("user_id in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotIn(List<String> values) {
            addCriterion("user_id not in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdBetween(String value1, String value2) {
            addCriterion("user_id between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotBetween(String value1, String value2) {
            addCriterion("user_id not between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserNameIsNull() {
            addCriterion("user_name is null");
            return (Criteria) this;
        }

        public Criteria andUserNameIsNotNull() {
            addCriterion("user_name is not null");
            return (Criteria) this;
        }

        public Criteria andUserNameEqualTo(String value) {
            addCriterion("user_name =", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameNotEqualTo(String value) {
            addCriterion("user_name <>", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameGreaterThan(String value) {
            addCriterion("user_name >", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameGreaterThanOrEqualTo(String value) {
            addCriterion("user_name >=", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameLessThan(String value) {
            addCriterion("user_name <", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameLessThanOrEqualTo(String value) {
            addCriterion("user_name <=", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameLike(String value) {
            addCriterion("user_name like", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameNotLike(String value) {
            addCriterion("user_name not like", value, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameIn(List<String> values) {
            addCriterion("user_name in", values, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameNotIn(List<String> values) {
            addCriterion("user_name not in", values, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameBetween(String value1, String value2) {
            addCriterion("user_name between", value1, value2, "userName");
            return (Criteria) this;
        }

        public Criteria andUserNameNotBetween(String value1, String value2) {
            addCriterion("user_name not between", value1, value2, "userName");
            return (Criteria) this;
        }

        public Criteria andUserPhoneIsNull() {
            addCriterion("user_phone is null");
            return (Criteria) this;
        }

        public Criteria andUserPhoneIsNotNull() {
            addCriterion("user_phone is not null");
            return (Criteria) this;
        }

        public Criteria andUserPhoneEqualTo(String value) {
            addCriterion("user_phone =", value, "userPhone");
            return (Criteria) this;
        }

        public Criteria andUserPhoneNotEqualTo(String value) {
            addCriterion("user_phone <>", value, "userPhone");
            return (Criteria) this;
        }

        public Criteria andUserPhoneGreaterThan(String value) {
            addCriterion("user_phone >", value, "userPhone");
            return (Criteria) this;
        }

        public Criteria andUserPhoneGreaterThanOrEqualTo(String value) {
            addCriterion("user_phone >=", value, "userPhone");
            return (Criteria) this;
        }

        public Criteria andUserPhoneLessThan(String value) {
            addCriterion("user_phone <", value, "userPhone");
            return (Criteria) this;
        }

        public Criteria andUserPhoneLessThanOrEqualTo(String value) {
            addCriterion("user_phone <=", value, "userPhone");
            return (Criteria) this;
        }

        public Criteria andUserPhoneLike(String value) {
            addCriterion("user_phone like", value, "userPhone");
            return (Criteria) this;
        }

        public Criteria andUserPhoneNotLike(String value) {
            addCriterion("user_phone not like", value, "userPhone");
            return (Criteria) this;
        }

        public Criteria andUserPhoneIn(List<String> values) {
            addCriterion("user_phone in", values, "userPhone");
            return (Criteria) this;
        }

        public Criteria andUserPhoneNotIn(List<String> values) {
            addCriterion("user_phone not in", values, "userPhone");
            return (Criteria) this;
        }

        public Criteria andUserPhoneBetween(String value1, String value2) {
            addCriterion("user_phone between", value1, value2, "userPhone");
            return (Criteria) this;
        }

        public Criteria andUserPhoneNotBetween(String value1, String value2) {
            addCriterion("user_phone not between", value1, value2, "userPhone");
            return (Criteria) this;
        }

        public Criteria andUserEmailIsNull() {
            addCriterion("user_email is null");
            return (Criteria) this;
        }

        public Criteria andUserEmailIsNotNull() {
            addCriterion("user_email is not null");
            return (Criteria) this;
        }

        public Criteria andUserEmailEqualTo(String value) {
            addCriterion("user_email =", value, "userEmail");
            return (Criteria) this;
        }

        public Criteria andUserEmailNotEqualTo(String value) {
            addCriterion("user_email <>", value, "userEmail");
            return (Criteria) this;
        }

        public Criteria andUserEmailGreaterThan(String value) {
            addCriterion("user_email >", value, "userEmail");
            return (Criteria) this;
        }

        public Criteria andUserEmailGreaterThanOrEqualTo(String value) {
            addCriterion("user_email >=", value, "userEmail");
            return (Criteria) this;
        }

        public Criteria andUserEmailLessThan(String value) {
            addCriterion("user_email <", value, "userEmail");
            return (Criteria) this;
        }

        public Criteria andUserEmailLessThanOrEqualTo(String value) {
            addCriterion("user_email <=", value, "userEmail");
            return (Criteria) this;
        }

        public Criteria andUserEmailLike(String value) {
            addCriterion("user_email like", value, "userEmail");
            return (Criteria) this;
        }

        public Criteria andUserEmailNotLike(String value) {
            addCriterion("user_email not like", value, "userEmail");
            return (Criteria) this;
        }

        public Criteria andUserEmailIn(List<String> values) {
            addCriterion("user_email in", values, "userEmail");
            return (Criteria) this;
        }

        public Criteria andUserEmailNotIn(List<String> values) {
            addCriterion("user_email not in", values, "userEmail");
            return (Criteria) this;
        }

        public Criteria andUserEmailBetween(String value1, String value2) {
            addCriterion("user_email between", value1, value2, "userEmail");
            return (Criteria) this;
        }

        public Criteria andUserEmailNotBetween(String value1, String value2) {
            addCriterion("user_email not between", value1, value2, "userEmail");
            return (Criteria) this;
        }

        public Criteria andPasswordIsNull() {
            addCriterion("password is null");
            return (Criteria) this;
        }

        public Criteria andPasswordIsNotNull() {
            addCriterion("password is not null");
            return (Criteria) this;
        }

        public Criteria andPasswordEqualTo(String value) {
            addCriterion("password =", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotEqualTo(String value) {
            addCriterion("password <>", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordGreaterThan(String value) {
            addCriterion("password >", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordGreaterThanOrEqualTo(String value) {
            addCriterion("password >=", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLessThan(String value) {
            addCriterion("password <", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLessThanOrEqualTo(String value) {
            addCriterion("password <=", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordLike(String value) {
            addCriterion("password like", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotLike(String value) {
            addCriterion("password not like", value, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordIn(List<String> values) {
            addCriterion("password in", values, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotIn(List<String> values) {
            addCriterion("password not in", values, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordBetween(String value1, String value2) {
            addCriterion("password between", value1, value2, "password");
            return (Criteria) this;
        }

        public Criteria andPasswordNotBetween(String value1, String value2) {
            addCriterion("password not between", value1, value2, "password");
            return (Criteria) this;
        }

        public Criteria andUserRankIsNull() {
            addCriterion("user_rank is null");
            return (Criteria) this;
        }

        public Criteria andUserRankIsNotNull() {
            addCriterion("user_rank is not null");
            return (Criteria) this;
        }

        public Criteria andUserRankEqualTo(Byte value) {
            addCriterion("user_rank =", value, "userRank");
            return (Criteria) this;
        }

        public Criteria andUserRankNotEqualTo(Byte value) {
            addCriterion("user_rank <>", value, "userRank");
            return (Criteria) this;
        }

        public Criteria andUserRankGreaterThan(Byte value) {
            addCriterion("user_rank >", value, "userRank");
            return (Criteria) this;
        }

        public Criteria andUserRankGreaterThanOrEqualTo(Byte value) {
            addCriterion("user_rank >=", value, "userRank");
            return (Criteria) this;
        }

        public Criteria andUserRankLessThan(Byte value) {
            addCriterion("user_rank <", value, "userRank");
            return (Criteria) this;
        }

        public Criteria andUserRankLessThanOrEqualTo(Byte value) {
            addCriterion("user_rank <=", value, "userRank");
            return (Criteria) this;
        }

        public Criteria andUserRankIn(List<Byte> values) {
            addCriterion("user_rank in", values, "userRank");
            return (Criteria) this;
        }

        public Criteria andUserRankNotIn(List<Byte> values) {
            addCriterion("user_rank not in", values, "userRank");
            return (Criteria) this;
        }

        public Criteria andUserRankBetween(Byte value1, Byte value2) {
            addCriterion("user_rank between", value1, value2, "userRank");
            return (Criteria) this;
        }

        public Criteria andUserRankNotBetween(Byte value1, Byte value2) {
            addCriterion("user_rank not between", value1, value2, "userRank");
            return (Criteria) this;
        }

        public Criteria andUserPreferIsNull() {
            addCriterion("user_prefer is null");
            return (Criteria) this;
        }

        public Criteria andUserPreferIsNotNull() {
            addCriterion("user_prefer is not null");
            return (Criteria) this;
        }

        public Criteria andUserPreferEqualTo(String value) {
            addCriterion("user_prefer =", value, "userPrefer");
            return (Criteria) this;
        }

        public Criteria andUserPreferNotEqualTo(String value) {
            addCriterion("user_prefer <>", value, "userPrefer");
            return (Criteria) this;
        }

        public Criteria andUserPreferGreaterThan(String value) {
            addCriterion("user_prefer >", value, "userPrefer");
            return (Criteria) this;
        }

        public Criteria andUserPreferGreaterThanOrEqualTo(String value) {
            addCriterion("user_prefer >=", value, "userPrefer");
            return (Criteria) this;
        }

        public Criteria andUserPreferLessThan(String value) {
            addCriterion("user_prefer <", value, "userPrefer");
            return (Criteria) this;
        }

        public Criteria andUserPreferLessThanOrEqualTo(String value) {
            addCriterion("user_prefer <=", value, "userPrefer");
            return (Criteria) this;
        }

        public Criteria andUserPreferLike(String value) {
            addCriterion("user_prefer like", value, "userPrefer");
            return (Criteria) this;
        }

        public Criteria andUserPreferNotLike(String value) {
            addCriterion("user_prefer not like", value, "userPrefer");
            return (Criteria) this;
        }

        public Criteria andUserPreferIn(List<String> values) {
            addCriterion("user_prefer in", values, "userPrefer");
            return (Criteria) this;
        }

        public Criteria andUserPreferNotIn(List<String> values) {
            addCriterion("user_prefer not in", values, "userPrefer");
            return (Criteria) this;
        }

        public Criteria andUserPreferBetween(String value1, String value2) {
            addCriterion("user_prefer between", value1, value2, "userPrefer");
            return (Criteria) this;
        }

        public Criteria andUserPreferNotBetween(String value1, String value2) {
            addCriterion("user_prefer not between", value1, value2, "userPrefer");
            return (Criteria) this;
        }

        public Criteria andConsumptionTimesIsNull() {
            addCriterion("Consumption_times is null");
            return (Criteria) this;
        }

        public Criteria andConsumptionTimesIsNotNull() {
            addCriterion("Consumption_times is not null");
            return (Criteria) this;
        }

        public Criteria andConsumptionTimesEqualTo(Integer value) {
            addCriterion("Consumption_times =", value, "consumptionTimes");
            return (Criteria) this;
        }

        public Criteria andConsumptionTimesNotEqualTo(Integer value) {
            addCriterion("Consumption_times <>", value, "consumptionTimes");
            return (Criteria) this;
        }

        public Criteria andConsumptionTimesGreaterThan(Integer value) {
            addCriterion("Consumption_times >", value, "consumptionTimes");
            return (Criteria) this;
        }

        public Criteria andConsumptionTimesGreaterThanOrEqualTo(Integer value) {
            addCriterion("Consumption_times >=", value, "consumptionTimes");
            return (Criteria) this;
        }

        public Criteria andConsumptionTimesLessThan(Integer value) {
            addCriterion("Consumption_times <", value, "consumptionTimes");
            return (Criteria) this;
        }

        public Criteria andConsumptionTimesLessThanOrEqualTo(Integer value) {
            addCriterion("Consumption_times <=", value, "consumptionTimes");
            return (Criteria) this;
        }

        public Criteria andConsumptionTimesIn(List<Integer> values) {
            addCriterion("Consumption_times in", values, "consumptionTimes");
            return (Criteria) this;
        }

        public Criteria andConsumptionTimesNotIn(List<Integer> values) {
            addCriterion("Consumption_times not in", values, "consumptionTimes");
            return (Criteria) this;
        }

        public Criteria andConsumptionTimesBetween(Integer value1, Integer value2) {
            addCriterion("Consumption_times between", value1, value2, "consumptionTimes");
            return (Criteria) this;
        }

        public Criteria andConsumptionTimesNotBetween(Integer value1, Integer value2) {
            addCriterion("Consumption_times not between", value1, value2, "consumptionTimes");
            return (Criteria) this;
        }

        public Criteria andComsumeAmountIsNull() {
            addCriterion("comsume_amount is null");
            return (Criteria) this;
        }

        public Criteria andComsumeAmountIsNotNull() {
            addCriterion("comsume_amount is not null");
            return (Criteria) this;
        }

        public Criteria andComsumeAmountEqualTo(BigDecimal value) {
            addCriterion("comsume_amount =", value, "comsumeAmount");
            return (Criteria) this;
        }

        public Criteria andComsumeAmountNotEqualTo(BigDecimal value) {
            addCriterion("comsume_amount <>", value, "comsumeAmount");
            return (Criteria) this;
        }

        public Criteria andComsumeAmountGreaterThan(BigDecimal value) {
            addCriterion("comsume_amount >", value, "comsumeAmount");
            return (Criteria) this;
        }

        public Criteria andComsumeAmountGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("comsume_amount >=", value, "comsumeAmount");
            return (Criteria) this;
        }

        public Criteria andComsumeAmountLessThan(BigDecimal value) {
            addCriterion("comsume_amount <", value, "comsumeAmount");
            return (Criteria) this;
        }

        public Criteria andComsumeAmountLessThanOrEqualTo(BigDecimal value) {
            addCriterion("comsume_amount <=", value, "comsumeAmount");
            return (Criteria) this;
        }

        public Criteria andComsumeAmountIn(List<BigDecimal> values) {
            addCriterion("comsume_amount in", values, "comsumeAmount");
            return (Criteria) this;
        }

        public Criteria andComsumeAmountNotIn(List<BigDecimal> values) {
            addCriterion("comsume_amount not in", values, "comsumeAmount");
            return (Criteria) this;
        }

        public Criteria andComsumeAmountBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("comsume_amount between", value1, value2, "comsumeAmount");
            return (Criteria) this;
        }

        public Criteria andComsumeAmountNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("comsume_amount not between", value1, value2, "comsumeAmount");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNull() {
            addCriterion("create_time is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("create_time is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(Date value) {
            addCriterion("create_time =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(Date value) {
            addCriterion("create_time <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(Date value) {
            addCriterion("create_time >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("create_time >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(Date value) {
            addCriterion("create_time <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("create_time <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<Date> values) {
            addCriterion("create_time in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<Date> values) {
            addCriterion("create_time not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(Date value1, Date value2) {
            addCriterion("create_time between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("create_time not between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIsNull() {
            addCriterion("update_time is null");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIsNotNull() {
            addCriterion("update_time is not null");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeEqualTo(Date value) {
            addCriterion("update_time =", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotEqualTo(Date value) {
            addCriterion("update_time <>", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeGreaterThan(Date value) {
            addCriterion("update_time >", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("update_time >=", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeLessThan(Date value) {
            addCriterion("update_time <", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeLessThanOrEqualTo(Date value) {
            addCriterion("update_time <=", value, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeIn(List<Date> values) {
            addCriterion("update_time in", values, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotIn(List<Date> values) {
            addCriterion("update_time not in", values, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeBetween(Date value1, Date value2) {
            addCriterion("update_time between", value1, value2, "updateTime");
            return (Criteria) this;
        }

        public Criteria andUpdateTimeNotBetween(Date value1, Date value2) {
            addCriterion("update_time not between", value1, value2, "updateTime");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table user_info
     *
     * @mbg.generated do_not_delete_during_merge Sun Apr 21 01:34:44 CST 2019
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table user_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
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