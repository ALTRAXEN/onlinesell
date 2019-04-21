package com.shu.onlinesell.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shu.onlinesell.bean.Message;
import com.shu.onlinesell.bean.ProductInfo;
import com.shu.onlinesell.enums.ResultEnum;
import com.shu.onlinesell.exception.SellException;
import com.shu.onlinesell.service.ProductService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/seller/product")
public class SellerProductController {

    private Logger logger = Logger.getLogger(SellerOrderController.class);

    @Autowired
    private ProductService productService;

    /*
    获取食品列表
     */

    @GetMapping("/list")
    public Message list(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
        PageHelper.startPage(pn, 8);
        List<ProductInfo> productInfoList = productService.getProduct();
        PageInfo pageInfo = new PageInfo(productInfoList, 5);
        return Message.success().addMap("pageInfo", pageInfo);
    }

    //模糊搜索食品
    @RequestMapping(value = "/search",method = RequestMethod.POST)
    public Message searchGoods(@RequestBody Map<String,String> map) {
        PageHelper.startPage(Integer.parseInt(map.get("pn")), 8);
        Message message = new Message();
        List<ProductInfo> goodsList = productService.search(map);
//        pageInfo拿到的list进行封装，navigatePages：一次显示多少页
        PageInfo pageInfo = new PageInfo(goodsList, 5);
        return Message.success().addMap("pageInfo", pageInfo);
    }

    //    添加菜品
    @RequestMapping(value = "/add" ,method = RequestMethod.POST)
    public Message addGoods(@RequestBody Map<String,String> map) {
        Message message = new Message();
        try {
        productService.addGoods(map);
        } catch (SellException e) {
            logger.error(e.getMessage());
            message.setIdCode(200);
            message.setMessage(e.getMessage());
            return message;
        }
        return  Message.success();
    }

    //    删除菜品
    @RequestMapping(value = "/delete/{productId}",method = RequestMethod.DELETE)
    public Message deleteGoods(@PathVariable("productId") String productId) {
        productService.delete(productId);
        return Message.success();
    }

    //    在菜品修改模态框中查询选中的菜品信息
    @RequestMapping(value = "/{productId}",method = RequestMethod.GET)
    @ResponseBody
    public Message getProductById(@PathVariable("productId") String productId) {
        Message message = new Message();
        ProductInfo productInfo;
        try {
        productInfo=productService.getGoodsById(productId);
        } catch (SellException e) {
            logger.error(e.getMessage());
            message.setIdCode(200);
            message.setMessage(e.getMessage());
            return message;
        }
        return Message.success().addMap("productInfo", productInfo);
    }

    @RequestMapping(value = "/modify/{productId}",method = RequestMethod.PUT)
    @ResponseBody
    public Message modifyGoods(@RequestBody Map<String,String> map,@PathVariable("productId") String productId) {
        Message message=new Message();
        try {
        productService.modifyGoods(map, productId);
        } catch (SellException e) {
            logger.error(e.getMessage());
            message.setIdCode(200);
            message.setMessage(e.getMessage());
            return message;
        }
        return Message.success();
    }

    @PostMapping("/check")
    public Message checkProductName(@RequestParam("goodsName") String goodsName) {
        Message message=new Message();
        if (!productService.checkGoodsName(goodsName)) {
            logger.error(ResultEnum.EXITED_PRODUCT);
            message.setIdCode(200);
            message.setMessage(ResultEnum.EXITED_PRODUCT.getMessage());
            return message;
        }
        return Message.success();
    }

}
