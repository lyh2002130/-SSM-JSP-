package com.itheima.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    private Integer oid;
    private Integer uid;
    private String onum;
    private String receiver;
    private String address;
    private String tel;
    private String time;
    private String ostate;
    private double ototal;
}
