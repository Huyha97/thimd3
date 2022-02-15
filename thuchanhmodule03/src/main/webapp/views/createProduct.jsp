<%--
  Created by IntelliJ IDEA.
  User: This MC
  Date: 15/02/2022
  Time: 9:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style>
        td{
            height: 50px;
            width: 100px;
        }
        table , td , tr , th {
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<form method="post" action="/home?action=create">
    <table>
        <tr>
            <td><label>
                <input name="name" placeholder="input name">
            </label></td>

            <td><label>
                <input name="price" placeholder="input price">
            </label></td>

            <td><label>
                <input name="quantity" placeholder="input quantity">
            </label></td>

            <td><label>
                <input name="color" placeholder="input color">
            </label></td>

            <td><label>
                <input name="description" placeholder="input description">
            </label></td>
            <td>
                <label>
                    <select name="category">
                        <c:forEach items="${listClass}" var="c">
                            <option value="${c.id}">${c.name}</option>
                        </c:forEach>
                    </select>
                </label>
            </td>
        </tr>
    </table>
    <button type="submit">Create</button>
</form>
</body>
</html>

