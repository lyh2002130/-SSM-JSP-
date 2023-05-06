package com.itheima.mapper;

import com.itheima.pojo.Product;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface IndexMapper {
    //主页热门商品
    public List<Product> FindproductListByisHot();
    //主页新品
    public List<Product> FindproductListByTime();
    //主页特价商品
    public List<Product> FindproductListBypbargain();
    //商品详情
    public Product FindProductItemByPid(Integer pid);

}
