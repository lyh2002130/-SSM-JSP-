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

    public List<CartItem> getCartItemByUid(Integer uid) {
        return userMapper.getCartItemByUid(uid);
    }

    public Product getProductByPid(Integer pid) {
        return userMapper.getProductByPid(pid);
    }

    public int deleteCartItem(Integer pid,Integer uid) {
        return userMapper.deleteCartItem(pid,uid);
    }

    public int deleteAllCartItems(Integer uid) {
        return userMapper.deleteAllCartItems(uid);
    }

    public int updatePnum(Integer pid, Integer num) {
        return userMapper.updatePnum(pid, num);
    }

    public int updateTotal(Integer pid,double subTotal) {
        return userMapper.updateTotal(pid,subTotal);
    }

    public int addCartItem(CartItem cartItem) {
        return userMapper.addCartItem(cartItem);
    }

    public int updateCartItemPnum(CartItem cartItem) {
        return userMapper.updateCartItemPnum(cartItem);
    }

    public int addOrder(Order order) {
        return userMapper.addOrder(order);
    }

    public CartItem getCartItemByPid(Integer pid,Integer uid) {
        return userMapper.getCartItemByPid(pid,uid);
    }

    public int addOrderItem(OrderItem order_item) {
        return userMapper.addOrderItem(order_item);
    }

    public Order getOrderByOnum(String onum) {
        return userMapper.getOrderByOnum(onum);
    }

    public Order getOrderByOid(Integer oid) {
        return userMapper.getOrderByOid(oid);
    }

    public int lessCountByUid(double subTotal,Integer uid) {
        return userMapper.lessCountByUid(subTotal,uid);
    }

    public int updateOstate(String onum) {
        return userMapper.updateOstate(onum);
    }

    public int updateOstate2(Integer oid) {
        return userMapper.updateOstate2(oid);
    }

    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    public User getUserByTelephone(String telephone) {
        return userMapper.getUserByTelephone(telephone);
    }

    public User getUserByUsername(String username) {
        return userMapper.getUserByUsername(username);
    }

    public List<OrderVo> getOrdersByUid(Integer uid) {
        return userMapper.getOrdersByUid(uid);
    }

    public List<OrderItem> getOrderItemsByOid(Integer oid) {
        return userMapper.getOrderItemsByOid(oid);
    }

    public int updateOstate1(String ostate,Integer oid, Integer uid) {
        return userMapper.updateOstate1(ostate,oid,uid);
    }

    public int addCount(Integer uid,Integer count) {
        return userMapper.addCount(uid, count);
    }

    public int lessNumByPid(Integer pid,Integer num) {
        return userMapper.lessNumByPid(pid,num);
    }

    public int deleteOrderItem(Integer oid) {
        return userMapper.deleteOrderItem(oid);
    }

    public int deleteOrder(String onum) {
        return userMapper.deleteOrder(onum);
    }

    public int deleteOrder1(Integer oid) {
        return userMapper.deleteOrder1(oid);
    }
}
