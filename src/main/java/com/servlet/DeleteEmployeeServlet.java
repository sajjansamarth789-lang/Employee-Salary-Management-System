package com.servlet;

import com.dao.EmployeeDAO;
import com.model.Employee;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;

public class DeleteEmployeeServlet extends HttpServlet {

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
        request.getRequestDispatcher("/empdelete.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int empno = Integer.parseInt(request.getParameter("empno"));
            EmployeeDAO dao = new EmployeeDAO();
            boolean success = dao.deleteEmployee(empno);
            if (success) {
                response.sendRedirect("index.jsp?msg=Employee+Deleted+Successfully");
            } else {
                request.setAttribute("error", "Delete failed. Employee may not exist.");
                request.getRequestDispatcher("/empdelete.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Invalid input.");
            request.getRequestDispatcher("/empdelete.jsp").forward(request, response);
        }
    }
}