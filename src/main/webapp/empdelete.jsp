<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Employee" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Employee</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: 'Segoe UI', sans-serif; background: #0D0D0D; min-height: 100vh; }
        .header { background: #FF5555; padding: 18px 40px; display: flex; align-items: center; gap: 16px; }
        .header a { color: #fff; text-decoration: none; font-size: 14px; }
        .header span { color: #fff; font-size: 18px; font-weight: bold; }
        .container { max-width: 500px; margin: 50px auto; background: #1a1a1a;
                     padding: 32px; border-radius: 14px; border: 1px solid #2a2a2a; }
        h2 { color: #FF5555; margin-bottom: 24px; font-size: 20px; }
        .search-row { display: flex; gap: 10px; margin-bottom: 24px; }
        .search-row input { flex: 1; padding: 11px 14px; background: #0D0D0D; border: 1px solid #333;
                            border-radius: 8px; font-size: 14px; color: #fff; }
        .search-row input:focus { outline: none; border-color: #FF5555; }
        .search-row button { padding: 11px 20px; background: #333; color: white;
                             border: none; border-radius: 8px; cursor: pointer; font-size: 14px; }
        .search-row button:hover { background: #444; }
        .detail-box { background: #0D0D0D; border: 1px solid #FF555533; border-radius: 10px; padding: 20px; margin: 16px 0; }
        .detail-row { display: flex; justify-content: space-between; padding: 9px 0;
                      border-bottom: 1px solid #1f1f1f; font-size: 14px; }
        .detail-row:last-child { border: none; }
        .detail-label { color: #888; font-weight: 600; }
        .detail-val { color: #fff; }
        .warning { background: #2a1500; color: #F1F95A; padding: 11px 14px;
                   border-radius: 8px; margin-bottom: 14px; border-left: 4px solid #F1F95A; font-size: 13px; }
        .btn-delete { width: 100%; padding: 13px; background: #FF5555; color: white; border: none;
                      border-radius: 8px; font-size: 15px; font-weight: 700; cursor: pointer; }
        .btn-delete:hover { background: #e04444; }
        .btn-back { display: block; text-align: center; margin-top: 14px; color: #888; text-decoration: none; font-size: 14px; }
        .btn-back:hover { color: #FF5555; }
        .error { background: #2a0a0a; color: #FF5555; padding: 11px 14px; border-radius: 8px;
                 margin-bottom: 18px; border-left: 4px solid #FF5555; font-size: 14px; }
    </style>
</head>
<body>
<div class="header">
    <a href="index.jsp">&#8592; Back</a>
    <span>Delete Employee</span>
</div>
<div class="container">
    <h2>&#128465;&#65039; Delete Employee</h2>
    <form action="DeleteEmployeeServlet" method="get">
        <div class="search-row">
            <input type="number" name="empno" placeholder="Enter Employee ID" min="1" required />
            <button type="submit">Search</button>
        </div>
    </form>
    <% String error = (String) request.getAttribute("error");
       if (error != null) { %><div class="error">&#9888; <%= error %></div><% } %>
    <% com.model.Employee emp = (com.model.Employee) request.getAttribute("employee");
       if (emp != null) { %>
    <div class="detail-box">
        <div class="detail-row"><span class="detail-label">Employee No</span><span class="detail-val"><%= emp.getEmpno() %></span></div>
        <div class="detail-row"><span class="detail-label">Name</span><span class="detail-val"><%= emp.getEmpName() %></span></div>
        <div class="detail-row"><span class="detail-label">Date of Joining</span><span class="detail-val"><%= emp.getDoj() %></span></div>
        <div class="detail-row"><span class="detail-label">Gender</span><span class="detail-val"><%= emp.getGender() %></span></div>
        <div class="detail-row"><span class="detail-label">Basic Salary</span><span class="detail-val">&#8377; <%= emp.getBsalary() %></span></div>
    </div>
    <div class="warning">&#9888; This action cannot be undone. Are you sure?</div>
    <form action="DeleteEmployeeServlet" method="post">
        <input type="hidden" name="empno" value="<%= emp.getEmpno() %>" />
        <button type="submit" class="btn-delete">&#128465;&#65039; Confirm Delete</button>
    </form>
    <% } %>
    <a href="index.jsp" class="btn-back">Cancel</a>
</div>
</body>
</html>