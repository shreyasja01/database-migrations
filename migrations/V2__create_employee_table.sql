CREATE TABLE testemployee (
    id INT PRIMARY KEY AUTO_INCREMENT,
    employee_code VARCHAR(20) UNIQUE,
    employee_name VARCHAR(100),
    department_id INT,

    CONSTRAINT fk_testdepartment
    FOREIGN KEY (department_id)
    REFERENCES testdepartment(id)
);