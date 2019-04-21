package com.shu.onlinesell.util;

import com.shu.onlinesell.bean.ProductCategory;
import com.shu.onlinesell.bean.ProductCategoryExample;
import com.shu.onlinesell.dao.ProductCategoryMapper;

import java.util.List;

public class CategoryUtil {

    public static int categoryConverter(String categoryType, ProductCategoryMapper productCategoryMapper) {
        ProductCategoryExample productCategoryExample = new ProductCategoryExample();
        ProductCategoryExample.Criteria criteria = productCategoryExample.createCriteria();
        criteria.andCategoryNameEqualTo(categoryType);
        List<ProductCategory> productCategoryList = productCategoryMapper.selectByExample(productCategoryExample);
        return productCategoryList.get(0).getCategoryType();
    }
}
