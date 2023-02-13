<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <option value="0">--Select a District--</option>

<c:forEach var="district" items="${districtList}">
    <option value="${district.getDistrictCode()}" ${district.getDistrictCode() == user.getDistrictCode() ? "selected" : ""}>
        ${district.getDistrictName()}
    </option>
</c:forEach>