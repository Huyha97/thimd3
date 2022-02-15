
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
<body>
<form method="post" action="/home?action=edit" >
    <div class="modal-header">
        <h4 class="modal-title">Edit Product</h4>
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
    </div>
    <div class="modal-body">
        <div class="form-group">
            <label>ID</label>
            <input value="${product.id}" name="id" type="text" class="form-control" readonly required>
        </div>
        <div class="form-group">
            <label>name</label>
            <input value="${product.name}" name="name" type="text" class="form-control" required>
        </div>
        <div class="form-group">
            <label>price</label>
            <input value="${product.price}" name="price" type="number" class="form-control" required>
        </div>
        <div class="form-group">
            <label>quantity</label>
            <input value="${product.quantity}" name="quantity" type="number" class="form-control" required>
        </div>
        <div class="form-group">
            <label>color</label>
            <input value="${product.color}" name="color" type="text" class="form-control" required>
        </div>
        <div class="form-group">
            <label>Description</label>
            <textarea name="description" class="form-control" required>${product.description}</textarea>
        </div>
    <td>
                        <select name="category" value="${product.category}" >
                            <c:forEach items="${listClass}" var="c">
                                <option value="${c.id}">${c.name}</option>
                            </c:forEach>
                        </select>
                    </td>
    </div>
    <div class="modal-footer">
        <input style="color: white; background-color: limegreen" type="submit" value="Edit"/>
        <button style="color: white; background-color: darkgrey" type="button" name="back" onclick="history.back()">Back</button>
    </div>
</form>
<script src="js/manager.js" type="text/javascript"></script>
</body>
</html>

