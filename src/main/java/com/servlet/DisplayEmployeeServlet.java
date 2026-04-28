package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class DisplayEmployeeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        EmployeeDAO dao = new EmployeeDAO();

        String empnoStr = request.getParameter("empno");

        // If search by ID
        if (empnoStr != null && !empnoStr.trim().isEmpty()) {
            try {
                int empno = Integer.parseInt(empnoStr.trim());
                Employee emp = dao.getEmployeeById(empno);
                if (emp != null) {
                    request.setAttribute("employee", emp);
                } else {
                    request.setAttribute("error", "No employee found with ID: " + empno);
                }
            } catch (NumberFormatException e) {
                request.setAttribute("error", "Invalid Employee ID.");
            }
        }

        // Always load all employees for the table
        List<Employee> allEmployees = dao.getAllEmployees();
        request.setAttribute("allEmployees", allEmployees);

        request.getRequestDispatcher("/empdisplay.jsp").forward(request, response);
    }
}