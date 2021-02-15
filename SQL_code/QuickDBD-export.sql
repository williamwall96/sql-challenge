-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "departments" (
    "dept_num" varchar(15)   NOT NULL,
    "dept_name" varchar(100)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_num"
     )
);

CREATE TABLE "employee_dept" (
    "emp_num" varchar   NOT NULL,
    "dept_num" varchar(15)   NOT NULL
);

CREATE TABLE "dept_managers" (
    "dept_num" varchar(15)   NOT NULL,
    "emp_num" varchar   NOT NULL
);

CREATE TABLE "employees" (
    "emp_num" varchar(100)   NOT NULL,
    "title_id" varchar(100)   NOT NULL,
    "birthdate" varchar(100)   NOT NULL,
    "first_name" varchar(100)   NOT NULL,
    "last_name" varchar(100)   NOT NULL,
    "sex" varchar(15)   NOT NULL,
    "hire_date" varchar(100)   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_num"
     )
);

CREATE TABLE "salaries" (
    "emp_num" varchar(100)   NOT NULL,
    "salary" int   NOT NULL
);

CREATE TABLE "titles" (
    "title_id" varchar(100)   NOT NULL,
    "title" varchr(100)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

ALTER TABLE "employee_dept" ADD CONSTRAINT "fk_employee_dept_emp_num" FOREIGN KEY("emp_num")
REFERENCES "employees" ("emp_num");

ALTER TABLE "employee_dept" ADD CONSTRAINT "fk_employee_dept_dept_num" FOREIGN KEY("dept_num")
REFERENCES "departments" ("dept_num");

ALTER TABLE "dept_managers" ADD CONSTRAINT "fk_dept_managers_dept_num" FOREIGN KEY("dept_num")
REFERENCES "departments" ("dept_num");

ALTER TABLE "dept_managers" ADD CONSTRAINT "fk_dept_managers_emp_num" FOREIGN KEY("emp_num")
REFERENCES "employees" ("emp_num");

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_title_id" FOREIGN KEY("title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_num" FOREIGN KEY("emp_num")
REFERENCES "employees" ("emp_num");

