/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.utils;
import org.apache.log4j.Logger;
import java.io.*;
import java.sql.SQLException;
import java.util.*;

public class LogExample {
    
    static Logger log= Logger.getLogger(LogExample.class.getName());
    
    public static void main(String [] args)throws IOException,SQLException
    {
    log.debug("Hello this is a debug message");
    log.debug("Hello this is an info message");
    }
}
