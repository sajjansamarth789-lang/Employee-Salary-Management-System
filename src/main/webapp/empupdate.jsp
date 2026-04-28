<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Employee" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Employee</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: 'Segoe UI', sans-serif; background: #0D0D0D; min-height: 100vh; }
        .header { background: #5332C9; padding: 18px 40px; display: flex; align-items: center; gap: 16px; }
        .header a { color: #F1F95A; text-decoration: none; font-size: 14px; }
        .header span { color: #fff; font-size: 18px; font-weight: bold; }
        .container { max-width: 500px; margin: 50px auto; background: #1a1a1a;
                     padding: 32px; border-radius: 14px; border: 1px solid #2a2a2a; }
        h2 { color: #a78bfa; margin-bottom: 24px; font-size: 20px; }
        .search-row { display: flex; gap: 10px; margin-bottom: 24px; }
        .search-row input { flex: 1; padding: 11px 14px; background: #0D0D0D; border: 1px solid #333;
                            border-radius: 8px; font-size: 14px; color: #fff; }
        .search-row input:focus { outline: none; border-color: #5332C9; }
        .search-row button { padding: 11px 20px; background: #5332C9; color: white;
                             border: none; border-radius: 8px; cursor: pointer; font-size: 14px; font-weight: 600; }
        .search-row button:hover { background: #6344e0; }
        .form-group { margin-bottom: 18px; }
        label { display: block; margin-bottom: 6px; color: #aaa; font-size: 13px; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px; }
        input, select { width: 100%; padding: 11px 14px; background: #0D0D0D; border: 1px solid #333;
                        border-radius: 8px; font-size: 14px; color: #fff; }
        input:focus, select:focus { outline: none; border-color: #5332C9; }
        input[readonly] { background: #111; color: #666; border-color: #222; }
        select option { background: #1a1a1a; }
        .btn { width: 100%; padding: 13px; background: #5332C9; color: white; border: none;
               border-radius: 8px; font-size: 15px; font-weight: 700; cursor: pointer; margin-top: 8px; }
        .btn:hover { background: #6344e0; }
        .btn-back { display: block; text-align: center; margin-top: 14px; color: #888; text-decoration: none; font-size: 14px; }
        .btn-back:hover { color: #FF5555; }
        .error { background: #2a0a0a; color: #FF5555; padding: 11px 14px; border-radius: 8px;
                 margin-bottom: 18px; border-left: 4px solid #FF5555; font-size: 14px; }
    </style>
</head>
<body>
<div class="header">
    <a href="index.jsp">&#8592; Back</a>
    <span>Update Employee</span>
</div>
<div class="container">
    <h2>&#9999;&#65039; Update Employee</h2>
    <form action="UpdateEmployeeServlet" method="get">
        <div class="search-row">
            <input type="number" name="empno" placeholder="Enter Employee ID to search" min="1" required />
            <button type="submit">Search</button>
        </div>
    </form>
    <% String error = (String) request.getAttribute("error");
       if (error != null) { %><div class="error">&#9888; <%= error %></div><% } %>
    <% com.model.Employee emp = (com.model.Employee) request.getAttribute("employee");
       if (emp != null) { %>
    <form action="UpdateEmployeeServlet" method="post">
        <div class="form-group">
            <label>Employee No</label>
            <input type="text" value="<%= emp.getEmpno() %>" readonly />
            <input type="hidden" name="empno" value="<%= emp.getEmpno() %>" />
        </div>
        <div class="form-group">
            <label>Employee Name *</label>
            <input type="text" name="empName" value="<%= emp.getEmpName() %>" required />
        </div>
        <div class="form-group">
            <label>Date of Joining *</label>
            <input type="date" name="doj" value="<%= emp.getDoj() %>" required />
        </div>
        <div class="form-group">
            <label>Gender *</label>
            <select name="gender" required>
                <option value="Male" <%= "Male".equals(emp.getGender()) ? "selected" : "" %>>Male</option>
                <option value="Female" <%= "Female".equals(emp.getGender()) ? "selected" : "" %>>Female</option>
                <option value="Other" <%= "Other".equals(emp.getGender()) ? "selected" : "" %>>Other</option>
            </select>
        </div>
        <div class="form-group">
            <label>Basic Salary (₹) *</label>
            <input type="number" name="bsalary" value="<%= emp.getBsalary() %>" step="0.01" min="0" required />
        </div>
        <button type="submit" class="btn">&#128190; Update Employee</button>
    </form>
    <% } %>
    <a href="index.jsp" class="btn-back">Cancel</a>
</div>
</body>
</html>