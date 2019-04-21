package com.shu.onlinesell.controller;

import com.shu.onlinesell.bean.WXSessionModel;
import com.shu.onlinesell.service.RedisOperator;
import com.shu.onlinesell.util.HttpClientUtil;
import com.shu.onlinesell.util.JSONResult;
import com.shu.onlinesell.util.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@RestController
public class WechatController {

    @Autowired
    private RedisOperator redisOperator;

    @PostMapping("/wxlogin")
    public JSONResult wxlogin( String code) {
        System.out.println("wxlogin - code: " + code);

//		https://api.weixin.qq.com/sns/jscode2session?
//				appid=APPID&
//				secret=SECRET&
//				js_code=JSCODE&
//				grant_type=authorization_code

        String url = "https://api.weixin.qq.com/sns/jscode2session";
        Map<String, String> param = new HashMap<>();
        param.put("appid", "wxf94da4455f5053be");
        param.put("secret", "f5500564fcd2d14521ef3e82511601c8");
        param.put("js_code", code);
        param.put("grant_type", "authorization_code");

        String wxResult = HttpClientUtil.doGet(url, param);
        System.out.println(wxResult);

        WXSessionModel model = JsonUtils.jsonToPojo(wxResult, WXSessionModel.class);

        // 存入session到redis
        redisOperator.set("user-redis-session:" + model.getOpenid(),
                model.getSession_key(),
                1000 * 60 * 30);

        return JSONResult.ok();
    }

}
