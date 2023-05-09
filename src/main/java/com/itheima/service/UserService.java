package com.itheima.service;

import com.itheima.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    Admin getAdminByNameAndPass(Admin admin);

    User getUserByNameAndPass(User user);

}
