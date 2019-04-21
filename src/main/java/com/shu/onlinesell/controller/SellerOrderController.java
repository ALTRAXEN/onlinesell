package com.shu.onlinesell.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shu.onlinesell.bean.Message;
import com.shu.onlinesell.bean.OrderMaster;
import com.shu.onlinesell.dto.OrderMasterDTO;
import com.shu.onlinesell.enums.ResultEnum;
import com.shu.onlinesell.exception.SellException;
import com.shu.onlinesell.service.OrderService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/*
卖家端订单
 */


@RestController
@RequestMapping("/seller/order")
public class SellerOrderController {

    @Autowired
    private OrderService orderService;

    private Logger logger = Logger.getLogger(SellerOrderController.class);

    /*
    显示订单列表
    */
    @GetMapping("/list")
    public Message List(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 8);
        List<OrderMasterDTO> orderInfoList = orderService.getOrder();
        PageInfo pageInfo = new PageInfo(orderInfoList, 5);
        return Message.success().addMap("pageInfo", pageInfo);
    }

    //    展示当前订单
    @RequestMapping(value = "/current", method = RequestMethod.GET)
    public Message getCurrentOrder() {
        List<OrderMasterDTO> orderMasterDTOList =orderService.getCurrentOrder();
        return Message.success().addMap("orderMasterDTOList", orderMasterDTOList);
    }


    /*
    取消订单
    */
    @GetMapping("/cancel")
    public Message cancel(@RequestParam("orderId") String orderId) {
            Message message = new Message();
        try {
            OrderMasterDTO orderMasterDTO = orderService.getOneOrder(orderId);
            orderService.cancel(orderMasterDTO);
        } catch (SellException e) {
            logger.error("【卖家端取消订单】发生异常{}", e);
            message.setIdCode(200);
            message.setMessage(e.getMessage());
            return message;
        }
        message.setIdCode(ResultEnum.ORDER_FINISH_SUCCESS.getCode());
        message.setMessage(ResultEnum.ORDER_CANCEL_SUCCESS.getMessage());
        return message;
    }

    /*
    查询订单总表及其详情LIST
     */
    @GetMapping("/detail/{orderId}")
    public Message detail(@PathVariable("orderId") String orderId) {
        Message message = new Message();
        OrderMasterDTO orderMasterDTO;
        try {
            orderMasterDTO = orderService.getOneOrder(orderId);
        }catch (SellException e) {
            logger.error("【卖家端查询订单详情】发生异常{}", e);
            message.setIdCode(200);
            message.setMessage(e.getMessage());
            return message;
        }
        return Message.success().addMap("OrderMasterDTO",orderMasterDTO);
    }

    /**
     * 完结订单
     */
    @GetMapping("/finish")
    public Message finished(@RequestParam("orderId") String orderId) {
        Message message = new Message();
        try {
            OrderMasterDTO orderMasterDTO = orderService.getOneOrder(orderId);
            orderService.finish(orderMasterDTO);
        } catch (SellException e) {
            logger.error("【卖家端完结订单】发生异常{}", e);
            message.setIdCode(200);
            message.setMessage(e.getMessage());
            return message;
        }
        message.setIdCode(ResultEnum.ORDER_FINISH_SUCCESS.getCode());
        message.setMessage(ResultEnum.ORDER_FINISH_SUCCESS.getMessage());
        return message;
    }

    @RequestMapping(value = "/currentSize", method = RequestMethod.GET)
    public Message getCurrentOrderSize() {
        Long orderNum=orderService.getCurrentOrderSize();
        return Message.success().addMap("OrderSize", orderNum);
    }

    @RequestMapping(value = "/seen", method = RequestMethod.POST)
    public Message clearIconText() {
        orderService.clearIconText();
        return Message.success();
    }

    @RequestMapping(value = "/search",method = RequestMethod.POST)
    public Message searchGoods(@RequestBody Map<String,String> map) {
        PageHelper.startPage(Integer.parseInt(map.get("pn")), 8);
        Message message = new Message();
        List<OrderMasterDTO> orderMasterDTOList=new ArrayList<>();
        try {
            orderMasterDTOList= orderService.searchGoods(map);
        }catch (SellException e){
            logger.error(e.getMessage());
            message.setIdCode(200);
            message.setMessage(e.getMessage());
            return message;
        }
        PageInfo pageInfo = new PageInfo(orderMasterDTOList, 5);
//        pageInfo拿到的list进行封装，navigatePages：一次显示多少页
        return Message.success().addMap("pageInfo",pageInfo);
    }
}

