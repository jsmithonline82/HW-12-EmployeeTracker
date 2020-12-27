DROP DATABASE IF EXISTS employees_db;
CREATE DATABASE employees_db;

USE employees_db;

CREATE TABLE department (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE role (
  id INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(50) NOT NULL,
  salary DECIMAL(10,2) NOT NULL,
  department_id INT, 
  PRIMARY KEY (id)
);

CREATE TABLE employee (
  id INT NOT NULL AUTO_INCREMENT,
  first_name VARCHAR (50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  role_id INT NOT NULL, 
  manager_id INT, 
  PRIMARY KEY (id)
);

INSERT INTO department (name)
VALUES ("Sales"), ("Customer Service"), ("Management"), ("Legal"), ("Accounting");

INSERT INTO role (title, salary, department_id)
VALUES ("President", "1000000", "6"), ("I.T. Department", "70000", "2"), ("Lawyer", "60000", "3"), ("Lawyer", "60000", "4"), ("Customer Service Rep", "60000", "5"), ("Salesperson", "40000", "1");

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("Jackson", "Smith", "1"), ("Jaxon", "Smiff", "2", "1"), ("Jaksin", "Smithed", "3", "1"), ("Jake", "Smyth", "4", "3"), ("James", "Snuff", "5", "1");

SELECT e.id, e.first_name, e.last_name, d.name AS department, r.title, r.salary, CONCAT_WS(" ", m.first_name, m.last_name) AS manager FROM employee e LEFT JOIN employee m ON m.id = e.manager_id INNER JOIN role r ON e.role_id = r.id INNER JOIN department d ON r.department_id = d.id ORDER BY e.id ASC;
