package com.bambuk.delivery.services.impl;

import com.bambuk.delivery.dao.ProductDao;
import com.bambuk.delivery.model.Product;
import com.bambuk.delivery.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao productDao;

    public Product findByName(String name) {

        return productDao.findByName(name);
    }

    @Override
    public void addProduct(Product product) {
        productDao.saveAndFlush(product);
    }

    @Override
    public void editProduct(Product product) {
        productDao.saveAndFlush(product);
    }

    @Override
    public void deleteProduct(long id) {
        productDao.delete(id);
    }

    @Override
    public List<Product> getAll() {
        return productDao.findAll();
    }
}
