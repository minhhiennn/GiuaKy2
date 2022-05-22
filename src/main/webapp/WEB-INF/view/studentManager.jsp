<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Manager</title>
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

        table, th, td {
            border: 1px solid black;
        }

        thead tr th {
            background-color: aqua;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Student Manager</h1>
    <div style="background-color: green">
        <p style="padding-top: 2px;padding-bottom: 2px">Student List (${countListStudent})</p>
    </div>
    <div style="margin-top: 3px">
        <button onclick="window.location.href='/newStudent'">New ...</button>
        <button disabled>Delete</button>
    </div>
    <div class="mainBody" style="margin-top: 20px">
        <table>
            <thead>
            <tr>
                <th style="width: 0%">Edit</th>
                <th style="width: 0%">Selected</th>
                <th style="width: 1%">StudentID</th>
                <th style="width: 1%">Name</th>
                <th style="width: 1%">Birthday</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listStudent}" var="student">
                <tr>
                    <td>
                        <button onclick="window.location.href='/editStudent/${student.getId()}'">Edit...</button>
                    </td>
                    <td style="text-align: center"><input type="checkbox"></td>
                    <td><a href="/studentDetail/${student.getId()}">${student.getId()}</a></td>
                    <td>${student.getName()}</td>
                    <td>${student.getBirthday()}</td>
                </tr>
            </c:forEach>
            </tbody>
            <tfoot>
        </table>
    </div>
</div>
</body>
</html>