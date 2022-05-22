<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Detail</title>
    <style>
        .container {
            position: fixed;
            top: 50%;
            left: 50%;
            -webkit-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
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
    <h1 style="text-align: center">Student Detail</h1>
    <c:if test="${student == null}">
        <h1>No Student With That ID</h1>
        <div style="padding-left: 225px">
            <button>Student List</button>
            <button>Edit...</button>
        </div>
    </c:if>

    <c:if test="${student != null}">
        <div class="mainBody" style="margin-top: 20px">
            <table style="border-spacing: 2em;padding-left: 194px">
                <tr>
                    <td style="font-weight: bold">StudentID</td>
                    <td>${student.getId()}</td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Name</td>
                    <td>${student.getName()}</td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Male</td>
                    <td><input type="checkbox" <c:if test="${student.isMale()}">checked</c:if> ></td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Birthday</td>
                    <td>${student.getBirthday()}</td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Place of Birth</td>
                    <td>${student.getPlaceOfBirth()}</td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Address</td>
                    <td>${student.getAddress()}</td>
                </tr>
                <tr>
                    <td style="font-weight: bold">Department</td>
                    <td>${student.getDepName()}</td>
                </tr>
            </table>
        </div>
        <div style="padding-left: 225px">
            <button onclick="window.location.href='/studentManager'">Student List</button>
            <button>Edit...</button>
        </div>
    </c:if>
</div>
</body>
</html>