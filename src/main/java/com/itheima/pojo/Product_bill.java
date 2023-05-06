package com.itheima.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Product_bill {
    private String  id;
    private String  create_time;
    private String  update_time;
    private String  firm_name;
    private String  firm_address;
    private String  phone;
    private Integer count ;
    private String  title;
    private String  number;
    private double  price;
}
