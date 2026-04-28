package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

public class ReportServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String reportType = request.getParameter("reportType");
        EmployeeDAO dao = new EmployeeDAO();
        List<Employee> results = null;
        String reportTitle = "";

        try {
            if ("letter".equals(reportType)) {
                String letter = request.getParameter("letter").trim().toUpperCase();
                if (letter.isEmpty() || !letter.matches("[A-Z]")) {
                    request.setAttribute("error", "Please enter a valid letter (A-Z).");
                    request.getRequestDispatcher("/report_form.jsp").forward(request, response);
                    return;
                }
                results = dao.getEmployeesByNameLetter(letter);
                reportTitle = "Employees whose name starts with '" + letter + "'";

            } else if ("years".equals(reportType)) {
                int years = Integer.parseInt(request.getParameter("years"));
                if (years < 0) {
                    request.setAttribute("error", "Years cannot be negative.");
                    request.getRequestDispatcher("/report_form.jsp").forward(request, response);
                    return;
                }
                results = dao.getEmployeesByYearsOfService(years);
                reportTitle = "Employees with " + years + " or more years of service";

            } else if ("salary".equals(reportType)) {
                BigDecimal salary = new BigDecimal(request.getParameter("salary"));
                if (salary.compareTo(BigDecimal.ZERO) < 0) {
                    request.setAttribute("error", "Salary cannot be negative.");
                    request.getRequestDispatcher("/report_form.jsp").forward(request, response);
                    return;
                }
                results = dao.getEmployeesBySalary(salary);
                reportTitle = "Employees earning more than " + salary;
            }

            request.setAttribute("results", results);
            request.setAttribute("reportTitle", reportTitle);
            request.getRequestDispatcher("/report_result.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid input: " + e.getMessage());
            request.getRequestDispatcher("/report_form.jsp").forward(request, response);
        }
    }
}