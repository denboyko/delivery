package com.bambuk.delivery.controllers;


import com.bambuk.delivery.model.Product;
import com.bambuk.delivery.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(value = "/products")
public class ProductsAPI {

    @Autowired
    private ProductService productService;

    @RequestMapping(value = "/{productName}",  method = RequestMethod.GET)
    public Product getProductById(@PathVariable String productName) {

        Product product = productService.findByName(productName);
        return product;
    }

    @RequestMapping(value = "",  method = RequestMethod.GET)
    public List<Product> getAllProducts( ) {

        List<Product> productList = productService.getAll();
        return productList;
    }

    @RequestMapping(value = "/edit",  method = RequestMethod.POST)
    public void editProduct(@ModelAttribute Product product) {
        productService.editProduct(product);
    }

    @RequestMapping(value = "/add",  method = RequestMethod.POST)
    public void addProduct(@ModelAttribute Product product) {
        productService.addProduct(product);
    }

    @RequestMapping(value = "/{id}/delete",  method = RequestMethod.DELETE)
    public void editProduct(@PathVariable long id) {
        productService.deleteProduct(id);
    }
}
