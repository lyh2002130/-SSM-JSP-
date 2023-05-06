package com.itheima.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.itheima.pojo.*;
import com.itheima.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @RequestMapping("/login.do")
    public String adminLogin(Admin admin,User user,String status, HttpServletRequest request,Model model){
        if (status.equals("admin")){
            Admin admin1 = userService.getAdminByNameAndPass(admin);
            if (admin1!=null){
                request.getSession().setAttribute("ADMIN",admin1);
                request.getSession().removeAttribute("msg");
                return "admin_home";
            }else {
                model.addAttribute("msg","用户名或密码错误");
                return "login";
            }
        }else {
            User user1 = userService.getUserByNameAndPass(user);
            if (user1!=null){
                request.getSession().setAttribute("USER",user1);
                request.getSession().removeAttribute("msg");
                return "welcome";
            }else {
                model.addAttribute("msg","用户名或密码错误");
                return "login";
            }
        }
    }

    @RequestMapping("/logout.do")
    public String leave(HttpServletRequest request){
        request.getSession().removeAttribute("USER");
        return "index";
    }

    @GetMapping("/showCart.do")
    public String showCarts(HttpServletRequest request,Model model){
        User user = (User) request.getSession().getAttribute("USER");
        List<CartItem> cartItemList = userService.getCartItemByUid(user.getUid());
        Cart cart = new Cart();
        Map<Integer, CartItem> map = new HashMap<Integer, CartItem>();
        for (CartItem cartItem : cartItemList) {
            Integer pid = cartItem.getPid();
            Product product = userService.getProductByPid(pid);
            cartItem.setProduct(product);
            map.put(cartItem.getPid(),cartItem);
        }
        cart.setMap(map);
        Product product = (Product) request.getSession().getAttribute("product");
        if (product!=null){
            model.addAttribute(product);
        }
        model.addAttribute("CART", cart);
        return "cart";
    }

    @RequestMapping("/addCart.do")
    public String addCart(Integer pid,Integer num,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("USER");
        Integer uid = user.getUid();
        List<CartItem> cartItemList = userService.getCartItemByUid(uid);
        List<Integer> list = new ArrayList();
        Integer pid1 = null;
        for (CartItem item : cartItemList) {
            pid1 = item.getPid();
            list.add(pid1);
        }
        if (list.contains(pid)){
            CartItem cartItem = new CartItem();
            cartItem.setPid(pid);
            Product product = userService.getProductByPid(pid);
            cartItem.setPnum(num);
            cartItem.setSubTotal(product.getShop_price()*num);
            int i = userService.updateCartItemPnum(cartItem);
            if (i>0){
                System.out.println("成功");
            }
        }else {
            Product product = userService.getProductByPid(pid);
            double subTotal = product.getShop_price()*num;
            CartItem cartItem = new CartItem();
            cartItem.setPid(pid);
            cartItem.setUid(uid);
            cartItem.setPnum(num);
            cartItem.setSubTotal(subTotal);
            userService.addCartItem(cartItem);
        }
        return "forward:showCart.do";
    }

    @RequestMapping("/delProduct.do")
    public String deleteCart(Integer pid,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("USER");
        userService.deleteCartItem(pid,user.getUid());
        return "forward:showCart.do";
    }

    @RequestMapping("/clearCart.do")
    public String deleteAllCarts(HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("USER");
        Integer uid = user.getUid();
        userService.deleteAllCartItems(uid);
        return "forward:showCart.do";
    }

    @RequestMapping("/updatePnum.do")
    public String updatePnum(Integer pid, Integer num){
        int i = userService.updatePnum(pid, num);
        if (i>0){
            Product product = userService.getProductByPid(pid);
            double price = product.getShop_price();
            double subTotal = num * price;
            userService.updateTotal(pid,subTotal);
        }
        return "forward:showCart.do";
    }
//    购物车页面购买
    @RequestMapping("/showOrder.do")
    public String showOrder(Integer[] pids, HttpServletRequest request, Model model){
        User user = (User) request.getSession().getAttribute("USER");
        Integer uid = user.getUid();
        User user1 = userService.getUserByUsername(user.getUsername());
        model.addAttribute(user1);
        List<ProductVo> list = new ArrayList();
        double subTotal = 0;
        for (int i = 0; i < pids.length; i++) {
            Product product = userService.getProductByPid(pids[i]);
            CartItem cartItem = userService.getCartItemByPid(pids[i],uid);
            Integer pnum = cartItem.getPnum();
            double subTotal1 = cartItem.getSubTotal();
            ProductVo productVo = new ProductVo();
            productVo.setProduct(product);
            productVo.setPnum(pnum);
            subTotal += subTotal1;
            list.add(productVo);
        }
        model.addAttribute("subTotal",subTotal);
        model.addAttribute("plist",list);
        return "order";
    }
//    单个商品立即购买
    @RequestMapping("/showOrder1.do")
    public String showOrder(Integer pid, Integer num,HttpServletRequest request, Model model){
        User user = (User) request.getSession().getAttribute("USER");
        User user1 = userService.getUserByUsername(user.getUsername());
        model.addAttribute(user1);
//        request.getSession().setAttribute("pid1",pid);
        request.getSession().setAttribute("num",num);
        List<ProductVo> list = new ArrayList();
        Product product = userService.getProductByPid(pid);
        double shop_price = product.getShop_price();
        double subTotal = shop_price * num;
        ProductVo productVo = new ProductVo();
        productVo.setProduct(product);
        productVo.setPnum(num);
        list.add(productVo);
        model.addAttribute("subTotal",subTotal);
        model.addAttribute("plist",list);
        return "order";
    }

    @RequestMapping("/createOrder.do")
    @ResponseBody
    public void createOrder(String tel, String address, String receiver, Integer[] pids, double subTotal, HttpServletRequest request, HttpServletResponse response){
        User user = (User) request.getSession().getAttribute("USER");
        Integer uid = user.getUid();
        Order order = new Order();
        order.setUid(uid);
        String s = UUID.randomUUID().toString();
        order.setOnum(s);
        order.setReceiver(receiver);
        order.setAddress(address);
        order.setTel(tel);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        order.setTime(sdf.format(new Date()));
        order.setOstate("0");
        order.setOtotal(subTotal);
        int i = userService.addOrder(order);
        if (i>0){
            for (int i1 = 0; i1 < pids.length; i1++) {
                OrderItem order_item = new OrderItem();
                String s1 = UUID.randomUUID().toString();
                order_item.setId(s1);
                CartItem cartItem = userService.getCartItemByPid(pids[i1],uid);
//                判断购物车有没有这个商品
                if(cartItem == null){
                    Integer num = (Integer) request.getSession().getAttribute("num");
                    order_item.setPay_count(num);
                    Order order1 = userService.getOrderByOnum(s);
                    order_item.setOrder_id(order1.getOid());
                    order_item.setPid(pids[i1]);
                    userService.addOrderItem(order_item);
                }else {
                    Integer num = (Integer) request.getSession().getAttribute("num");
                    if (num != null){
                        if (num != cartItem.getPnum()){
                            order_item.setPay_count(num);
                            Order order1 = userService.getOrderByOnum(s);
                            order_item.setOrder_id(order1.getOid());
                            order_item.setPid(pids[i1]);
                            userService.addOrderItem(order_item);
                        }else {
                            order_item.setPay_count(cartItem.getPnum());
                            Order order1 = userService.getOrderByOnum(s);
                            order_item.setOrder_id(order1.getOid());
                            order_item.setPid(pids[i1]);
                            userService.addOrderItem(order_item);
                        }
                    }else {
                        order_item.setPay_count(cartItem.getPnum());
                        Order order1 = userService.getOrderByOnum(s);
                        order_item.setOrder_id(order1.getOid());
                        order_item.setPid(pids[i1]);
                        userService.addOrderItem(order_item);
                    }
                }
                }
            }
            request.getSession().setAttribute("pids",pids);
            try {
                response.getWriter().print("OK");
                request.getSession().setAttribute("s",s);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

//  订单页面去支付
    @RequestMapping("/payProduct.do")
    public String payProduct(double subTotal,HttpServletRequest request,Model model){
        User user = (User) request.getSession().getAttribute("USER");
        User user1 = userService.getUserByUsername(user.getUsername());
        Integer uid = user.getUid();
//        判断用户余额
        if (user1.getCount()<subTotal){
            model.addAttribute("USER",user1);
            return "payment";
        }else {
            String onum = (String) request.getSession().getAttribute("s");
            Integer[] pids = (Integer[]) request.getSession().getAttribute("pids");
            for (int i1 = 0; i1 < pids.length; i1++) {
                CartItem cartItem = userService.getCartItemByPid(pids[i1], uid);
//                判断购物车有没有这个商品
                if (cartItem==null){
                    Integer num = (Integer) request.getSession().getAttribute("num");
                    Product product1 = userService.getProductByPid(pids[i1]);
//                    判断商品库存够不够(从商品详情页面直接购买)
                    if (num>product1.getNum()){
                        Product product = userService.getProductByPid(pids[i1]);
                        model.addAttribute("product",product);
                        Order order = userService.getOrderByOnum(onum);
                        userService.deleteOrderItem(order.getOid());
                        userService.deleteOrder(onum);
                        request.getSession().removeAttribute("num");
                        //  ---- 跳的是方法
                        return "forward:showCart.do";
                    }
                    userService.lessNumByPid(pids[i1], num);
                }else {
                    Product product1 = userService.getProductByPid(pids[i1]);
//                    判断商品库存够不够（从购物车购买）
                    if (cartItem.getPnum()>product1.getNum()){
                        Product product = userService.getProductByPid(pids[i1]);
                        model.addAttribute("product",product);
                        Order order = userService.getOrderByOnum(onum);
                        userService.deleteOrderItem(order.getOid());
                        userService.deleteOrder(onum);
                        request.getSession().removeAttribute("num");
                        return "forward:showCart.do";
                    }
                    userService.deleteCartItem(pids[i1],uid);
                    userService.lessNumByPid(pids[i1], cartItem.getPnum());
                }
                request.getSession().removeAttribute("num");
            }
            userService.lessCountByUid(subTotal,uid);
            userService.updateOstate(onum);
            return "forward:getOrders.do";
        }
    }

//  我的订单页面去支付
    @RequestMapping("/payProduct1.do")
    public String payProduct1(double subTotal,HttpServletRequest request,Integer oid,Model model) {
        User user = (User) request.getSession().getAttribute("USER");
        User user1 = userService.getUserByUsername(user.getUsername());
//        判断账户余额够不够
        if (user1.getCount()<subTotal){
            model.addAttribute("USER",user1);
            return "payment";
        }else {
//            String onum = (String) request.getSession().getAttribute("s");
            List<OrderItem> orderItems = userService.getOrderItemsByOid(oid);
            for (OrderItem orderItem : orderItems) {
                Product product = userService.getProductByPid(orderItem.getPid());
//                判断商品库存够不够
                if (orderItem.getPay_count()>product.getNum()){
                    Product product1 = userService.getProductByPid(orderItem.getPid());
                    model.addAttribute("product",product1);
//                    Order order = userService.getOrderByOnum(onum);
//                    Order order = userService.getOrderByOid(oid);
//                    userService.deleteOrder(onum);
                    userService.deleteOrderItem(oid);
                    userService.deleteOrder1(oid);
                    return "forward:showCart.do";
                }
                userService.lessNumByPid(orderItem.getPid(), orderItem.getPay_count());
            }
            userService.lessCountByUid(subTotal,user.getUid());
            userService.updateOstate2(oid);
            return "forward:getOrders.do";
        }
    }

    @PostMapping("/register.do")
    public String register(User user){
        userService.addUser(user);
        return "login";
    }

    @GetMapping("/yzphone.do")
    @ResponseBody
    public void yzphone(HttpServletResponse response,String phone) throws IOException {
        User user = userService.getUserByTelephone(phone);
        if (user==null){
            response.getWriter().print(0);
        }else {
            response.getWriter().print(1);
        }
    }

    @GetMapping("/yzusername.do")
    @ResponseBody
    public void yzusername(HttpServletResponse response,String username) throws IOException {
        User user = userService.getUserByUsername(username);
        if (user==null){
            response.getWriter().print(0);
        }else {
            response.getWriter().print(1);
        }
    }

    @RequestMapping("/getOrders.do")
    public String getOrders(HttpServletRequest request,Model model,@RequestParam(name = "startPage",defaultValue = "1")Integer startPage){
        User user = (User) request.getSession().getAttribute("USER");
        PageHelper.startPage(startPage,6);
        List<OrderVo> orderVoList = userService.getOrdersByUid(user.getUid());
        for (OrderVo orderVo : orderVoList) {
            List<OrderItem> orderItemList = userService.getOrderItemsByOid(orderVo.getOid());
            List<OrderItem> orderItems = new ArrayList<OrderItem>();
            for (OrderItem orderItem : orderItemList) {
                Product product = userService.getProductByPid(orderItem.getPid());
                orderItem.setProduct(product);
                orderItems.add(orderItem);
            }
            orderVo.setOrderItems(orderItems);
        }
        PageInfo pageInfo = new PageInfo(orderVoList);
        model.addAttribute("PAGE",pageInfo);
        model.addAttribute("list",orderVoList);
        return "my_order";
    }

    @RequestMapping("/findProductByPid.do")
    public String findProductByPid(Integer pid,Model model){
        Product product = userService.getProductByPid(pid);
        model.addAttribute("PRODUCT",product);
        return "product_info";
    }

    @RequestMapping("/orderOstate.do")
    public String updateOrderOstate(HttpServletRequest request,Integer oid,String ostate){
        User user = (User) request.getSession().getAttribute("USER");
        if (ostate.equals("0")){
            System.out.println("付款成功");
            ostate = "1";
        } else if (ostate.equals("2")){
            ostate = "3";
        } else if (ostate.equals("3")){

        }
        int i = userService.updateOstate1(ostate, oid, user.getUid());
        if (i>0){
            System.out.println("修改成功");
        }
        return "forward:getOrders.do";
    }

    @RequestMapping("/updateCount.do")
    @ResponseBody
    public void updateCount(HttpServletRequest request,HttpServletResponse response,Integer count) throws IOException {
        User user = (User) request.getSession().getAttribute("USER");
        int i = userService.addCount(user.getUid(),count);
        if (i>0){
            response.getWriter().print("OK");
        }else {
            response.getWriter().print("NO");
        }

    }

    @RequestMapping("/deleteOrder.do")
    public String deleteOrder(Integer oid){
        userService.deleteOrderItem(oid);
        userService.deleteOrder1(oid);
        return "forward:getOrders.do";
    }
}
