package com.itheima.service;

import com.itheima.pojo.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserService {
    Admin getAdminByNameAndPass(Admin admin);

    User getUserByNameAndPass(User user);

    List<CartItem> getCartItemByUid(Integer uid);

    Product getProductByPid(Integer pid);

    int deleteCartItem(Integer pid,Integer uid);

    int deleteAllCartItems(Integer uid);

    int updatePnum(Integer pid,Integer num);

    int updateTotal(Integer pid,double subTotal);

    int addCartItem(CartItem cartItem);

    int updateCartItemPnum(CartItem cartItem);

    int addOrder(Order order);

    CartItem getCartItemByPid(Integer pid,Integer uid);

    int addOrderItem(OrderItem order_item);

    Order getOrderByOnum(String onum);

    Order getOrderByOid(Integer oid);

    int lessCountByUid(double subTotal,Integer uid);

    int updateOstate(String onum);

    int updateOstate2(Integer oid);

    int addUser(User user);

    User getUserByTelephone(String telephone);

    User getUserByUsername(String username);

    List<OrderVo> getOrdersByUid(Integer uid);

    List<OrderItem> getOrderItemsByOid(Integer oid);

    int updateOstate1(String ostate,Integer oid,Integer uid);

    int addCount(Integer uid,Integer count);

    int lessNumByPid(Integer pid,Integer num);

    int deleteOrderItem(Integer oid);

    int deleteOrder(String onum);

    int deleteOrder1(Integer oid);

}
