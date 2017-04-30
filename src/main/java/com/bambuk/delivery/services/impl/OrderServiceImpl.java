package com.bambuk.delivery.services.impl;


import com.bambuk.delivery.dao.OrderDao;
import com.bambuk.delivery.model.Order;
import com.bambuk.delivery.services.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;


    @Override
    public void addOrder(Order order) {
        orderDao.saveAndFlush(order);
    }

    @Override
    public void updateOrder(Order order) {
        orderDao.saveAndFlush(order);
    }

    @Override
    public void deleteOrder(Long id) {
        orderDao.delete(id);
    }

    @Override
    public Order getById(Long id) {
        return orderDao.getOne(id);
    }

    @Override
    public List<Order> findAll() {
        return orderDao.findAll();
    }

}
