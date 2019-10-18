<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Maven + Spring MVC</title>

    <script src='https://www.google.com/recaptcha/api.js'></script>

</head>

<body>

<div class="container">
    <h2>Add User</h2>
    <form:form method="post" modelAttribute="message" action="submit" onsubmit="return submitUserForm();">
        <div class="form-group">
            <label for="name">Name</label>
            <form:input type="text" class="form-control" path="name" id="name"  placeholder="Enter Name" />

        </div>

        <div class="form-group">
            <label for="description">Description</label>
            <form:input type="text" class="form-control" path="description" id="description" placeholder="Description" />
        </div>


        <div class="col-12 form-group">
            <div class="g-recaptcha" data-sitekey="6Lc21r0UAAAAACFWkWuHI7v205nrZ9wbMkdMfJu_" data-callback="correctCaptcha"></div>

        </div>
        <div id="g-recaptcha-error"></div>
        <button type="submit" id="button" class="btn btn-primary">add</button>
    </form:form>
</div>



<script>
    function submitUserForm() {
        var response = grecaptcha.getResponse();
        if(response.length == 0) {
            document.getElementById('g-recaptcha-error').innerHTML = '<span style="color:red;">This field is required.</span>';
            return false;
        }
        return true;
    }
    // var correctCaptcha = function(response) {
    //     alert(decodeURI(response));
    // };
</script>
<script src="${coreJs}"></script>
<script src="${bootstrapJs}"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

</body>
</html>