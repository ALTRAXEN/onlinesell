package com.shu.onlinesell.service;

import com.shu.onlinesell.bean.EmployeeInfo;
import com.shu.onlinesell.bean.EmployeeInfoExample;
import com.shu.onlinesell.dao.EmployeeInfoMapper;
import com.shu.onlinesell.enums.ResultEnum;
import com.shu.onlinesell.exception.SellException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LoginService {

    @Autowired
    EmployeeInfoMapper employeeInfoMapper;

    //登录方法
    public EmployeeInfo login(String id, String password) {
        EmployeeInfoExample employeeInfoExample = new EmployeeInfoExample();
        EmployeeInfoExample.Criteria criteria = employeeInfoExample.createCriteria();
        criteria.andEmployeeIdEqualTo(Integer.valueOf(id));
        long a = employeeInfoMapper.countByExample(employeeInfoExample);
        if (a == 0) {
            throw new SellException(ResultEnum.ID_NO_EXIST);
        }
        criteria.andPasswordEqualTo(password);
        List<EmployeeInfo> employeeInfoList = employeeInfoMapper.selectByExample(employeeInfoExample);
        if (employeeInfoList.size()==0) {
            throw new SellException(ResultEnum.LOGIN_FAIL);
        }
        return employeeInfoList.get(0);
    }
}
