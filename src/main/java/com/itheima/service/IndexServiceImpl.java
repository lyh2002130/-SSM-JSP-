package com.itheima.service;

import com.itheima.mapper.IndexMapper;
import com.itheima.pojo.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IndexServiceImpl implements IndexService {
    @Autowired
    private IndexMapper indexMapper;

    public List<Product> FindproductListByisHot() {
        return indexMapper.FindproductListByisHot();
    }

    public List<Product> FindproductListByTime() {
        return indexMapper.FindproductListByTime();
    }

    public List<Product> FindproductListBypbargain() {
        return indexMapper.FindproductListBypbargain();
    }

    public Product FindProductItemByPid(Integer pid) {
        return indexMapper.FindProductItemByPid(pid);
    }


}
