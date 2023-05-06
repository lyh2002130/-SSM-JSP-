package com.itheima.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CartItem {
    private Integer gid;
    private Integer uid;
    private Integer pid;
    private Product product;// 商品
    private double subTotal;// 小计（数量*商品单价）
    private Integer pnum;// 数量
}
