package com.se.example.elkdemo.controllers;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/")
public class UserController {

    private static final Logger LOG = Logger.getLogger(UserController.class.getName());

    @Autowired
    private Environment env;

    @RequestMapping("/")
    public String home() {
        String home = "User-Service running at port: " + env.getProperty("local.server.port");
        LOG.log(Level.INFO, home);
        return home;
    }
}
