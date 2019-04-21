package com.shu.onlinesell.dao;

import com.shu.onlinesell.bean.OrderMaster;
import com.shu.onlinesell.bean.OrderMasterExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface OrderMasterMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_master
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    long countByExample(OrderMasterExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_master
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    int deleteByExample(OrderMasterExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_master
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    int deleteByPrimaryKey(String orderId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_master
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    int insert(OrderMaster record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_master
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    int insertSelective(OrderMaster record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_master
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    List<OrderMaster> selectByExample(OrderMasterExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_master
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    OrderMaster selectByPrimaryKey(String orderId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_master
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    int updateByExampleSelective(@Param("record") OrderMaster record, @Param("example") OrderMasterExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_master
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    int updateByExample(@Param("record") OrderMaster record, @Param("example") OrderMasterExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_master
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    int updateByPrimaryKeySelective(OrderMaster record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table order_master
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    int updateByPrimaryKey(OrderMaster record);
}