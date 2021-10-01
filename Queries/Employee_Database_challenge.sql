-- Create a Retirement Titles table
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	ti.title,
	ti.from_date,
	ti.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

-- Check Retirement Titles table
SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows and create
-- Create Unique Titles table
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no ASC, to_date DESC;

-- Check Unique Titles table
SELECT * FROM unique_titles;

-- Create Retiring Titles table of number of employees about to retire
-- by their most recent job title
SELECT COUNT(title), title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY COUNT(title) DESC;

-- Check Retiring Titles table
SELECT * FROM retiring_titles;