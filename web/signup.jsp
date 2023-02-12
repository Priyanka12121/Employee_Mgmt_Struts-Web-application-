<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.104.2">
        <title>Sign in - Employee Management</title>

        <link href="css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

        <meta name="theme-color" content="#712cf9">


        <!-- Custom styles for this template -->
        <link href="css/signin.css" rel="stylesheet">

    </head>
    
    
    <script>
        function submitForm(event) {
            const countryCode = document.getElementById("countryCode");
            const stateCode = document.getElementById("stateCode");
            const districtCode = document.getElementById("districtCode");
            if (event.target.id === "countryCode") {
                stateCode.value = 0;
            }        
            signupForm.setAttribute("action", "PreSignUp");
            signupForm.submit();
        }

    </script>

    <body class="text-center">
        <main class="form-signin w-100 m-auto">
            <form action="SignUp" method="post" id="signupForm">
                <img
                    class="mb-4"
                    src="images/flower-logo.jpg" alt="" width="100" height="100"
                    alt=""
                    height="57"
                    />
                <h1 class="h3 mb-3 fw-normal">Create New Account</h1>

                <div class="form-floating">
                    <input
                        type="text"
                        class="form-control rounded-bottom-0"
                        id="floatingFirstName"
                        placeholder="First Name"
                        name="firstName"
                        value="${user.firstName}"
                        required
                        />
                    <label for="floatingFirstName">First Name</label>
                </div>

                <div class="form-floating">
                    <input
                        type="text"
                        class="form-control rounded-0"
                        id="floatingLastName"
                        placeholder="Last Name"
                        name="lastName"
                        value="${user.lastName}"
                        required
                        />
                    <label for="floatingLastName">Last Name</label>
                </div>

                <div class="form-floating">
                    <input
                        type="email"
                        class="form-control rounded-0"
                        id="floatingInput"
                        placeholder="name@example.com"
                        name="emailAddress"
                        value="${user.emailAddress}"
                        required
                        />
                    <label for="floatingInput">Email address</label>
                </div>

                <div class="form-floating">
                    <input
                        type="password"
                        class="form-control rounded-0 mb-0"
                        id="floatingPassword"
                        placeholder="Password"
                        name="password"
                        value="${user.password}"
                        required
                        />
                    <label for="floatingPassword">Password</label>
                </div>

                <div class="form-floating">
                    <select name="countryCode" class="form-select rounded-0" id="countryCode" onchange="submitForm(event)">
                        <option value="0">--Select a Country--</option>

                        <c:forEach var="country" items="${countryList}">
                            <option value="${country.getCountryCode()}" ${country.getCountryCode() == user.getCountryCode() ? "selected" : ""}>
                                ${country.getCountryName()}
                            </option>
                        </c:forEach>
                    </select>
                    <label for="countryCode">Country</label>
                </div>

                <div class="form-floating">
                    <select name="stateCode" class="form-select rounded-0" id="stateCode" onchange="submitForm(event)">
                        <option value="0">--Select a State--</option>

                        <c:forEach var="state" items="${stateList}">
                            <option value="${state.getStateCode()}" ${state.getStateCode() == user.getStateCode() ? "selected" : ""}>
                                ${state.getStateName()}
                            </option>
                        </c:forEach>
                    </select>
                    <label for="stateCode">State</label>
                </div>

                <div class="form-floating">
                    <select name="districtCode" class="form-select rounded-top-0" id="districtCode">
                        <option value="0">--Select a District--</option>

                        <c:forEach var="district" items="${districtList}">
                            <option value="${district.getDistrictCode()}" ${district.getDistrictCode() == user.getDistrictCode() ? "selected" : ""}>
                                ${district.getDistrictName()}
                            </option>
                        </c:forEach>
                    </select>
                    <label for="districtCode">District</label>
                </div>


                <button class="w-100 btn btn-lg btn-primary mt-2" type="submit">
                    Sign Up
                </button>
                <p class="mt-5 mb-3 text-muted">&copy; 2017-2022</p>
            </form>
        </main>
    </body>
    
</html>