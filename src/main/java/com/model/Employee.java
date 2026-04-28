package com.model;

import java.math.BigDecimal;
import java.sql.Date;

public class Employee {
    private int empno;
    private String empName;
    private Date doj;
    private String gender;
    private BigDecimal bsalary;

    public Employee() {}

    public Employee(int empno, String empName, Date doj, String gender, BigDecimal bsalary) {
        this.empno = empno;
        this.empName = empName;
        this.doj = doj;
        this.gender = gender;
        this.bsalary = bsalary;
    }

    public int getEmpno() { return empno; }
    public void setEmpno(int empno) { this.empno = empno; }

    public String getEmpName() { return empName; }
    public void setEmpName(String empName) { this.empName = empName; }

    public Date getDoj() { return doj; }
    public void setDoj(Date doj) { this.doj = doj; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public BigDecimal getBsalary() { return bsalary; }
    public void setBsalary(BigDecimal bsalary) { this.bsalary = bsalary; }
}