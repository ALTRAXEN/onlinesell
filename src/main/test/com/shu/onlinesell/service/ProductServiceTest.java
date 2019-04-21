package com.shu.onlinesell.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.Map;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "../../../../../resources/applicationContext.xml")
public class ProductServiceTest {

    @Autowired
    ProductService productService;

    @Test
    public void getProduct() {
        productService.getProduct();
    }

    @Test
    public void search() {
        Map<String, String> map = new HashMap<>();
        map.put("productName", "");
        map.put("lowPrice", "10");
        map.put("highPrice", "70");
        productService.search(map);
    }

    @Test
    public void addGoods() {
        Map<String, String> map = new HashMap<>();
        map.put("productName","水果拼盘");
        map.put("productPrice","25.5");
        map.put("categoryType","冷菜");
        map.put("productDescription","精选新鲜水果");
        productService.addGoods(map);

    }
}