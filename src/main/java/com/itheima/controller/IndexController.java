package com.itheima.controller;

import com.itheima.pojo.Product;
import com.itheima.service.IndexService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class IndexController {
    @Autowired
    private IndexService indexService;
    @GetMapping("/FindisHot.do")
    public String FindproductListByisHot(Model model){
        List<Product> products = indexService.FindproductListByisHot();
        List<Product> products1 = indexService.FindproductListByTime();
        List<Product> products2 = indexService.FindproductListBypbargain();
        model.addAttribute("HOT_PRODUCT_LIST",products);
        model.addAttribute("NEW_PRODUCT_LIST",products1);
        model.addAttribute("BARGAIN_PRODUCT_LIST",products2);
        return "index";
    }

    @GetMapping("/findProductByPid.do")
    public String findProductItemByPid(@RequestParam("pid") Integer pid, Model model){
        Product products = indexService.FindProductItemByPid(pid);
        model.addAttribute("PRODUCT",products);
        return "product_info";
    }
}
