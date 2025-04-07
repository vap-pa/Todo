<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Todos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h1 class="mb-4">Todo List</h1>
    <a href="/add" class="btn btn-primary mb-3">Add Todo</a>
    
    <table class="table table-striped">
        <thead>
            <tr>
                <th>Title</th>
                <th>Description</th>
                <th>Status</th>
                <th>Created At</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${todos}" var="todo">
                <tr>
                    <td>${todo.title}</td>
                    <td>${todo.description}</td>
                    <td>
                        <c:if test="${todo.completed}">
                            <span class="badge bg-success">Completed</span>
                        </c:if>
                        <c:if test="${not todo.completed}">
                            <span class="badge bg-warning">Pending</span>
                        </c:if>
                    </td>
                    <td>${todo.createdAt}</td>
                    <td>
                        <a href="/edit/${todo.id}" class="btn btn-sm btn-secondary">Edit</a>
                        <a href="/delete/${todo.id}" class="btn btn-sm btn-danger">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>