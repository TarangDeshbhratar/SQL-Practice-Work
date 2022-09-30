CREATE DEFINER=`root`@`localhost` PROCEDURE `assiproc`(month1 varchar(20), year1 integer)
BEGIN
select ordernumber,orderdate, status from orders where year(orderdate)=year1 and left(monthname(orderdate),3)=month1;
END