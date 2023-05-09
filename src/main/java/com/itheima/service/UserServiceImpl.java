package com.itheima.service;

import com.itheima.mapper.UserMapper;
import com.itheima.pojo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserMapper userMapper;

    public Admin getAdminByNameAndPass(Admin admin) {
        return userMapper.getAdminByNameAndPass(admin);
    }

    public User getUserByNameAndPass(User user) {
        return userMapper.getUserByNameAndPass(user);
    }
}
