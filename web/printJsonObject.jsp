<%-- 
    Document   : landingPage
    Created on : 22-Dec-2022, 12:00:33 PM
    Author     : Avijit Chattopadhyay
--%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/menu_css.css" rel="stylesheet">
        <!-- Custom styles for this template -->
        <link href="css/product.css" rel="stylesheet">
        
        <title>Employee Management</title>
    </head>
    
    <body>
        <main>
    
  
    <jsp:include page="menu.jsp"></jsp:include>
    

<br>
                    <div class="table-body">
                        <table id="table-id" class="table table-bordered table-hover" style="margin-top: -9.5px;">
                            <thead>                      <tr>
                                <th scope = "col">
                                    User Id
                                </th>
                                <th scope = "col">
                                    Name
                                </th>
                                <th scope = "col">
                                    User Name
                                </th>
                                <th scope = "col">
                                    Email
                                </th>
                                <th scope = "col">
                                    Phone
                                </th>
                                <th scope = "col">
                                    Website
                                </th>
                                 

                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${APIUsers}" var="APIUser">
                               <tr>
                                    <td>
                                        ${APIUser.getId()}
                                    </td>
                                    <td>
                                        ${APIUser.getName()}
                                    </td>
                                    <td>
                                        ${APIUser.getUsername()}
                                    </td>
                                    <td>
                                        ${APIUser.getEmail()}
                                    </td>
                                    <td>
                                        ${APIUser.getPhone()}
                                    </td>
                                    <td>
                                        ${APIUser.getWebsite()}
                                    </td>
                                    
                                    
                                   </tr>
                            </c:forEach>

                     </tbody>
                    </table>
                    
                    

        </div>

</main></body>
</html>
