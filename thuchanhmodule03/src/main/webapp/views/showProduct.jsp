<%--
  Created by IntelliJ IDEA.
  User: This MC
  Date: 15/02/2022
  Time: 9:23 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<html>
<head>
    <title>Sản phẩm</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<div class="col-sm-12">
    <a href="/home?action=create" class="btn btn-success">Create new product</a> <br> 
    <form action="/home?action=search" method="post">
        <input name="search">
        <button type="submit">Search</button>
    </form>
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>#</th>
            <th>Product Name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Color</th>
            <th>description</th>
            <th>CateGory</th>
            <th colspan="2" style="text-align: center">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.listProduct}" var="product">
            <tr>
                <td>${product.id}</td>
                <td>${product.name}</td>
                <td>${product.price}</td>
                <td>${product.quantity}</td>
                <td>${product.color}</td>
                <td> ${product.description}</td>
                <td> ${product.nameCategory}</td>
                <td><a style="background-color: deepskyblue; color: white" href="/home?action=edit&&id=${product.id}" class="btn btn-warning">Edit</a></td>
                <td><a style="background-color: red; color: white" href="/home?action=delete&&id=${product.id}" class="btn btn-danger">Delete</a></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

</body>
</html>
