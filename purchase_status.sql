CREATE DEFINER=`root`@`localhost` FUNCTION `purchase_status`(amount integer) RETURNS int
BEGIN
DECLARE purchase_status varchar(30);
IF amount < 25000 THEN
		SET purchase_status = 'SILVER';
    ELSEIF (amount >= 25000 AND 
			amount <= 50000) THEN
        SET purchase_status = 'GOLD';
    ELSEIF amount > 50000 THEN
        SET purchase_status = 'PLATINUM';
    END IF;
RETURN purchase_status;
RETURN 1;
END