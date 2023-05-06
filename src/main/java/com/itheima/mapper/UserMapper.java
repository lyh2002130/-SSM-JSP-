package com.itheima.mapper;

import com.itheima.pojo.*;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserMapper {
    Admin getAdminByNameAndPass(Admin admin);

    User getUserByNameAndPass(User user);

    List<CartItem> getCartItemByUid(Integer uid);

    Product getProductByPid(Integer pid);

    int deleteCartItem(@Param("pid") Integer pid,@Param("uid")Integer uid);

    int deleteAllCartItems(Integer uid);

    int updatePnum(@Param("pid")Integer pid, @Param("pnum")Integer num);

    int updateTotal(@Param("pid")Integer pid,@Param("subTotal")double subTotal);

    int addCartItem(CartItem cartItem);

    int updateCartItemPnum(CartItem cartItem);

    int addOrder(Order order);

    CartItem getCartItemByPid(@Param("pid") Integer pid,@Param("uid")Integer uid);

    int addOrderItem(OrderItem order_item);

    Order getOrderByOnum(String onum);

    Order getOrderByOid(Integer oid);

    int lessCountByUid(@Param("subTotal") double subTotal,@Param("uid")Integer uid);

    int updateOstate(String onum);

    int updateOstate2(Integer oid);

    int addUser(User user);

    User getUserByTelephone(String telephone);

    User getUserByUsername(String username);

    List<OrderVo> getOrdersByUid(Integer uid);

    List<OrderItem> getOrderItemsByOid(Integer oid);

    int updateOstate1(@Param("ostate") String ostate,@Param("oid") Integer oid,@Param("uid") Integer uid);

    int addCount(@Param("uid")Integer uid,@Param("count")Integer count);

    int lessNumByPid(@Param("pid")Integer pid,@Param("num")Integer num);

    int deleteOrderItem(Integer oid);

    int deleteOrder(String onum);

    int deleteOrder1(Integer oid);
}
