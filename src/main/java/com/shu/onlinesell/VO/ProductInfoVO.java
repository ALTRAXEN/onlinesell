package com.shu.onlinesell.VO;

import com.fasterxml.jackson.annotation.JsonProperty;


import java.math.BigDecimal;

/**
 * 商品详情
 * Created by 廖师兄
 * 2017-05-12 14:25
 */

public class ProductInfoVO {

    @JsonProperty("id")
    private String productId;

    @JsonProperty("name")
    private String productName;

    @JsonProperty("price")
    private BigDecimal productPrice;

    @JsonProperty("description")
    private String productDescription;

    @JsonProperty("icon")
    private String productIcon;
}
