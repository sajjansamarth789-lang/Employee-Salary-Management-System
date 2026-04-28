<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reports</title>
    <style>
        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: 'Segoe UI', sans-serif; background: #0D0D0D; min-height: 100vh; }
        .header { background: #5332C9; padding: 18px 40px; display: flex; align-items: center; gap: 16px; }
        .header a { color: #F1F95A; text-decoration: none; font-size: 14px; }
        .header span { color: #fff; font-size: 18px; font-weight: bold; }
        .container { max-width: 580px; margin: 50px auto; padding: 0 16px; }
        h2 { color: #F1F95A; margin-bottom: 24px; font-size: 20px; }
        .report-card { background: #1a1a1a; border-radius: 12px; padding: 24px;
                       border: 1px solid #2a2a2a; margin-bottom: 18px; }
        .report-card h4 { color: #a78bfa; margin-bottom: 14px; font-size: 14px; text-transform: uppercase; letter-spacing: 0.5px; }
        .row { display: flex; gap: 10px; }
        .row input { flex: 1; padding: 11px 14px; background: #0D0D0D; border: 1px solid #333;
                     border-radius: 8px; font-size: 14px; color: #fff; }
        .row input:focus { outline: none; border-color: #5332C9; }
        .row button { padding: 11px 22px; color: #0D0D0D; border: none; border-radius: 8px;
                      cursor: pointer; font-size: 14px; font-weight: 700; }
        .btn-1 { background: #5332C9; color: #fff !important; }
        .btn-1:hover { background: #6344e0; }
        .btn-2 { background: #F1F95A; }
        .btn-2:hover { background: #e8f04a; }
        .btn-3 { background: #FF5555; color: #fff !important; }
        .btn-3:hover { background: #e04444; }
        .error { background: #2a0a0a; color: #FF5555; padding: 11px 14px; border-radius: 8px;
                 margin-bottom: 18px; border-left: 4px solid #FF5555; font-size: 14px; }
    </style>
</head>
<body>
<div class="header">
    <a href="index.jsp">&#8592; Back to Home</a>
    <span>&#128202; Employee Reports</span>
</div>
<div class="container">
    <h2>&#128202; Generate Reports</h2>
    <% String error = (String) request.getAttribute("error");
       if (error != null) { %><div class="error">&#9888; <%= error %></div><% } %>

    <div class="report-card">
        <h4>&#128273; Report 1 — Employees by Name Starting Letter</h4>
        <form action="ReportServlet" method="post">
            <input type="hidden" name="reportType" value="letter" />
            <div class="row">
                <input type="text" name="letter" placeholder="Enter letter (e.g., A)" maxlength="1" required />
                <button type="submit" class="btn-1">Generate</button>
            </div>
        </form>
    </div>

    <div class="report-card">
        <h4>&#128197; Report 2 — Employees with N or More Years of Service</h4>
        <form action="ReportServlet" method="post">
            <input type="hidden" name="reportType" value="years" />
            <div class="row">
                <input type="number" name="years" placeholder="Enter number of years" min="0" required />
                <button type="submit" class="btn-2">Generate</button>
            </div>
        </form>
    </div>

    <div class="report-card">
        <h4>&#128176; Report 3 — Employees Earning More Than a Salary</h4>
        <form action="ReportServlet" method="post">
            <input type="hidden" name="reportType" value="salary" />
            <div class="row">
                <input type="number" name="salary" placeholder="Enter salary amount" min="0" step="0.01" required />
                <button type="submit" class="btn-3">Generate</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>