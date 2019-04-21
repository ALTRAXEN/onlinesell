package com.shu.onlinesell.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class ToThisPageController {
    @RequestMapping("/adminIndex") //定义方法名
    @ResponseBody
    public ModelAndView toAdminIndex(HttpServletRequest request) {
        ModelAndView retMap = new ModelAndView(); //返回新的ModelAndView
        retMap.setViewName("adminIndex");
        return retMap;
    }

    @RequestMapping("/login") //定义方法名
    @ResponseBody
    public ModelAndView tologin(HttpServletRequest request) {
        ModelAndView retMap = new ModelAndView(); //返回新的ModelAndView
        retMap.setViewName("login");
        return retMap;
    }

    @RequestMapping("/logout") //定义方法名
    @ResponseBody
    public ModelAndView logout(HttpSession httpSession, HttpServletRequest request) {
//        httpSession.setAttribute("loginstatus","0");
        httpSession.removeAttribute("loginstatus");
        ModelAndView retMap = new ModelAndView(); //返回新的ModelAndView
        retMap.setViewName("login");
        return retMap;
    }

    //转到此页
    @RequestMapping("/orderIndex") //定义方法名
    public ModelAndView toOrderIndex(HttpServletRequest request) {
        ModelAndView retMap = new ModelAndView(); //返回新的ModelAndView
        retMap.setViewName("orderIndex");
        return retMap;
    }

    //用于跳转到本页面默认界面
    @RequestMapping("/productIndex")
    public ModelAndView toproductIndex(HttpServletRequest request) {
        ModelAndView retMap = new ModelAndView(); //返回新的ModelAndView
        retMap.setViewName("productIndex");
        return retMap;
    }

    @RequestMapping("/employeeIndex")
    public ModelAndView toEmployeeIndex(HttpServletRequest request) {
        ModelAndView retMap = new ModelAndView(); //返回新的ModelAndView
        retMap.setViewName("employeeIndex");
        return retMap;
    }

}
