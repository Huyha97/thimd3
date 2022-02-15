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
<form method="post" action="/home?action=edit">
    <table>
        <tr>
            <td><input name="id" value="${product.id}" readonly ></td>

            <td><input name="name" value="${product.name}"></td>

            <td><input name="price" value="${product.price}"></td>

            <td><input name="quantity" value="${product.quantity}"></td>

            <td><input name="color" value="${product.color}"></td>

            <td><input name="description" value="${product.description}"></td>
            <td>
                <select name="category" value="${product.category}" >
                    <c:forEach items="${listClass}" var="c">
                        <option value="${c.id}">${c.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
    </table>
    <input style="color: white; background-color: limegreen" type="submit" value="Edit"/>
    <button style="color: white; background-color: darkgrey" type="button" name="back" onclick="history.back()">back</button>
</form>
</body>
</html>

</body>
</html>
