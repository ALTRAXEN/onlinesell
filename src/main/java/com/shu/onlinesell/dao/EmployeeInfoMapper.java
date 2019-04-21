package com.shu.onlinesell.dao;

import com.shu.onlinesell.bean.EmployeeInfo;
import com.shu.onlinesell.bean.EmployeeInfoExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface EmployeeInfoMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employee_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    long countByExample(EmployeeInfoExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employee_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    int deleteByExample(EmployeeInfoExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employee_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    int deleteByPrimaryKey(Integer employeeId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employee_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    int insert(EmployeeInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employee_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    int insertSelective(EmployeeInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employee_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    List<EmployeeInfo> selectByExample(EmployeeInfoExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employee_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    EmployeeInfo selectByPrimaryKey(Integer employeeId);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employee_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    int updateByExampleSelective(@Param("record") EmployeeInfo record, @Param("example") EmployeeInfoExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employee_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    int updateByExample(@Param("record") EmployeeInfo record, @Param("example") EmployeeInfoExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employee_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    int updateByPrimaryKeySelective(EmployeeInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table employee_info
     *
     * @mbg.generated Sun Apr 21 01:34:44 CST 2019
     */
    int updateByPrimaryKey(EmployeeInfo record);
}