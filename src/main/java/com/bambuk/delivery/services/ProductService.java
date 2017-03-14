package com.bambuk.delivery.services;

import com.bambuk.delivery.model.Product;

/**
 * Created by bambu on 3/14/2017.
 */
public interface ProductService {
    Product findByName(String name);
}
