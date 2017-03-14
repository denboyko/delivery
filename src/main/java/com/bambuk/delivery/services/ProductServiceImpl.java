package com.bambuk.delivery.services;

import com.bambuk.delivery.dao.ProductDao;
import com.bambuk.delivery.model.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by bambu on 3/14/2017.
 */
@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDao productDao;

    public Product findByName(String name) {

        return productDao.findByName(name);
    }
}
