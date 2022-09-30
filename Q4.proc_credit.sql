CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_credit`(creditlimit integer)
BEGIN
DECLARE continue handler for sqlstate '48000'
begin
   set creditlimit = 100000;
end;
DECLARE continue handler for sqlstate '49000'
begin
   set creditlimit = 60000;
end;

if creditlimit<100000 then
   SIGNAL sqlstate '48000' set message_text = 'Low creditlimit entered for Platinum customer';
end if;

if creditlimit>60000 then 
   SIGNAL sqlstate '49000' set message_text = 'High creditlimit entered for silver customer';
   end if;
END