package com.shu.onlinesell.enums;



/**
 * 商品状态
 * Created by 廖师兄
 * 2017-05-09 17:33
 */

public enum ProductStatusEnum implements CodeEnum {
    UP(0, "在架"),
    DOWN(1, "下架"),
    SELLOUT(2, "已售罄"),
    SPECIALITY(3, "特价菜"),
    RECOMMENDED(4, "店长推荐"),
    ;

    private Integer code;

    private String message;

    ProductStatusEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    @Override
    public Integer getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }}
