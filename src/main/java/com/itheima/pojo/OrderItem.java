package com.itheima.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderItem {
    private String id;
    private Integer pay_count;
    private Integer send_count;
    private Integer order_id;
    private Integer pid;
    private Product product;
}
