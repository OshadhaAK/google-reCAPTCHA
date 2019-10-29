<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Maven + Spring MVC</title>

    <script src='https://www.google.com/recaptcha/api.js'></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>

<body>

<div class="container">
    <h2>Add User</h2>
    <form:form method="post" modelAttribute="message" action="" >
        <div class="form-group">
            <label for="name">Name</label>
            <form:input type="text" class="form-control" path="name" id="name"  placeholder="Enter Name" />

        </div>

        <div class="form-group">
            <label for="description">Description</label>
            <form:input type="text" class="form-control" path="description" id="description" placeholder="Description" />
        </div>


        <div class="col-12 form-group">
            <div class="g-recaptcha" data-sitekey="6Lc21r0UAAAAACFWkWuHI7v205nrZ9wbMkdMfJu_" data-callback="submitUserForm"></div>

        </div></br>
        <%--<div id="g-recaptcha-error" style="color: red">--%>
            <%----%>

        <%--</div>--%>


        <button type="submit" id="button" class="btn btn-primary" disabled>add</button>
    </form:form>
</div>



<script>
    function submitUserForm() {
        var response = grecaptcha.getResponse();
        //$("#response").val(response);
        //console.log("data:",response);
        //alert(response);
        // var name = $('#name').val();
        // var description = $('#description').val();
         var url = '/submit';
         var data = {response :response};
        $.ajax({
            url: url,
            dataType: "json",
            contentType: "application/json",
            data: JSON.stringify(data),
            type: 'POST',
            success: function (res) {
                alert("data"+res.responseText);
                console.log("data:"+res.responseText);
            },
            error: function (result) {
                alert("result"+result);
                console.log(result);
                if (result.responseText == "res"){
                    $('#button').removeAttr("disabled");
                }
            }

        });

        // if(response.length == 0) {
        //     document.getElementById('g-recaptcha-error').innerHTML = '<span style="color:red;">This field is required.</span>';
        //     return false;
        // }
        // return true;
    }

</script>

</body>
</html>