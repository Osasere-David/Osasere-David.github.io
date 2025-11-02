
SELECT *
FROM [dbo].[Customer$]

SELECT *
FROM [dbo].[Order$]

SELECT *
FROM [dbo].[Salesman$]

DELETE FROM [dbo].[Salesman$]
WHERE [Salesman_ID] IS NULL


--write a SQL query to find the salesperson and customer who reside in the same city. Return Salesman, cust_name and city.
SELECT 
A.[Salesman_id],
A.[Name] AS Salesman_name,
B.[Customer_Name],
B.[City]
FROM [dbo].[Salesman$] AS A
JOIN [dbo].[Customer$] AS B
ON A.[Salesman_id] = B.[Salesman_ID]
WHERE A.[city] = B.[City]

--write a SQL query to find those orders where the order amount exists between 500 and 2000. Return ord_no, purch_amt, cust_name, city.
SELECT 
A.[Order Number],
A.[Purchase_Amount],
B.[Customer_Name],
B.[City]
FROM [dbo].[Order$] AS A
JOIN [dbo].[Customer$] AS B
ON A.[Salesman_id] = B.[Salesman_ID]
WHERE A.[Purchase_Amount] BETWEEN 500 AND 2000

--write a SQL query to find the salesperson(s) and the customer(s) he represents. Return Customer Name, city, Salesman, commission.
SELECT 
A.[Name] AS Salesman,
A.[commission],
A.[Salesman_id],
B.[Customer_Name],
B.[City]
FROM [dbo].[Salesman$] AS A
JOIN [dbo].[Customer$] AS B
ON A.[Salesman_id] = B.[Salesman_ID]

--write a SQL query to find salespeople who received commissions of more than 12 percent from the company. Return Customer Name, customer city, Salesman, commission. �
SELECT 
A.[Salesman_id],
A.[Name] AS Salesman,
A.[commission],
B.[Customer_Name],
B.[City]
FROM [dbo].[Salesman$] AS A
JOIN [dbo].[Customer$] AS B
ON A.[Salesman_id] = B.[Salesman_ID]
WHERE A.[commission] > 0.12

--write a SQL query to locate those salespeople who do not live in the same city where their customers live and have received a commission of more than 12% from the company. Return Customer Name, customer city, Salesman, salesman city, commission.��
SELECT 
A.[Name] AS Salesman,
A.[city]Salesman_City,
A.[commission],
B.[City] AS Customer_City,
B.[Customer_Name]

FROM [dbo].[Salesman$] AS A
JOIN [dbo].[Customer$] AS B
ON A.[Salesman_id] = B.[Salesman_ID]
WHERE A.[city] <> B.[City] AND A.[commission] > 0.12

--write a SQL query to find the details of an order. Return ord_no, ord_date, purch_amt, Customer Name, grade, Salesman, commission
SELECT 
A.[Order Number],
A.[Order Date],
A.[Purchase_Amount],
B.[Customer_Name],
B.[Grade],
C.[Name] AS Salesman,
C.[commission]
FROM [dbo].[Order$] AS A
INNER JOIN [dbo].[Customer$] AS B
ON A.[Salesman_id] = B.[Salesman_ID]
INNER JOIN [dbo].[Salesman$] AS C
ON A.[Salesman_id] = C.[Salesman_id]

--Write a SQL statement to join the tables salesman, customer and orders so that the same column of each table appears once and only the relational rows are returned.
SELECT 
C.[Order Number],
C.[Order Date],
C.[Customer ID],
B.[Customer_Name],
B.[City] AS Customer_city,
B.[Grade],
A.[Salesman_id],
A.[Name] AS Salesman,
A.[city] AS Salesman_city,
A.[commission]

FROM [dbo].[Salesman$] AS A
JOIN [dbo].[Customer$] AS B
ON A.[Salesman_id] = B.[Salesman_ID]
JOIN [dbo].[Order$] AS C
ON A.[Salesman_id] = C.[Salesman_id]

--write a SQL query to display the customer name, customer city, grade, salesman, salesman city. The results should be sorted by ascending customer_id.
SELECT 
A.[Customer_Name],
A.[City] AS Customer_city,
A.[Grade],
B.[Name] AS Salesman,
B.[city] AS Salesman_city
FROM [dbo].[Customer$] AS A
JOIN [dbo].[Salesman$] AS B
ON A.[Salesman_ID] = B.[Salesman_id]
ORDER BY A.[Customer_ID] ASC

--write a SQL query to find those customers with a grade less than 300. Return cust_name, customer city, grade, Salesman, salesmancity. The result should be ordered by ascending customer_id.
SELECT 
A.[Customer_Name],
A.[City] AS Customer_city,
A.[Grade],
B.[Name] AS Salesman,
B.[city] AS Salesman_city
FROM [dbo].[Customer$] AS A
JOIN [dbo].[Salesman$] AS B
ON A.[Salesman_ID] = B.[Salesman_id]
WHERE A.[Grade] < 300
ORDER BY A.[Customer_ID] ASC

--Write a SQL statement to make a report with customer name, city, order number, order date, and order amount in ascending order according to the order date to determine whether any of the existing customers have placed an order or not.
SELECT 
A.[Customer_Name],
A.[City] AS Customer_city,
B.[Order Number],
B.[Order Date],
B.[Purchase_Amount] AS Order_amount,
CASE
    WHEN B.[Order Date] IS NOT NULL THEN 'Yes'
ELSE 'No'
END [Has Placed order]
FROM [dbo].[Customer$] AS A
JOIN [dbo].[Order$] AS B
ON A.[Customer_ID] = B.[Customer ID]
ORDER BY B.[Order Date] ASC

--SQL statement to generate a report with customer name, city, order number, order date, order amount, salesperson name, and commission to determine if any of the existing customers have not placed orders or if they have placed orders through their salesman or by themselves.
SELECT c.Customer_Name,
		c.City AS Customer_City,
		o.[Order Number],
		o.[Order Date],
		o.Purchase_Amount AS [Order Amount],
		s.Name AS Salesman_Name,
		s.commission AS Commission,
		CASE
			WHEN o.[Order Date] IS NOT NULL
			THEN 'Yes'
		ELSE 'No'
		END [Has Placed Order],
		CASE
			WHEN o.Salesman_id IS NOT NULL
			THEN 'Yes'
		ELSE 'No'
		END [Placed Order Through Salesman]
FROM [dbo].[Customer$] AS c
LEFT JOIN [dbo].[Order$] AS o
ON c.Customer_ID = o.[Customer ID]
LEFT JOIN [dbo].[Salesman$] AS s
ON c.Salesman_ID = s.Salesman_id

--Write a SQL statement to generate a list in ascending order of salespersons who work either for one or more customers or have not yet joined any of the customers.
SELECT  DISTINCT s.Salesman_id,
		s.Name AS [Salesman's Name],
		s.city AS [Salesman's City],
		s.commission Commission,
		c.[Customer_Name]
FROM [dbo].[Salesman$] AS s
LEFT JOIN [dbo].[Customer$] AS c
ON s.Salesman_id = c.Salesman_ID
ORDER BY s.Name ASC

--write a SQL query to list all salespersons along with customer name, city, grade, order number, date, and amount.
SELECT  s.Salesman_id,
		s.Name AS [Salesman's Name],
		s.city AS [Salesman's City],
		s.commission Commission,
		c.Customer_Name,
		c.City [Customer's City],
		c.Grade,
		o.[Order Number],
		o.[Order Date],
		o.Purchase_Amount [Order Amount]
FROM [dbo].[Salesman$] AS s
LEFT JOIN [dbo].[Customer$] AS c
ON s.Salesman_id = c.Salesman_ID
LEFT JOIN [dbo].[Order$] AS o
ON o.Salesman_ID = s.Salesman_id

--Write a SQL statement to generate a report with the customer name, city, order no. order date, purchase amount for only those customers on the list who must have a grade and placed one or more orders or which order(s) have been placed by the customer who neither is on the list nor has a grade.
SELECT c.Customer_Name,
		c.City [Customer City],
		o.[Order Number],
		o.[Order Date],
		o.Purchase_Amount [Order Amount],
		s.Name AS [Salesman Name],
		s.commission 
FROM [dbo].[Customer$] AS c
LEFT JOIN [dbo].[Salesman$] AS s
ON c.Salesman_ID = s.Salesman_id
LEFT JOIN [dbo].[Order$] AS o
ON o.Salesman_id = s.Salesman_id

--Write a SQL query to combine each row of the salesman table with each row of the customer table.
SELECT s.Salesman_id,
		s.Name [Salesman Name],
		s.city [Salesman City],
		s.commission,
		c.Customer_ID,
		c.Customer_Name,
		c.City [Customer City],
		c.Grade
FROM [dbo].[Salesman$] AS s
CROSS JOIN [dbo].[Customer$] AS c

--Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for all customers and vice versa for that salesperson who belongs to that city.
SELECT s.Salesman_id,
		s.Name [Salesman Name],
		s.city [Salesman City],
		s.commission,
		c.Customer_ID,
		c.Customer_Name,
		c.City [Customer City],
		c.Grade
FROM [dbo].[Salesman$] AS s
CROSS JOIN [dbo].[Customer$] AS c
WHERE s.city = c.City

--Write a SQL statement to create a Cartesian product between salesperson and customer, i.e. each salesperson will appear for every customer and vice versa for those salesmen who belong to a city and customers who require a grade.
SELECT s.Salesman_id,
		s.Name [Salesman Name],
		s.city [Salesman City],
		s.commission,
		c.Customer_ID,
		c.Customer_Name,
		c.City [Customer City],
		c.Grade
FROM [dbo].[Salesman$] AS s
CROSS JOIN [dbo].[Customer$] AS c
WHERE s.city = c.City
AND c.Grade IS NOT NULL

--Write a SQL statement to make a Cartesian product between salesman and customer i.e. each salesman will appear for all customers and vice versa for those salesmen who must belong to a city which is not the same as his customer and the customers should have their own grade.
SELECT s.Salesman_id,
		s.Name [Salesman Name],
		s.city [Salesman City],
		s.commission,
		c.Customer_ID,
		c.Customer_Name,
		c.City [Customer City],
		c.Grade
FROM [dbo].[Salesman$] AS s
CROSS JOIN [dbo].[Customer$] AS c
WHERE s.city != c.City
AND c.Grade IS NOT NULL
