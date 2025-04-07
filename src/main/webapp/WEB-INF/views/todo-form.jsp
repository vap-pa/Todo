<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>${mode} Todo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-4">
    <h1>${mode} Todo</h1>
    <form action="/save" method="post">
        <input type="hidden" name="id" value="${todo.id}">
        
        <div class="mb-3">
            <label class="form-label">Title</label>
            <input type="text" class="form-control" name="title" 
                   value="${todo.title}" required>
        </div>
        
        <div class="mb-3">
            <label class="form-label">Description</label>
            <textarea class="form-control" name="description">${todo.description}</textarea>
        </div>
        
        <div class="mb-3 form-check">
            <input type="checkbox" class="form-check-input" name="completed"
                   ${todo.completed ? 'checked' : ''}>
            <label class="form-check-label">Completed</label>
        </div>
        
        <button type="submit" class="btn btn-primary">Save</button>
        <a href="/" class="btn btn-secondary">Cancel</a>
    </form>
</div>
</body>
</html>