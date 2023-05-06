package com.itheima.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderVo {
    private Integer oid;
    private String onum;
    private String receiver;
    private String address;
    private String tel;
    private String time;
    private String ostate;
    private double ototal;
    private List<OrderItem> orderItems;
}
