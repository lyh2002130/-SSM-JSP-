package com.itheima.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.HashMap;
import java.util.Map;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private Integer uid;
    private String  username;
    private String  password;
    private String  name;
    private String  email;
    private String  telephone;
    private String  birthday;
    private String  sex;
    private Integer count;
    private String  address;
}
