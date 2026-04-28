package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;

public class UpdateEmployeeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String empnoStr = request.getParameter("empno");
        if (empnoStr != null && !empnoStr.isEmpty()) {
            try {
                int empno = Integer.parseInt(empnoStr);
                EmployeeDAO dao = new EmployeeDAO();
                Employee emp = dao.getEmployeeById(empno);
                if (emp != null) {
                    request.setAttribute("employee", emp);
                } else {
                    request.setAttribute("error", "Employee not found.");
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid Employee ID.");
            }
        }
        request.getRequestDispatcher("/empupdate.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int empno = Integer.parseInt(request.getParameter("empno"));
            String name = request.getParameter("empName").trim();
            String dojStr = request.getParameter("doj");
            String gender = request.getParameter("gender");
            String salaryStr = request.getParameter("bsalary");

            if (name.isEmpty() || dojStr.isEmpty() || gender.isEmpty() || salaryStr.isEmpty()) {
                request.setAttribute("error", "All fields are required.");
                request.getRequestDispatcher("/empupdate.jsp").forward(request, response);
                return;
            }

            BigDecimal salary = new BigDecimal(salaryStr);
            if (salary.compareTo(BigDecimal.ZERO) < 0) {
                request.setAttribute("error", "Salary cannot be negative.");
                request.getRequestDispatcher("/empupdate.jsp").forward(request, response);
                return;
            }

            Employee emp = new Employee();
            emp.setEmpno(empno);
            emp.setEmpName(name);
            emp.setDoj(Date.valueOf(dojStr));
            emp.setGender(gender);
            emp.setBsalary(salary);

            EmployeeDAO dao = new EmployeeDAO();
            boolean success = dao.updateEmployee(emp);
            if (success) {
                response.sendRedirect("index.jsp?msg=Employee+Updated+Successfully");
            } else {
                request.setAttribute("error", "Update failed. Employee may not exist.");
                request.getRequestDispatcher("/empupdate.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid input: " + e.getMessage());
            request.getRequestDispatcher("/empupdate.jsp").forward(request, response);
        }
    }
}