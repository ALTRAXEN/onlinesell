package com.shu.onlinesell.util;

import com.shu.onlinesell.bean.OrderMaster;
import com.shu.onlinesell.dto.OrderMasterDTO;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DTOUtil {
    public static void paramToString(OrderMaster orderMaster, OrderMasterDTO orderMasterDTO) {
        Date createTime = orderMaster.getCreateTime();
        Date updateTime = orderMaster.getUpdateTime();
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        if (orderMaster.getFinishTime() != null) {
            Date finishTime = orderMaster.getFinishTime();
            String finish = sdf.format(finishTime);
            orderMasterDTO.setStringFinishTime(finish);
        }
//        BigDecimal consumptionMoney = orderMaster.getConsumptionMoney();
        String str=sdf.format(createTime);
        orderMasterDTO.setStringCreateTime(str);
        String upDate = sdf.format(updateTime);
        orderMasterDTO.setStringUpdateTime(upDate);
    }
}
