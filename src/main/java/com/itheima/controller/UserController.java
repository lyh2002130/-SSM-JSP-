package com.itheima.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.itheima.pojo.*;
import com.itheima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("/login.do")
    public String adminLogin(Admin admin,User user,String status, HttpServletRequest request,Model model){
        if (status.equals("admin")){
            Admin admin1 = userService.getAdminByNameAndPass(admin);
            if (admin1!=null){
                request.getSession().setAttribute("ADMIN",admin1);
                request.getSession().removeAttribute("msg");
                return "admin_home";
            }else {
                model.addAttribute("msg","用户名或密码错误");
                return "login";
            }
        }else {
            User user1 = userService.getUserByNameAndPass(user);
            if (user1!=null){
                request.getSession().setAttribute("USER",user1);
                request.getSession().removeAttribute("msg");
                return "welcome";
            }else {
                model.addAttribute("msg","用户名或密码错误");
                return "login";
            }
        }
    }

    @RequestMapping("/logout.do")
    public String leave(HttpServletRequest request){
        request.getSession().removeAttribute("USER");
        return "index";
    }
}
