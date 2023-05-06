package com.itheima.service;

import com.itheima.pojo.Product;

import java.util.List;

public interface IndexService {
    public List<Product> FindproductListByisHot();
    public List<Product> FindproductListByTime();
    public List<Product> FindproductListBypbargain();
    public Product FindProductItemByPid(Integer pid);
}
