<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>New Student</title>
    <style>
        .container {
            position: fixed;
            left: 45%;
            -webkit-transform: translate(-45%, 0%);
            transform: translate(-45%, 0%);
            width: 650px;
            height: 500px;
        }

        p {
            padding: 0;
            margin: 0;
        }

        /*table, th, td {*/
        /*    border: 1px solid black;*/
        /*}*/

        /*thead tr th {*/
        /*    background-color: aqua;*/
        /*}*/
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
<div class="container">
    <h1 style="text-align: center">New Student</h1>
    <div class="mainBody" style="margin-top: 20px">
        <table style="border-spacing: 2em;padding-left: 194px">
            <%--@elvariable id="student" type="java"--%>
            <form:form id="form" action="newStudentSubmit" method="POST" modelAttribute="student">
                <tr>
                    <td style="font-weight: bold">*StudentID:</td>
                    <td><form:input path="id" required='true' onblur="checkIdStudent(this)"/></td>
                    <td class="errorIdStudent" style="display: none;color: red">Id bị trùng</td>
                </tr>
                <tr>
                    <td style="font-weight: bold">*Name:</td>
                    <td><form:input path="name" required='true'/></td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Male:</td>
                    <td><form:checkbox path="male"/></td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Birthday:</td>
                    <td><form:input path="birthday" id="birthday"/></td>
                    <td>dd/mm/yyyy</td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Place of Birth:</td>
                    <td><form:input path="placeOfBirth"/></td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Address:</td>
                    <td><form:input path="address"/></td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Department</td>
                    <td>
                        <form:select path="depName">
                            <form:option value="Anh văn">Anh văn</form:option>
                            <form:option value="Kinh tế">Kinh tế</form:option>
                            <form:option value="Hóa học">Hóa học</form:option>
                            <form:option value="Sinh vật học">Sinh vật học</form:option>
                            <form:option value="Tin học" selected="selected">Tin học</form:option>
                            <form:option value="Vật lý">Vật lý</form:option>
                        </form:select>
                    </td>
                </tr>
            </form:form>
        </table>
    </div>
    <div style="padding-left: 225px">
        <button onclick="submit()">Submit</button>
        <button onclick="window.location.href='/studentManager'">Cancel</button>
    </div>
    <div style="padding-left: 225px;padding-top: 20px">
        <c:if test="${errorStudentExist != null}">
            <p style="color: red">${errorStudentExist}</p>
        </c:if>
    </div>
    <script>

        let checkId = true;

        function submit() {
            let form = document.getElementById('form');
            //reset all elements
            for (let i = 0; i < form.elements.length; i++) {
                form.elements[i].style.border = "1px solid black";
            }

            //check required
            for (let i = 0; i < form.elements.length; i++) {
                if (form.elements[i].value === '' && form.elements[i].hasAttribute('required')) {
                    form.elements[i].style.border = "1px solid red";
                    return false;
                }
            }

            //check birthday format
            let birthday = document.getElementById("birthday")
            let regBirthday = /(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d/;
            if (!birthday.value.match(regBirthday)) {
                birthday.style.border = "1px solid red";
                return false;
            }

            //check id
            if(checkId == true){
                return false;
            }


            form.submit();
        }

        function checkIdStudent(idStudentField) {
            let id = idStudentField.value;
            $.ajax({
                type: "POST",
                url: "/ajax/newStudent",
                data: {idStudent: id},
                dataType: "text",
                success: function (data) {
                    let isExist = data;
                    if (isExist == "true") {
                        let errorIdStudent = document.getElementsByClassName("errorIdStudent")[0];
                        errorIdStudent.style.display = "block";
                        checkId = true;
                    } else {
                        let errorIdStudent = document.getElementsByClassName("errorIdStudent")[0];
                        errorIdStudent.style.display = "none";
                        checkId = false;
                    }
                    console.log(checkId);
                },
            });
        }
    </script>
</div>
</body>
</html>