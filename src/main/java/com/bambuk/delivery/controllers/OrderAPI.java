package com.bambuk.delivery.controllers;

import com.bambuk.delivery.model.Order;
import com.bambuk.delivery.services.OrderService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
public class OrderAPI {

    @Autowired
    private OrderService orderService;


    @RequestMapping(value = "/order",  method = RequestMethod.POST)
    public void order(@RequestBody String request) {

        Gson gson = new Gson();
        Order order = gson.fromJson(request, Order.class);
        orderService.addOrder(order);
    }


    @RequestMapping(value = "/ordersAll",  method = RequestMethod.GET)
    public List<Order> getAllOrders() {
        return orderService.findAll();
    }

}
