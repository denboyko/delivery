package com.bambuk.delivery.controllers;

import com.bambuk.delivery.model.Product;
import com.bambuk.delivery.model.User;
import com.bambuk.delivery.services.SecurityService;
import com.bambuk.delivery.services.UserService;
import com.bambuk.delivery.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author Den Boyko
 * @version 1.0
 */
public class UsersAPI {

    @Autowired
    private UserService userService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private SecurityService securityService;

    @RequestMapping(value = "/registration",  method = RequestMethod.POST)
    public User registration(@ModelAttribute User user, BindingResult bindingResult) {

        userValidator.validate(user, bindingResult);

//        if (bindingResult.hasErrors()) {
//        return bindingResult;
//        }

        userService.save(user);
        securityService.autoLogin(user.getUsername(), user.getConfirmPassword());

        return user;
    }

    @RequestMapping(value = "/login",  method = RequestMethod.POST)
    public User login(@ModelAttribute User user, BindingResult bindingResult) {

        securityService.autoLogin(user.getUsername(), user.getConfirmPassword());

        return user;
    }
}
