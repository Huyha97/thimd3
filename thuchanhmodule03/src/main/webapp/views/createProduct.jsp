<%--
    Document   : ManagerProduct
    Created on : Dec 28, 2020, 5:19:02 PM
    Author     : trinh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="css/manager.css" rel="stylesheet" type="text/css"/>
    <style>
        img {
            width: 200px;
            height: 120px;
        }
    </style>
<body>

<!-- Edit Modal HTML -->
<form method="post" action="/home?action=create">
    <div class="modal-header">
        <h4 class="modal-title">Add Product</h4>
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    </div>
    <div class="modal-body">
        <div class="form-group">
            <label>name</label>
            <input name="name" type="text" class="form-control" required>
        </div>
        <div class="form-group">
            <label>price</label>
            <input name="price" type="text" class="form-control" required>
        </div>
        <div class="form-group">
            <label>quantity</label>
            <input name="quantity" type="number" class="form-control" required>
        </div>
        <div class="form-group">
            <label>color</label>
            <input name="color" type="text" class="form-control" required></input>
        </div>
        <div class="form-group">
            <label>description</label>
            <textarea name="description" class="form-control" required></textarea>
        </div>
        <td>
            <label>
                <select name="category">
                    <c:forEach items="${listClass}" var="c">
                        <option value="${c.id}">${c.name}</option>
                    </c:forEach>
                </select>
            </label>
        </td>

    </div>
    <div class="modal-footer">
        <input style="color: white; background-color: limegreen" type="submit" value="Add"/>
        <button style="color: white; background-color: darkgrey" type="button" name="back" onclick="history.back()">Back</button>
    </div>
</form>
<script src="js/manager.js" type="text/javascript"></script>
</body>
</html>