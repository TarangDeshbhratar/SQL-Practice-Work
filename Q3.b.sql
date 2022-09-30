-- Q3 b
use assignmentdb;
 select customernumber, customername, purchase_status(customernumber) as purchase_status 
 from customers limit 5;