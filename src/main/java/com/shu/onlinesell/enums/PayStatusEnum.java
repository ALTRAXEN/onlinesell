package com.shu.onlinesell.enums;



/**
 * Created by 廖师兄
 * 2017-06-11 17:16
 */

public enum PayStatusEnum implements CodeEnum {

    WAIT(0, "等待支付"),
    SUCCESS(1, "支付成功"),

    ;

    private Integer code;

    private String message;

    @Override
    public Integer getCode() {
        return code;
    }

    public String getMessage() {
        return message;
    }

    PayStatusEnum(Integer code, String message) {
        this.code = code;
        this.message = message;
    }
}
