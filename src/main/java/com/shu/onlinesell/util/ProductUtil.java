package com.shu.onlinesell.util;

import com.shu.onlinesell.bean.ProductInfo;
import com.shu.onlinesell.bean.ProductInfoExample;
import com.shu.onlinesell.dao.ProductInfoMapper;

import java.util.List;

/*
 自动生成对应的菜品ID并返回
 */
public class ProductUtil {

    public static String returnProductId(String goodsType, ProductInfoMapper goodsMapper) {
        String IdHead = null;
        switch (goodsType) {
            case "热菜":
                IdHead = "H";
                break;
            case "冷菜":
                IdHead = "C";
                break;
            case "饮料":
                IdHead = "D";
                break;
            case "汤类":
                IdHead = "S";
                break;
            case "甜点":
                IdHead = "B";
                break;
        }
        ProductInfoExample example = new ProductInfoExample();
        ProductInfoExample.Criteria criteria = example.createCriteria();
        criteria.andProductIdLike("%" + IdHead + "%");
        List<ProductInfo> goodsList = goodsMapper.selectByExample(example);
        ProductInfo goods = goodsList.get(goodsList.size() - 1);
        StringBuilder idBuffer = new StringBuilder(goods.getProductId());
        idBuffer.deleteCharAt(0);
        int idValue = Integer.valueOf(idBuffer.toString()) + 1;
        if (idValue < 10) {
            return IdHead + "00" + idValue;
        }
        if (idValue < 100) {
            return IdHead + "0" + idValue;
        }
        return IdHead + idValue;
    }

    public static int productStatusConverter(String productStatus) {
        /*
         UP(0, "在架"),
        DOWN(1, "下架"),
        SELLOUT(2, "已售罄"),
        SPECIALITY(3, "特价菜"),
        RECOMMENDED(4, "店长推荐"),
         */
        int productStatusStore = 10;
        switch (productStatus) {
            case "上架":
                productStatusStore = 0;
                break;
            case "下架":
                productStatusStore = 1;
                break;
            case "已售罄":
                productStatusStore = 2;
            case "特价菜":
                productStatusStore = 3;
            case "店长推荐":
                productStatusStore = 4;
        }
        return productStatusStore;
    }

}
