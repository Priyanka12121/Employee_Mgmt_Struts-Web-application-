<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <option value="0">--Select a State--</option>
<c:forEach var="state" items="${stateList}">
    <option value="${state.getStateCode()}" ${state.getStateCode() == user.getStateCode() ? "selected" : ""}>
        ${state.getStateName()}
    </option>
</c:forEach>