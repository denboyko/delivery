package com.bambuk.delivery.controllers;


import com.bambuk.delivery.model.Product;
import com.bambuk.delivery.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class RestAPI {

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/products/{productName}",  method = RequestMethod.GET)
    public Product getProductById(@PathVariable String productName) {

        Product product = productService.findByName(productName);
        return product;
    }

    @RequestMapping(value = "/products",  method = RequestMethod.GET)
    public List<Product> getAllProducts( ) {

        List<Product> productList = productService.getAll();
        return productList;
    }

    @RequestMapping(value = "/products/edit",  method = RequestMethod.POST)
    public void editProduct(@ModelAttribute Product product) {
        productService.editProduct(product);
    }

    @RequestMapping(value = "/products/add",  method = RequestMethod.POST)
    public void addProduct(@ModelAttribute Product product) {
        productService.addProduct(product);
    }

    @RequestMapping(value = "/products/{id}/delete",  method = RequestMethod.DELETE)
    public void editProduct(@PathVariable long id) {
        productService.deleteProduct(id);
    }
}
