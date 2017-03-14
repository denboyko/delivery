package com.bambuk.delivery.controllers;


import com.bambuk.delivery.model.Product;
import com.bambuk.delivery.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestAPI {

    @Autowired
    private ProductService productService;

    @RequestMapping("/product/{productName}")
    public Product product(@PathVariable String productName) {//REST Endpoint.

        Product product = productService.findByName(productName);
        return product;
    }
}
