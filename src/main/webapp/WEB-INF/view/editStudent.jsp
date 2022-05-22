<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Student</title>
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
</head>
<body>
<div class="container">
    <h1 style="text-align: center">Edit Student</h1>
    <div class="mainBody" style="margin-top: 20px">
        <table style="border-spacing: 2em;padding-left: 194px">
            <%--@elvariable id="newStudent" type="java"--%>
            <form:form id="form" action="/editStudent/${student.getId()}" method="POST" modelAttribute="newStudent">
                <tr>
                    <td style="font-weight: bold">*StudentID:</td>
                    <td><form:input path="id" value="${student.getId()}" required="true"/></td>
                </tr>
                <tr>
                    <td style="font-weight: bold">*Name:</td>
                    <td><form:input path="name" value="${student.getName()}" required="true"/></td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Male:</td>
                    <td><form:checkbox path="male" checked="${student.isMale() ? 'checked' : ''}"/></td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Birthday:</td>
                    <td><form:input id="birthday" path="birthday" value="${student.getBirthday()}"/></td>
                    <td>dd/mm/yyyy</td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Place of Birth:</td>
                    <td><form:input path="placeOfBirth" value="${student.getPlaceOfBirth()}"/></td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Address:</td>
                    <td><form:input path="address" value="${student.getAddress()}"/></td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Department</td>
                    <td>
                        <form:select path="depName">
                            <c:forEach var="department" items="${listDeparment}">
                                <form:option value="${department}"
                                             selected="${department.equals(student.getDepName()) ?'select':''}">${department}
                                </form:option>
                            </c:forEach>
                        </form:select>
                    </td>
                </tr>
            </form:form>
        </table>
    </div>
    <div style="padding-left: 225px">
        <button onclick="submit()">Update</button>
        <button onclick="window.location.href='/studentManager'">Cancel</button>
    </div>
    <div style="padding-left: 225px;padding-top: 20px">
        <c:if test="${error != null}">
            <p style="color: red">${error}</p>
        </c:if>
    </div>
    <div style="padding-left: 225px;padding-top: 20px">
        <c:if test="${errorStudentExist != null}">
            <p style="color: red">${errorStudentExist}</p>
        </c:if>
    </div>
    <script>
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
            let reg = /(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d/;
            if (!birthday.value.match(reg)) {
                birthday.style.border = "1px solid red";
                return false;
            }

            form.submit();
        }
    </script>
</div>
</body>
</html>