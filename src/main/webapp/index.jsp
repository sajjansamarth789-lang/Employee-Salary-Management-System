<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Salary Management</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: 'Segoe UI', sans-serif; background: #0D0D0D; min-height: 100vh; }
        .header { background: #5332C9; padding: 22px 40px; text-align: center; }
        .header h1 { color: #F1F95A; font-size: 26px; letter-spacing: 1px; }
        .header p { color: #ffffff99; font-size: 13px; margin-top: 4px; }
        .container { max-width: 720px; margin: 50px auto; padding: 0 20px; }
        .msg { background: #1a1a1a; color: #F1F95A; padding: 12px 20px; border-radius: 8px;
               margin-bottom: 24px; border-left: 4px solid #F1F95A; font-size: 14px; }
        .card-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 18px; }
        .card { background: #1a1a1a; border: 1px solid #2a2a2a; border-radius: 12px;
                padding: 28px; text-align: center; text-decoration: none; color: #fff;
                transition: transform 0.2s, border-color 0.2s; }
        .card:hover { transform: translateY(-5px); border-color: #5332C9; }
        .card .icon { font-size: 38px; margin-bottom: 12px; }
        .card h3 { font-size: 16px; color: #ffffff; }
        .card p { font-size: 13px; color: #888; margin-top: 6px; }
        .card.add:hover { border-color: #F1F95A; }
        .card.add h3 { color: #F1F95A; }
        .card.update:hover { border-color: #5332C9; }
        .card.update h3 { color: #a78bfa; }
        .card.delete:hover { border-color: #FF5555; }
        .card.delete h3 { color: #FF5555; }
        .card.display:hover { border-color: #5332C9; }
        .card.display h3 { color: #60a5fa; }
        .card.reports { grid-column: span 2; background: #5332C9; border: none; }
        .card.reports h3 { color: #F1F95A; font-size: 17px; }
        .card.reports p { color: #ffffffaa; }
        .card.reports:hover { transform: translateY(-5px); border-color: transparent; background: #6344e0; }
    </style>
</head>
<body>
<div class="header">
    <h1>&#128188; Employee Salary Management System</h1>
    <p>Manage your workforce efficiently</p>
</div>
<div class="container">
    <% String msg = request.getParameter("msg");
       if (msg != null && !msg.isEmpty()) { %>
        <div class="msg">&#10003; <%= msg %></div>
    <% } %>
    <div class="card-grid">
        <a href="AddEmployeeServlet" class="card add">
            <div class="icon">&#10133;</div>
            <h3>Add Employee</h3>
            <p>Register a new employee</p>
        </a>
        <a href="UpdateEmployeeServlet" class="card update">
            <div class="icon">&#9999;&#65039;</div>
            <h3>Update Employee</h3>
            <p>Modify existing records</p>
        </a>
        <a href="DeleteEmployeeServlet" class="card delete">
            <div class="icon">&#128465;&#65039;</div>
            <h3>Delete Employee</h3>
            <p>Remove an employee record</p>
        </a>
        <a href="DisplayEmployeeServlet" class="card display">
            <div class="icon">&#128269;</div>
            <h3>Display Employees</h3>
            <p>View all employee records</p>
        </a>
        <a href="report_form.jsp" class="card reports">
            <div class="icon">&#128202;</div>
            <h3>Reports</h3>
            <p>Generate reports by name, service years, or salary</p>
        </a>
    </div>
</div>
</body>
</html>