<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Employee, java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Report Results</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: 'Segoe UI', sans-serif; background: #0D0D0D; min-height: 100vh; }
        .header { background: #5332C9; padding: 18px 40px; display: flex; align-items: center; gap: 16px; }
        .header a { color: #F1F95A; text-decoration: none; font-size: 14px; }
        .header span { color: #fff; font-size: 18px; font-weight: bold; }
        .container { max-width: 900px; margin: 50px auto; padding: 0 16px; }
        .table-card { background: #1a1a1a; border-radius: 14px; padding: 28px; border: 1px solid #2a2a2a; }
        .table-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; }
        .table-header h2 { color: #F1F95A; font-size: 18px; }
        .count-badge { background: #FF5555; color: white; padding: 5px 14px;
                       border-radius: 20px; font-size: 13px; font-weight: 700; }
        table { width: 100%; border-collapse: collapse; font-size: 14px; }
        thead tr { background: #5332C9; }
        th { color: #F1F95A; padding: 12px 16px; text-align: left; font-weight: 700; }
        td { padding: 12px 16px; border-bottom: 1px solid #222; color: #ddd; }
        tbody tr:hover td { background: #222; }
        tbody tr:last-child td { border-bottom: none; }
        .empno-col { font-weight: 700; color: #a78bfa; }
        .salary-col { font-weight: 600; color: #F1F95A; }
        .no-data { text-align: center; color: #555; padding: 50px; font-size: 15px; }
        .btn-back { display: inline-block; margin-top: 20px; padding: 11px 22px;
                    background: #5332C9; color: white; border-radius: 8px;
                    text-decoration: none; font-size: 14px; font-weight: 600; }
        .btn-back:hover { background: #6344e0; }
    </style>
</head>
<body>
<div class="header">
    <a href="report_form.jsp">&#8592; Back to Reports</a>
    <span>&#128202; Report Results</span>
</div>
<div class="container">
    <div class="table-card">
        <div class="table-header">
            <h2><%= request.getAttribute("reportTitle") %></h2>
            <% List<Employee> results = (List<Employee>) request.getAttribute("results");
               if (results != null) { %>
                <span class="count-badge">Found: <%= results.size() %></span>
            <% } %>
        </div>
        <% if (results != null && !results.isEmpty()) { %>
        <table>
            <thead>
                <tr>
                    <th>Emp No</th><th>Name</th><th>Date of Joining</th><th>Gender</th><th>Basic Salary (&#8377;)</th>
                </tr>
            </thead>
            <tbody>
                <% for (Employee e : results) { %>
                <tr>
                    <td class="empno-col"><%= e.getEmpno() %></td>
                    <td><%= e.getEmpName() %></td>
                    <td><%= e.getDoj() %></td>
                    <td><%= e.getGender() %></td>
                    <td class="salary-col">&#8377; <%= e.getBsalary() %></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } else { %>
            <div class="no-data">&#128203; No records found matching the criteria.</div>
        <% } %>
        <a href="report_form.jsp" class="btn-back">&#8592; Back to Reports</a>
    </div>
</div>
</body>
</html>