package com.itheima.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product {
    private Integer pid;
    private String  pname;
    private double  market_price;
    private double  shop_price;
    private String  pimage;
    private String pmaterial ;
    private String pdate ;
    private Integer is_hot;
    private String  pdesc;
    private Integer pflag;
    private Integer pbargain;
    private Integer num;
    private Integer cid;
    private Category category;
}
