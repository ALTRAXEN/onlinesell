package com.shu.onlinesell.enums;

public enum CategoryTypeEnum {
    HOTDISH("热菜", 0),
    CLODDISH("凉菜", 1),
    DRINKING("饮料", 2),
    SOAP("汤类", 3),
    DESSERT("甜点", 4),
    ;


    private String type;
    private Integer typeCode;

    CategoryTypeEnum(String type, Integer typeCode) {
        this.type = type;
        this.typeCode = typeCode;
    }

    public String getType() {
        return type;
    }

    public Integer getTypeCode() {
        return typeCode;
    }
}
