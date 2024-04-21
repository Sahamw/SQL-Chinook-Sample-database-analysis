--  1 What is the distribution of customers by country? --

Select 	Country,
		Count(*) As No_Of_Customers
FROM	customer
Group by Country
Order by No_Of_Customers Desc; -- Analysing number of customers by each country--

--------------------------------------------------------------------------------------------------------

-- 2.How does customer spending vary across different countries?--

SELECT BillingCountry,
		SUM(Total) AS Spending_by_country
FROM 	invoice
GROUP BY BillingCountry
ORDER BY Spending_by_country Desc;   -- Analysing Number of spending by each country--

--------------------------------------------------------------------------------------------------------

-- 3.Can we segment customers based on their purchasing behaviour (e.g., frequency, total spending)?--

Select 	c.CustomerId AS Customer_ID,
		c.FirstName,
        c.LastName,
		COUNT(iv.InvoiceId) AS Frequency
FROM 	Invoice iv
JOIN 	Customer c ON iv.CustomerId = c.CustomerId 
Group BY c.CustomerId;  -- Using inner join to check customer frequency-- 

-- Since there is no great gap between purchasing frequency , For the moment it is not requered to group customers on different levels-- 

--------------------------------------------------------------------------------------------------------

 
 