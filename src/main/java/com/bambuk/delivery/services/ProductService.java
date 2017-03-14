package com.bambuk.delivery.services;

import com.bambuk.delivery.model.Product;

import java.util.List;

/**
 * Created by bambu on 3/14/2017.
 */
public interface ProductService {
    Product findByName(String name);
    void addProduct(Product product);
    void editProduct(Product product);
    void deleteProduct(long id);
    List<Product> getAll();
}
