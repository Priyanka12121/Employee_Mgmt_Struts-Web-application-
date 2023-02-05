/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.services;

import com.exavalu.models.User;
import com.exavalu.utils.JDBCConnectionManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 *
 * @author Avijit Chattopadhyay
 */
public class UserService {

    public static UserService userService = null;

    private UserService() {
    }

    public static UserService getInstance() {
        if (userService == null) {
            return new UserService();
        } else {
            return userService;
        }
    }

    public boolean doSignUp(User user) {
        boolean success = false;
        ;

        try {
            Connection con = JDBCConnectionManager.getConnection();
            String sql = "INSERT INTO users (emailAddress, password, firstName, lastName, status) VALUES (?, ?, ?, ?, ?);";

            System.out.println("entering try block");
            
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setString(1, user.getEmailAddress());
            preparedStatement.setString(2, user.getPassword());
            preparedStatement.setString(3, user.getFirstName());
            preparedStatement.setString(4, user.getLastName());
            preparedStatement.setInt(5, 1);

            preparedStatement.executeUpdate();
            System.out.println("LoginService :: " + preparedStatement);

            success = true;

            //con.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return success;
    }
}
