
<%@page import="com.exavalu.models.Role"%>
<%@page import="com.exavalu.services.RoleService"%>
<%@page import="com.exavalu.services.DepartmentService"%>
<%@page import="com.exavalu.models.Department"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.exavalu.models.User"%>
<%@page import="com.exavalu.models.Employee"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="s" uri="/struts-tags"%>
<!doctype html>
<html lang="en">
    <head>        
        <title>Employee Management Web Application</title>
        <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/product/">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/menu_css.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/product.css" rel="stylesheet">
    </head>
    <body >

            <main >

                <form action="SearchEmployee" method="Post">
                
                    


                <div class="form-floating">
                    <input type="input" class="form-control" id="floatingInput" placeholder="first Name" name="firstName">
                    <label for="floatingInput">First Name</label>
                </div>
                <div class="form-floating">
                    <input type="input" class="form-control" id="floatingInput" placeholder="last Name" name="lastName">
                    <label for="floatingPassword">Last Name</label>
                </div>
                <div class="form-floating">
                    <input type="input" class="form-control" id="floatingInput" placeholder="gender" name="gender">
                    <label for="floatingPassword">Gender</label>
                </div>

                <div class="form-floating">

                    <select name="departmentName" class="form-select" id="departmentName">
                        <option value="">Department</option>

                        <c:forEach var="dept" items="${DeptList}">
                            <option value=${dept.getDepartmentName()}> ${dept.getDepartmentName()} </option>

                        </c:forEach>

                    </select>
                </div>
                <div class="form-floating">

                    <select name="roleName" class="form-select" id="roleName">
                        <option value="">Role</option>
                        <c:forEach var="role" items="${RoleList}">
                            <option value=${role.getRoleName()}> ${role.getRoleName()} </option>
                        </c:forEach>

                    </select>
                </div>

                <div id="btm">
                    <button class="w-100 btn btn-lg btn-primary" type="submit">Search</button>
                </div>

                <p class="mt-5 mb-3 text-muted">&copy; 2017?2021</p>
            </form>



            <c:if test="${not empty sessionScope.SearchEmpList}">


                <c:set var="empList" value="${sessionScope.SearchEmpList}"/>
                <table class="table table-bordered table-hover">
                    <tr>
                        <td>
                            Employee Id
                        </td>
                        <td>
                            First Name
                        </td>
                        <td>
                            Last Name
                        </td>
                        <td>
                            Address
                        </td>
                        <td>
                            Phone
                        </td>
                        <td>
                            Gender
                        </td>
                        <td>
                            Age
                        </td>
                        <td>
                            Department
                        </td>
                        <td>
                            Role
                        </td>
                        <td>
                            Basic Salary
                        </td>
                        <td>
                            Car Allowance
                        </td>
                        <td>
                            Action
                        </td>

                    </tr>


                    <c:forEach var="emp" items="${empList}">

                        <tr>
                            <td>
                                ${emp.getEmployeeId()}
                            </td>
                            <td>
                                ${emp.getFirstName()}
                            </td>
                            <td>
                                ${emp.getLastName()}
                            </td>
                            <td>
                                ${emp.getAddress()}
                            </td>
                            <td>
                                ${emp.getPhone()}
                            </td>
                            <td>
                                ${emp.getGender()}
                            </td>
                            <td>
                                ${emp.getAge()}
                            </td>
                            <td>
                                ${emp.getDepartmentName()}
                            </td>
                            <td>
                                ${emp.getRoleName()}
                            </td>
                            <td>
                                ${emp.getBasicSalary()}
                            </td>
                            <td>
                                ${emp.getCarAllowance()}
                            </td>
                            <td> 

                                <a href=Edit?employeeId=${emp.getEmployeeId()}>
                                    Edit
                                </a>


                            </td>
                        </tr>

                    </c:forEach>



                </table>
            </c:if>
        </main>
    </body>
</html>

