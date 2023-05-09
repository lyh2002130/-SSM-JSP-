package com.itheima.mapper;

import com.itheima.pojo.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    Admin getAdminByNameAndPass(Admin admin);

    User getUserByNameAndPass(User user);
}
