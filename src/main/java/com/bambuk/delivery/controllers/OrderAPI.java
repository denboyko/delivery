package com.bambuk.delivery.controllers;

import com.bambuk.delivery.model.Order;
import com.bambuk.delivery.model.Product;
import com.bambuk.delivery.services.OrderService;
import com.bambuk.delivery.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
public class OrderAPI {

    @Autowired
    private OrderService orderService;

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/order",  method = RequestMethod.POST)
    public void order(@ModelAttribute Order order) {
        orderService.addOrder(order);
    }


    @RequestMapping(value = "/orders",  method = RequestMethod.GET)
    public List<Order> getAllOrders() {
        List<Order> orderList =  orderService.findAll();
        return orderList;
    }

}
