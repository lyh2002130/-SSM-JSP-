package com.itheima.pojo;

import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

public class Cart {
    //使用Map而不用List集合，便于删除操作
    //集合存购物项,Map的key为商品编号,value为购物项
    private Map<Integer, CartItem> map = new HashMap<Integer, CartItem>();

    private double total;//购物总价格

    public Cart(){
    }

    public Map<Integer, CartItem> getMap() {
        return map;
    }

    public void setMap(Map<Integer, CartItem> map) {
        this.map = map;
    }

    //算出购物车总价
    public double getTotal() {
        double temp = 0.0;
        for(Entry<Integer, CartItem> entry : map.entrySet()){
            temp += entry.getValue().getSubTotal();
        }
        this.total = temp;
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }
}
