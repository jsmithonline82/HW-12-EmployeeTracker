const mysql = require('mysql');
const inquirer = require('inquirer');
const { printTable } = require('console-table-printer');
let roles;
let departments;
let managers;
let employees;

var connection = mysql.createConnection({
    host: "localhost",
    port: 3306,
    user: "root",
    password: "rootroot",
    database: "employees_db"
  });