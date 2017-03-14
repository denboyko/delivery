package com.bambuk.delivery.dao;

import com.bambuk.delivery.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by bambu on 3/14/2017.
 */
public interface ProductDao  extends JpaRepository<Product, Long> {
    Product findByName(String name);
}
