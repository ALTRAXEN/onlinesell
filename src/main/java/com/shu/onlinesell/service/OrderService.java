package com.shu.onlinesell.service;

import com.shu.onlinesell.bean.OrderDetail;
import com.shu.onlinesell.bean.OrderDetailExample;
import com.shu.onlinesell.bean.OrderMaster;
import com.shu.onlinesell.bean.OrderMasterExample;
import com.shu.onlinesell.dao.OrderDetailMapper;
import com.shu.onlinesell.dao.OrderMasterMapper;
import com.shu.onlinesell.dto.OrderMasterDTO;
import com.shu.onlinesell.enums.OrderStatusEnum;
import com.shu.onlinesell.enums.ResultEnum;
import com.shu.onlinesell.exception.SellException;
import com.shu.onlinesell.util.CopyUtil;
import com.shu.onlinesell.util.DTOUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class OrderService {

    @Autowired
    private OrderMasterMapper orderMasterMapper;

    @Autowired
    private OrderDetailMapper orderDetailMapper;

    private Logger logger = Logger.getLogger(OrderService.class);

//获得所有的订单总表
    public List<OrderMasterDTO> getOrder() {
        List<OrderMaster> orderMasterList = orderMasterMapper.selectByExample(null);
        return getOrderMasterDTOS(orderMasterList);
    }

//获得指定ID的订单总表以及附属详情表
    public OrderMasterDTO getOneOrder(String orderId) {
        OrderMaster orderMaster = orderMasterMapper.selectByPrimaryKey(orderId);
        if (orderMaster == null) {
            throw new SellException(ResultEnum.ORDER_NOT_EXIST);
        }
        OrderDetailExample orderDetailExample = new OrderDetailExample();
        OrderDetailExample.Criteria criteria = orderDetailExample.createCriteria();
        criteria.andOrderIdEqualTo(orderId);
        List<OrderDetail> orderDetailList = orderDetailMapper.selectByExample(orderDetailExample);
        if (CollectionUtils.isEmpty(orderDetailList)) {
            throw new SellException(ResultEnum.ORDER_NOT_EXIST);
        }
        OrderMasterDTO orderMasterDTO = new OrderMasterDTO();
        CopyUtil.copyProperties(orderMaster, orderMasterDTO);
        orderMasterDTO.setOrderDetailList(orderDetailList);
        return orderMasterDTO;
    }

    @Transactional
    public OrderMasterDTO cancel(OrderMasterDTO orderMasterDTO) {
        OrderMaster orderMaster = new OrderMaster();

        //判断订单状态
        if (!orderMasterDTO.getOrderStatus().equals(OrderStatusEnum.NEW.getCode().byteValue())) {
            logger.error("【取消订单】订单状态不正确");
            throw new SellException(ResultEnum.ORDER_STATUS_ERROR);
        }

        //修改订单状态
        orderMasterDTO.setOrderStatus(OrderStatusEnum.CANCEL.getCode().byteValue());
        BeanUtils.copyProperties(orderMasterDTO, orderMaster);
        int result = orderMasterMapper.updateByPrimaryKeySelective(orderMaster);
        if (result == 0) {
            logger.error("【取消订单】更新失败");
            throw new SellException(ResultEnum.ORDER_UPDATE_FAIL);
        }

        //返回库存
        /*if (CollectionUtils.isEmpty(orderMasterDTO.getOrderDetailList())) {
            logger.error("【取消订单】订单中无商品详情");
            throw new SellException(ResultEnum.ORDER_DETAIL_EMPTY);
        }
        List<CartDTO> cartDTOList = orderMasterDTO.getOrderDetailList().stream()
                .map(e -> new CartDTO(e.getProductId(), e.getProductQuantity()))
                .collect(Collectors.toList());
        productService.increaseStock(cartDTOList);

        //如果已支付, 需要退款
        if (orderMasterDTO.getPayStatus().equals(PayStatusEnum.SUCCESS.getCode().byteValue())) {
            payService.refund(orderMasterDTO);
        }*/

        return orderMasterDTO;
    }

    @Transactional
    public OrderMasterDTO finish(OrderMasterDTO orderMasterDTO) {
        if (!orderMasterDTO.getOrderStatus().equals(OrderStatusEnum.NEW.getCode().byteValue())) {
            logger.error("【完结订单】订单状态不正确");
            throw new SellException(ResultEnum.ORDER_STATUS_ERROR);
        }

        //修改订单状态
        orderMasterDTO.setOrderStatus(OrderStatusEnum.FINISHED.getCode().byteValue());
        OrderMaster orderMaster = new OrderMaster();
        BeanUtils.copyProperties(orderMasterDTO, orderMaster);
        int result = orderMasterMapper.updateByPrimaryKeySelective(orderMaster);
        if (result == 0) {
            logger.error("【完结订单】更新失败,未进行更新");
            throw new SellException(ResultEnum.ORDER_UPDATE_FAIL);
        }

        //推送微信模版消息
//        pushMessageService.orderStatus(orderMasterDTO);

        return orderMasterDTO;
    }

    public Long getCurrentOrderSize() {
        OrderMasterExample orderMasterExample = new OrderMasterExample();
        OrderMasterExample.Criteria criteria = orderMasterExample.createCriteria();
        criteria.andOrderStatusEqualTo(OrderStatusEnum.NEW.getCode().byteValue());
        return orderMasterMapper.countByExample(orderMasterExample);
    }


    public void clearIconText() {
        OrderMasterExample orderMasterExample = new OrderMasterExample();
        OrderMasterExample.Criteria criteria = orderMasterExample.createCriteria();
        criteria.andOrderStatusEqualTo((byte) 0);
        OrderMaster orderMaster = new OrderMaster();
        orderMaster.setOrderStatus((byte)3);
        orderMasterMapper.updateByExampleSelective(orderMaster, orderMasterExample);
    }

    public List<OrderMasterDTO> getCurrentOrder() {
        OrderMasterExample masterExample = new OrderMasterExample();
        OrderMasterExample.Criteria criteria = masterExample.createCriteria();
        criteria.andOrderStatusEqualTo((byte)3);
        List<OrderMaster> orderMasterList = orderMasterMapper.selectByExample(masterExample);
        return getOrderMasterDTOS(orderMasterList);
    }


    public List<OrderMasterDTO> searchGoods(Map<String,String> map) {
        String orderId=map.get("orderId");
        OrderMasterExample masterExample = new OrderMasterExample();
        OrderMasterExample.Criteria criteria = masterExample.createCriteria();
        criteria.andOrderIdLike("%" + orderId + "%");
        List<OrderMaster> orderMasterList = orderMasterMapper.selectByExample(masterExample);
        if (orderMasterList.size() == 0) {
            throw new SellException(ResultEnum.ORDER_NOT_EXIST);
        }
        return getOrderMasterDTOS(orderMasterList);
    }

    private List<OrderMasterDTO> getOrderMasterDTOS(List<OrderMaster> orderMasterList) {
        List<OrderMasterDTO> orderMasterDTOList = new ArrayList<>();
        for (OrderMaster orderMaster:orderMasterList
        ) {
            OrderMasterDTO orderMasterDTO = new OrderMasterDTO();
            CopyUtil.copyProperties(orderMaster,orderMasterDTO);
            DTOUtil.paramToString(orderMaster,orderMasterDTO);
            orderMasterDTOList.add(orderMasterDTO);
        }
        return orderMasterDTOList;
    }
}
