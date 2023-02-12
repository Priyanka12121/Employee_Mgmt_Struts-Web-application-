/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

import com.exavalu.services.DepartmentService;
import com.exavalu.services.EmployeeService;
import com.exavalu.services.GeoMapService;
import com.exavalu.services.LoginService;
import com.exavalu.services.RoleService;
import com.exavalu.services.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Map;
import org.apache.struts2.dispatcher.ApplicationMap;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;

public class User extends ActionSupport implements ApplicationAware, SessionAware, Serializable {

    private String firstName;
    private String lastName;
    private String emailAddress;
    private String password;
    private int status;
    private String countryCode;
    private String stateCode;
    private String districtCode;


    private SessionMap<String, Object> sessionMap = (SessionMap) ActionContext.getContext().getSession();

    private ApplicationMap map = (ApplicationMap) ActionContext.getContext().getApplication();

    @Override
    public void setApplication(Map<String, Object> application) {
        map = (ApplicationMap) application;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        sessionMap = (SessionMap) session;
    }

    public String doLogin() throws Exception {
        String result = "FAILURE";

        boolean success = LoginService.getInstance().doLogin(this);

        if (success) {
            System.out.println("returning Success from doLogin method");
            sessionMap.put("Loggedin", this);
            ArrayList emplist = EmployeeService.getInstance().getAllEmployees();
            ArrayList deptList = DepartmentService.getAllDepartment();

            ArrayList roleList = RoleService.getAllRole();
            sessionMap.put("EmpList", emplist);
            sessionMap.put("DeptList", deptList);
            sessionMap.put("RoleList", roleList);
            result = "SUCCESS";
        } else {
            System.out.println("returning Failure from doLogin method");
        }

        return result;
    }
    
    public String doPreSignUp() throws Exception {
        String result = "SUCCESS";

        ArrayList countryList = GeoMapService.getAllCountries();
        ArrayList stateList = null;
        ArrayList districtList = null;

        sessionMap.put("countryList", countryList);

        if (this.countryCode != null && this.stateCode != null) {
            stateList = GeoMapService.getStatesByCountryCode(this.countryCode);
            districtList = GeoMapService.getDistrictsByStateCode(this.stateCode);
            sessionMap.put("stateList", stateList);
            sessionMap.put("districtList", districtList);
            sessionMap.put("user", this);
            result = "SUCCESS";
        } else if (this.countryCode != null) {
            stateList = GeoMapService.getStatesByCountryCode(this.countryCode);
            sessionMap.put("stateList", stateList);
            sessionMap.put("user", this);
            result = "SUCCESS";
        }

        return result;
    }


    public String doSignUp() throws Exception {
        String result = "FAILURE";

        boolean success = UserService.getInstance().doSignUp(this);

        if (success) {
            System.out.println("returning Success from doSignUp method");
            result = "SUCCESS";
        } else {
            System.out.println("returning Failure from doSignUp method");
        }

        return result;
    }

    public String doLogout() throws Exception {
        String result = "SUCCESS";

        System.out.println("logging out");
        sessionMap.clear();
        return result;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    /**
     * @return the emailAddress
     */
    public String getEmailAddress() {
        return emailAddress;
    }

    /**
     * @param emailAddress the emailAddress to set
     */
    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    /**
     * @return the countryCode
     */
    public String getCountryCode() {
        return countryCode;
    }

    /**
     * @param countryCode the countryCode to set
     */
    public void setCountryCode(String countryCode) {
        this.countryCode = countryCode;
    }

    /**
     * @return the stateCode
     */
    public String getStateCode() {
        return stateCode;
    }

    /**
     * @param stateCode the stateCode to set
     */
    public void setStateCode(String stateCode) {
        this.stateCode = stateCode;
    }

    /**
     * @return the districtCode
     */
    public String getDistrictCode() {
        return districtCode;
    }

    /**
     * @param districtCode the districtCode to set
     */
    public void setDistrictCode(String districtCode) {
        this.districtCode = districtCode;
    }

}
