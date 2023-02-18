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
import java.time.LocalDateTime;
import org.apache.log4j.Logger;

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
       boolean result = false;

        String firstName = user.getFirstName();
        String lastName = user.getLastName();
        String emailAddress = user.getEmailAddress();
        String password = user.getPassword();
        String countryCode = user.getCountryCode();
        String stateCode = user.getStateCode();
        String districtCode = user.getDistrictCode();

        try {
            if (firstName != null && lastName != null && emailAddress != null && password != null && !"0".equals(countryCode) && !"0".equals(stateCode) && !"0".equals(districtCode)) {
                Connection con = JDBCConnectionManager.getConnection();
                String sql = "INSERT INTO users (firstName, lastName, emailAddress, password, countryCode, stateCode, districtCode, status) VALUES (?, ?, ?, ? ,? ,? ,? ,? );";
                PreparedStatement preparedStatement = con.prepareStatement(sql);

                preparedStatement.setString(1, firstName);
                preparedStatement.setString(2, lastName);
                preparedStatement.setString(3, emailAddress);
                preparedStatement.setString(4, password);
                preparedStatement.setString(5, countryCode);
                preparedStatement.setString(6, stateCode);
                preparedStatement.setString(7, districtCode);
                 preparedStatement.setInt(8, 1);
                preparedStatement.executeUpdate();
                result = true;
              
            }
        } catch (SQLException ex) {
           
           Logger log = Logger.getLogger(UserService.class.getName());
           log.error(LocalDateTime.now() + " " + ex.getMessage());
        }

        return result;
    }
}
