package com.shu.onlinesell.bean;

import java.util.HashMap;
import java.util.Map;
/*
封装从数据库拿到的数据
 */
public class Message {
    private Integer IdCode;
    private String message;
    private Map<String, Object> infoMap=new HashMap<String, Object>();

    //    默认成功信息
    public  static Message success() {
        Message message = new Message();
        message.setIdCode(100);
        message.setMessage("process is success!");
        return message;
    }

    //    默认失败信息
    public static Message fail() {
        Message message = new Message();
        message.setIdCode(200);
        return message;
    }

    //    添加Map元素方法
    public Message addMap(String key,Object value) {
        this.getInfoMap().put(key, value);
        return this;
    }

    public Map<String, Object> getInfoMap() {
        return infoMap;
    }

    public void setInfoMap(Map<String, Object> infoMap) {
        this.infoMap = infoMap;
    }

    public Integer getIdCode() {
        return IdCode;
    }

    public void setIdCode(Integer idCode) {
        IdCode = idCode;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }


}
