package com.bambuk.delivery.controllers;

import com.bambuk.delivery.model.Order;
import com.bambuk.delivery.services.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
public class OrderAPI {

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/order",  method = RequestMethod.POST)
    public void order(@RequestBody Order order) {
        orderService.addOrder(order);
    }


    @RequestMapping(value = "/ordersAll",  method = RequestMethod.GET)
    public List<Order> getAllOrders() {
        return orderService.findAll();
    }

}
