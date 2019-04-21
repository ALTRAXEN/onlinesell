package com.shu.onlinesell.VO;

import com.fasterxml.jackson.annotation.JsonProperty;


import java.util.List;

/**
 * 商品(包含类目)
 * Created by 廖师兄
 * 2017-05-12 14:20
 */

public class ProductVO {

    @JsonProperty("name")
    private String categoryName;

    @JsonProperty("type")
    private Integer categoryType;

    @JsonProperty("foods")
    private List<ProductInfoVO> productInfoVOList;
}
