package com.bambuk.delivery.controllers;

import com.bambuk.delivery.model.User;
import com.bambuk.delivery.services.SecurityService;
import com.bambuk.delivery.services.UserService;
import com.bambuk.delivery.validator.UserValidator;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
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
    private UserValidator userValidator;

    @Autowired
    private SecurityService securityService;

    @RequestMapping(value = "/registration",  method = RequestMethod.POST)
    public User registration(@RequestBody User user) {


//        if (bindingResult.hasErrors()) {
//        return bindingResult;
//        }

        userService.save(user);
        securityService.autoLogin(user.getUsername(), user.getPassword());

        return user;
    }

    @RequestMapping(value = "/login",  method = RequestMethod.POST)
    public User login(@RequestBody String string) {

        Gson gson = new Gson();
        User user = gson.fromJson(string, User.class);

        securityService.autoLogin(user.getUsername(), user.getPassword());

        return user;
    }
}
