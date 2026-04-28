package com.dao;

import com.model.Employee;
import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeDAO {

    private static final String URL = "jdbc:mysql://localhost:3306/employeedb";
    private static final String USER = "root";
    private static final String PASSWORD = "root"; // Change to your MySQL password

    private Connection getConnection() throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }

    // Get next auto-increment value
 // Get next auto-increment value
    public int getNextAutoIncrement() {
        String sql = "SELECT IFNULL(MAX(Empno), 0) + 1 FROM Employee";
        try (Connection con = getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 1;
    }

    // Add Employee
    public boolean addEmployee(Employee emp) {
        String sql = "INSERT INTO Employee (EmpName, DoJ, Gender, Bsalary) VALUES (?, ?, ?, ?)";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, emp.getEmpName());
            ps.setDate(2, emp.getDoj());
            ps.setString(3, emp.getGender());
            ps.setBigDecimal(4, emp.getBsalary());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get Employee by Empno
    public Employee getEmployeeById(int empno) {
        String sql = "SELECT * FROM Employee WHERE Empno = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, empno);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Employee(
                    rs.getInt("Empno"),
                    rs.getString("EmpName"),
                    rs.getDate("DoJ"),
                    rs.getString("Gender"),
                    rs.getBigDecimal("Bsalary")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Get All Employees
    public List<Employee> getAllEmployees() {
        List<Employee> list = new ArrayList<>();
        String sql = "SELECT * FROM Employee ORDER BY Empno";
        try (Connection con = getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                list.add(new Employee(
                    rs.getInt("Empno"),
                    rs.getString("EmpName"),
                    rs.getDate("DoJ"),
                    rs.getString("Gender"),
                    rs.getBigDecimal("Bsalary")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Update Employee
    public boolean updateEmployee(Employee emp) {
        String sql = "UPDATE Employee SET EmpName=?, DoJ=?, Gender=?, Bsalary=? WHERE Empno=?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, emp.getEmpName());
            ps.setDate(2, emp.getDoj());
            ps.setString(3, emp.getGender());
            ps.setBigDecimal(4, emp.getBsalary());
            ps.setInt(5, emp.getEmpno());
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete Employee
    public boolean deleteEmployee(int empno) {
        String sql = "DELETE FROM Employee WHERE Empno = ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, empno);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Report 1: Names starting with a letter
    public List<Employee> getEmployeesByNameLetter(String letter) {
        List<Employee> list = new ArrayList<>();
        String sql = "SELECT * FROM Employee WHERE EmpName LIKE ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, letter + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Employee(
                    rs.getInt("Empno"),
                    rs.getString("EmpName"),
                    rs.getDate("DoJ"),
                    rs.getString("Gender"),
                    rs.getBigDecimal("Bsalary")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Report 2: N or more years of service
    public List<Employee> getEmployeesByYearsOfService(int years) {
        List<Employee> list = new ArrayList<>();
        String sql = "SELECT * FROM Employee WHERE TIMESTAMPDIFF(YEAR, DoJ, CURDATE()) >= ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, years);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Employee(
                    rs.getInt("Empno"),
                    rs.getString("EmpName"),
                    rs.getDate("DoJ"),
                    rs.getString("Gender"),
                    rs.getBigDecimal("Bsalary")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Report 3: Salary greater than specified
    public List<Employee> getEmployeesBySalary(BigDecimal salary) {
        List<Employee> list = new ArrayList<>();
        String sql = "SELECT * FROM Employee WHERE Bsalary > ?";
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setBigDecimal(1, salary);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Employee(
                    rs.getInt("Empno"),
                    rs.getString("EmpName"),
                    rs.getDate("DoJ"),
                    rs.getString("Gender"),
                    rs.getBigDecimal("Bsalary")
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}