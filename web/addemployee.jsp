<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  

<%@page import="com.exavalu.models.Role"%>
<%@page import="com.exavalu.models.Department"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.108.0">
        <title>Employee Management</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/sign-in/">





        <link href="css/bootstrap.min.css" rel="stylesheet"> 

        <!-- Favicons -->
        <link rel="apple-touch-icon" href="/docs/5.3/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
        <link rel="manifest" href="/docs/5.3/assets/img/favicons/manifest.json">
        <link rel="mask-icon" href="/docs/5.3/assets/img/favicons/safari-pinned-tab.svg" color="#712cf9">
        <link rel="icon" href="/docs/5.3/assets/img/favicons/favicon.ico">
        <meta name="theme-color" content="#712cf9">

        <link href="css/signin.css" rel="stylesheet">



        <!-- Custom styles for this template -->

    </head>
    <body class="text-center">

        <main class="form-signin w-100 m-auto">
            <form action="AddEmployee" method="post">
                <img class="mb-4" src="images/flower-logo.jpg" alt="" width="100" height="100">
                <h1 class="h3 mb-3 fw-normal">Please add employee details</h1>


                <div class="form-floating">
                    <input type="text" class="form-control"  placeholder="Text" name="firstName">
                    <label for="floatingPassword">First Name</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control"  placeholder="Text" name="lastName">
                    <label for="floatingPassword">Last Name</label>
                </div>


                <div class="form-floating">
                    <input type="text" class="form-control" id="text" placeholder="address" name="address" >
                    <label for="floatingInput">Address</label>
                </div>


                <div class="form-floating">
                    <input type="tel" class="form-control" id="text" placeholder="phone" name="phone">
                    <label for="floatingInput">Phone</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="text" placeholder="gender" name="gender" >
                    <label for="floatingInput">Gender</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="text" placeholder="age" name="age" >
                    <label for="floatingInput">Age</label>
                </div>

                  
                    <div class="form-floating">
                    <select name="departmentId" class="form-select" id="departmentId">
                        <option value="0">Select a Department</option>
                        <c:forEach items="${DeptList}" var="dept">
                            <option value="${dept.getDepartmentId()}"> ${dept.getDepartmentName()} </option>
                            
                        </c:forEach>


                    </select>
                </div 
                
               
                <div class="form-floating">
                    <select name="roleId" class="form-select" id="roleId">
                        <option value="0">Select a Role</option>
                        <c:forEach items="${RoleList}" var="role">
                            <option value="${role.getRoleId()}"> ${role.getRoleName()} </option>
                        </c:forEach>
                    </select>
                </div>
                    
               
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="basicSalary" name="basicSalary" >
                    <label for="floatingInput">Basic Salary</label>
                </div>
                <div class="form-floating">
                    <input type="text" class="form-control" id="floatingInput" placeholder="carAllowance" name="carAllowance" >
                    <label for="floatingInput">Car Allowance</label>
                </div>
                

                <button class="w-100 btn btn-lg btn-primary" type="submit">Add</button>



            </form>
        </main>



    </body>
</html>
