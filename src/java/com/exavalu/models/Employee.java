/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.exavalu.models;

import com.exavalu.services.DepartmentService;
import com.exavalu.services.EmployeeService;

import com.exavalu.services.RoleService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Map;
import org.apache.struts2.dispatcher.ApplicationMap;
import org.apache.struts2.dispatcher.SessionMap;
import org.apache.struts2.interceptor.ApplicationAware;
import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author Priyanka Jaiswal
 */
public class Employee extends ActionSupport implements ApplicationAware, SessionAware, Serializable {

    private String employeeId;
    private String firstName;
    private String lastName;
    private String phone;
    private String address;
    private String gender;
    private String age;
    private String departmentName;
    private String roleName;
    private String basicSalary;
    private String carAllowance;

    private String departmentId;
    private String roleId;

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

    public ArrayList getAllEmployees() throws Exception {
        //String result = "FAILURE";

        ArrayList emplist = EmployeeService.getInstance().getAllEmployees();

        return emplist;
    }

    public String doEdit() throws Exception {
        String result = "FAILURE";

        Employee emp = EmployeeService.getInstance().getEmployee(this.getEmployeeId());
        
        if (emp != null) {
            
            sessionMap.put("Emp", emp);
           System.out.println(emp.getDepartmentId());
            result = "SUCCESS";
        } else {
            System.out.println("returning Failure from doEdit method");
        }

        return result;
    }

    public String doSave() throws Exception {
        String result = "FAILURE";
        System.out.println(this.getDepartmentId());
         System.out.println(this.getRoleId());
        boolean success = EmployeeService.getInstance().updateEmployee(this);
        

        if (success) {

            ArrayList emplist = EmployeeService.getInstance().getAllEmployees();

            sessionMap.put("EmpList", emplist);

            result = "SUCCESS";
        } else {
            System.out.println("returning Failure from doSave method");
        }

        return result;
    }

    public String doSearch() throws Exception {
        String result = "SUCCESS";

        ArrayList empList = EmployeeService.getInstance().getSearchResult(this);
        

        

            sessionMap.put("SearchEmpList", empList);

           
        return result;
    }

    public String doAdd() throws Exception {
        String result = "FAILURE";

        boolean success = EmployeeService.getInstance().addnewEmployee(this);
        
        
        if (success) {

            ArrayList emplist = EmployeeService.getInstance().getAllEmployees();

            sessionMap.put("EmpList", emplist);

            result = "SUCCESS";
        } else {
            System.out.println("returning Failure from doAdd method");
        }

        return result;
    }

    public String getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getBasicSalary() {
        return basicSalary;
    }

    public void setBasicSalary(String basicSalary) {
        this.basicSalary = basicSalary;
    }

    public String getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(String departmentId) {
        this.departmentId = departmentId;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    /**
     * @return the carAllowance
     */
    public String getCarAllowance() {
        return carAllowance;
    }

    /**
     * @param carAllowance the carAllowance to set
     */
    public void setCarAllowance(String carAllowance) {
        this.carAllowance = carAllowance;
    }

    
}
