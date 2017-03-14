package com.bambuk.delivery.dao;

import com.bambuk.delivery.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by bambu on 3/14/2017.
 */
public interface OrderDao extends JpaRepository<Order, Long> {
}
