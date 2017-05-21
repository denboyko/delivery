package com.bambuk.delivery.controllers;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;


import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MyController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String main() {
        return "index";
    }

    @RequestMapping(value = "/test", method = RequestMethod.GET)
    public String test() {
        return "test";
    }
}
