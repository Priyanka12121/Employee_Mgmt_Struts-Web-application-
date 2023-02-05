<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Kill the user's session -->
<% session.invalidate(); %>
<jsp:forward page="landingPage.jsp"/>
