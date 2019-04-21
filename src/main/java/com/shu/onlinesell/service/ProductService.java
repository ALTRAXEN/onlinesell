package com.shu.onlinesell.service;

import com.github.pagehelper.util.StringUtil;
import com.shu.onlinesell.bean.ProductInfo;
import com.shu.onlinesell.bean.ProductInfoExample;
import com.shu.onlinesell.dao.ProductCategoryMapper;
import com.shu.onlinesell.dao.ProductInfoMapper;
import com.shu.onlinesell.enums.ProductStatusEnum;
import com.shu.onlinesell.enums.ResultEnum;
import com.shu.onlinesell.exception.SellException;
import com.shu.onlinesell.util.CategoryUtil;
import com.shu.onlinesell.util.ProductUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

@Service
public class ProductService {

    @Autowired
    ProductInfoMapper productInfoMapper;

    @Autowired
    ProductCategoryMapper productCategoryMapper;

//    获取食品列表
    public List<ProductInfo> getProduct() {
        return productInfoMapper.selectByExample(null);
    }

//    获取搜索结果列表
public List<ProductInfo> search(Map<String,String> map) {
    String productName= map.get("productName");
    String lowPrice = map.get("lowPrice");
    String highPrice = map.get("highPrice");

    ProductInfoExample productInfoExample = new ProductInfoExample();
    ProductInfoExample.Criteria criteria = productInfoExample.createCriteria();
    if (!StringUtil.isEmpty(productName)) {
        criteria.andProductNameLike("%"+productName+"%");
    }
    if (!(StringUtil.isEmpty(lowPrice)&StringUtil.isEmpty(highPrice))) {
    BigDecimal lowPrice2=new BigDecimal(map.get("lowPrice"));
    BigDecimal highPrice2=new BigDecimal(map.get("highPrice"));
        criteria.andProductPriceBetween(lowPrice2,highPrice2);
    }

    return productInfoMapper.selectByExample(productInfoExample);
}

    public void addGoods(Map<String, String> map) {
        String productName = map.get("productName");
        String productPrice = map.get("productPrice");
        String categoryType = map.get("categoryType");
        String productDescription = map.get("productDescription");
        if (productName.isEmpty() | productPrice.isEmpty() | categoryType.isEmpty()) {
            throw new SellException(ResultEnum.LACK_NECESSARY_PARAMETERS);
        }
//        if (!checkGoodsName(productName)) {
//            throw new SellException(ResultEnum.EXITED_PRODUCT);
//        }
        int type = CategoryUtil.categoryConverter(categoryType, productCategoryMapper);
        ProductInfo productInfo = new ProductInfo();
        productInfo.setProductPrice(new BigDecimal(productPrice));
        productInfo.setProductStock(0);
        productInfo.setProductStatus(ProductStatusEnum.DOWN.getCode());
        productInfo.setProductName(productName);
        productInfo.setCategoryType(type);
        productInfo.setProductId(ProductUtil.returnProductId(categoryType,productInfoMapper));
        if (!productDescription.isEmpty()) {
            productInfo.setProductDescription(productDescription);
        }
        productInfoMapper.insertSelective(productInfo);
    }

    public void delete(String productId) {
        productInfoMapper.deleteByPrimaryKey(productId);
    }

    public ProductInfo getGoodsById(String productId) {
        ProductInfo productInfo = productInfoMapper.selectByPrimaryKey(productId);
        if (productInfo == null) {
            throw new SellException(ResultEnum.PRODUCT_NOT_EXIST);
        }
        return productInfo;
    }

    public void modifyGoods(Map<String, String> map, String productId) {
        String productName = map.get("productName");
        String productPrice = map.get("productPrice");
        String productDescription = map.get("productDescription");
        ProductInfo productInfo = new ProductInfo();
        productInfo.setProductId(productId);
        productInfo.setProductPrice(new BigDecimal(productPrice));
        productInfo.setProductName(productName);
        productInfo.setProductDescription(productDescription);
        int result = productInfoMapper.updateByPrimaryKeySelective(productInfo);
        if (result == 0) {
            throw new SellException(ResultEnum.ORDER_UPDATE_FAIL);
        }
    }

    public boolean checkGoodsName(String productName) {
        ProductInfoExample example = new ProductInfoExample();
        ProductInfoExample.Criteria criteria = example.createCriteria();
        criteria.andProductNameEqualTo(productName);
        long a=productInfoMapper.countByExample(example);
        return a == 0;
    }
}
