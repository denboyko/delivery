package com.bambuk.delivery.services;

import com.bambuk.delivery.model.Order;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by bambu on 3/14/2017.
 */

public interface OrderService {
    void addOrder(Order order);
    void updateOrder(Order order);
    void deleteOrder(Long id);
    Order getById(Long id);
    List<Order> findAll();

}
