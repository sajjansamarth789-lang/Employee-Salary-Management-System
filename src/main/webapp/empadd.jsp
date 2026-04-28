<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: 'Segoe UI', sans-serif; background: #0D0D0D; min-height: 100vh; }
        .header { background: #5332C9; padding: 18px 40px; display: flex; align-items: center; gap: 16px; }
        .header a { color: #F1F95A; text-decoration: none; font-size: 14px; }
        .header span { color: #fff; font-size: 18px; font-weight: bold; }
        .container { max-width: 500px; margin: 50px auto; background: #1a1a1a;
                     padding: 32px; border-radius: 14px; border: 1px solid #2a2a2a; }
        h2 { color: #F1F95A; margin-bottom: 24px; font-size: 20px; }
        .form-group { margin-bottom: 18px; }
        label { display: block; margin-bottom: 6px; color: #aaa; font-size: 13px; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px; }
        input, select { width: 100%; padding: 11px 14px; background: #0D0D0D; border: 1px solid #333;
                        border-radius: 8px; font-size: 14px; color: #fff; }
        input:focus, select:focus { outline: none; border-color: #5332C9; }
        input[readonly] { background: #111; color: #666; cursor: not-allowed; border-color: #222; }
        select option { background: #1a1a1a; }
        .btn { width: 100%; padding: 13px; background: #F1F95A; color: #0D0D0D; border: none;
               border-radius: 8px; font-size: 15px; font-weight: 700; cursor: pointer; margin-top: 8px; }
        .btn:hover { background: #e8f04a; }
        .btn-back { display: block; text-align: center; margin-top: 14px;
                    color: #888; text-decoration: none; font-size: 14px; }
        .btn-back:hover { color: #FF5555; }
        .error { background: #2a0a0a; color: #FF5555; padding: 11px 14px; border-radius: 8px;
                 margin-bottom: 18px; border-left: 4px solid #FF5555; font-size: 14px; }
    </style>
</head>
<body>
<div class="header">
    <a href="index.jsp">&#8592; Back</a>
    <span>Add New Employee</span>
</div>
<div class="container">
    <h2>&#10133; Add Employee</h2>
    <% String error = (String) request.getAttribute("error");
       if (error != null) { %><div class="error">&#9888; <%= error %></div><% } %>
    <form action="AddEmployeeServlet" method="post">
        <div class="form-group">
            <label>Employee No (Auto-Generated)</label>
            <input type="text" value="<%= request.getAttribute("nextEmpno") != null ? request.getAttribute("nextEmpno") : "" %>"
                   readonly />
        </div>
        <div class="form-group">
            <label>Employee Name *</label>
            <input type="text" name="empName" placeholder="Enter full name" required />
        </div>
        <div class="form-group">
            <label>Date of Joining *</label>
            <input type="date" name="doj" required
                   max="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>" />
        </div>
        <div class="form-group">
            <label>Gender *</label>
            <select name="gender" required>
                <option value="">-- Select --</option>
                <option value="Male">Male</option>
                <option value="Female">Female</option>
                <option value="Other">Other</option>
            </select>
        </div>
        <div class="form-group">
            <label>Basic Salary (₹) *</label>
            <input type="number" name="bsalary" placeholder="Enter salary" step="0.01" min="0" required />
        </div>
        <button type="submit" class="btn">&#128190; Save Employee</button>
    </form>
    <a href="index.jsp" class="btn-back">Cancel</a>
</div>
</body>
</html>