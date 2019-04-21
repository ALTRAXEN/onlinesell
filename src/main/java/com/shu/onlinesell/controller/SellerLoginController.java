package com.shu.onlinesell.controller;


import com.shu.onlinesell.bean.EmployeeInfo;
import com.shu.onlinesell.bean.Message;
import com.shu.onlinesell.exception.SellException;
import com.shu.onlinesell.service.LoginService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/seller")
public class SellerLoginController {

    private Logger logger = Logger.getLogger(SellerLoginController.class);

    @Autowired
    LoginService loginService;


    @PostMapping("/doLogin")
    public Message adminLogin(HttpSession httpSession, @RequestParam("userID") String ID, @RequestParam("password") String password) {
        Message message = new Message();
        EmployeeInfo employeeInfo = new EmployeeInfo();
        try {
         employeeInfo= loginService.login(ID, password);
        } catch (SellException e) {
            logger.error(e.getMessage());
            message.setIdCode(200);
            message.setMessage(e.getMessage());
        }
        employeeInfo.setPassword("");
        httpSession.setAttribute("loginstatus","1");
        return Message.success().addMap("user", employeeInfo);
    }


}
