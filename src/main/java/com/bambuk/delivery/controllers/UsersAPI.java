package com.bambuk.delivery.controllers;

import com.bambuk.delivery.model.User;
import com.bambuk.delivery.services.SecurityService;
import com.bambuk.delivery.services.UserService;
import com.bambuk.delivery.validator.UserValidator;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

/**
 * @author Den Boyko
 * @version 1.0
 */

@RestController
public class UsersAPI {

    @Autowired
    private UserService userService;


    @Autowired
    private SecurityService securityService;

    @RequestMapping(value = "/registration",  method = RequestMethod.POST)
    public User registration(@RequestBody String string) {


        ObjectMapper objectMapper = new ObjectMapper();
        User user = null;
        try {
            user = objectMapper.readValue(string, User.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
        if(userService.findByUsername(user.getUsername())==null) {
            userService.save(user);
        }
        securityService.autoLogin(user.getUsername(), user.getPassword());
        return user;
    }

    @RequestMapping(value = "/login",  method = RequestMethod.GET)
    public User login(@RequestParam String username, @RequestParam String password) {

        ObjectMapper objectMapper = new ObjectMapper();
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);

        securityService.autoLogin(username, password);

        return user;
    }
}
