package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;

public class AddEmployeeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        EmployeeDAO dao = new EmployeeDAO();
        int nextId = dao.getNextAutoIncrement();
        request.setAttribute("nextEmpno", nextId);
        request.getRequestDispatcher("/empadd.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String name = request.getParameter("empName").trim();
            String dojStr = request.getParameter("doj");
            String gender = request.getParameter("gender");
            String salaryStr = request.getParameter("bsalary");

            // Validation
            if (name.isEmpty() || dojStr.isEmpty() || gender.isEmpty() || salaryStr.isEmpty()) {
                request.setAttribute("error", "All fields are required.");
                request.getRequestDispatcher("/empadd.jsp").forward(request, response);
                return;
            }

            BigDecimal salary = new BigDecimal(salaryStr);
            if (salary.compareTo(BigDecimal.ZERO) < 0) {
                request.setAttribute("error", "Salary cannot be negative.");
                EmployeeDAO dao = new EmployeeDAO();
                request.setAttribute("nextEmpno", dao.getNextAutoIncrement());
                request.getRequestDispatcher("/empadd.jsp").forward(request, response);
                return;
            }

            Employee emp = new Employee();
            emp.setEmpName(name);
            emp.setDoj(Date.valueOf(dojStr));
            emp.setGender(gender);
            emp.setBsalary(salary);

            EmployeeDAO dao = new EmployeeDAO();
            boolean success = dao.addEmployee(emp);
            if (success) {
                response.sendRedirect("index.jsp?msg=Employee+Added+Successfully");
            } else {
                request.setAttribute("error", "Failed to add employee.");
                request.getRequestDispatcher("/empadd.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid input: " + e.getMessage());
            request.getRequestDispatcher("/empadd.jsp").forward(request, response);
        }
    }
}