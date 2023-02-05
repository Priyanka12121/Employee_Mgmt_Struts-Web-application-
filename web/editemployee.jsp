<%@page import="com.exavalu.models.Role"%>
<%@page import="com.exavalu.models.Department"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.exavalu.models.Employee"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <title> Employee Management</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="css/signin.css" rel="stylesheet">

    </head>

    <body class="text-center">


        <main class="form-signin w-100 m-auto">

           

            

            <form action="SaveEmployee" method="post">
                <img class="mb-4" src="images/flower-logo.jpg" alt="" width="200" height="200">
                <h1 class="h3 mb-3 fw-normal">Please edit employee data</h1>
                <div class="form-floating">             
                    <input type="text" class="form-control" id="floatingInput" placeholder="first name" name="employeeId" value=${Emp.getEmployeeId()} readonly>
                    <label for="floatingInput">Employee Id</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="first name" name="firstName" value=${Emp.getFirstName()}>
                    <label for="floatingInput">First Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="last name" name="lastName" value=${Emp.getLastName()}>
                    <label for="floatingInput">Last Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="address" name="address" value=${Emp.getAddress()}>
                    <label for="floatingInput">Address</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="phone" name="phone" value=${Emp.getPhone()}>
                    <label for="floatingInput">Phone</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="gender" name="gender" value=${Emp.getGender()}>
                    <label for="floatingInput">Gender</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="age" name="age" value=${Emp.getAge()}>
                    <label for="floatingInput">Age</label>
                </div>

                 <div class="form-floating">
                        <select name="departmentId" class="form-select" id="departmentId" required>
                            <c:forEach items="${DeptList}" var="dept" >
                                <option value=${dept.getDepartmentId()}<c:if test="${dept.getDepartmentName().equalsIgnoreCase(Emp.getDepartmentName())}" > selected </c:if>> ${dept.getDepartmentName()} </option>
                            </c:forEach>
                        </select>
                        <label for="floatingInput">Department</label>
                    </div>

              
                <div class="form-floating">                  

                        <select name="roleId" class="form-select" id="roleId">
                            <c:forEach items="${RoleList}" var="rol" >
                                <option value=${rol.getRoleId()}<c:if test="${rol.getRoleName().equalsIgnoreCase(Emp.getRoleName())}" > selected </c:if> > ${rol.getRoleName()}</option>
                            </c:forEach>
                            </select>
                            <label for="floatingInput">Role Name</label>
                        </div>



                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="basicSalary" name="basicSalary" value=${Emp.getBasicSalary()}>
                    <label for="floatingInput">Basic Salary</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="carAllowance" name="carAllowance" value=${Emp.getCarAllowance()}>
                    <label for="floatingInput">Car Allowance</label>
                </div>


                <button class="w-100 btn btn-lg btn-primary" type="submit">Save</button>

            </form>
        </main>



    </body>
</html>
