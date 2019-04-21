package com.shu.onlinesell.service;

import com.shu.onlinesell.bean.OrderMaster;
import com.shu.onlinesell.dto.OrderMasterDTO;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "../../../../../resources/applicationContext.xml")
public class OrderServiceTest {

    @Autowired
    OrderService orderService;


    @Test
    public void getOneOrder() {
        OrderMasterDTO orderMasterDTO = orderService.getOneOrder("21516132352");
        System.out.println(orderMasterDTO.toString());

    }

    @Test
    public void cancel() {
        OrderMasterDTO orderMasterDTO = orderService.getOneOrder("21516132352");
        OrderMasterDTO result = orderService.cancel(orderMasterDTO);
        System.out.println(result.toString());
    }

    @Test
    public void finish() {
        OrderMasterDTO orderMasterDTO = orderService.getOneOrder("21516132352");
        OrderMasterDTO result = orderService.finish(orderMasterDTO);
    }
}