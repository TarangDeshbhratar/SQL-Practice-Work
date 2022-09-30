CREATE DEFINER=`root`@`localhost` PROCEDURE `order_cancel`()
BEGIN
DECLARE lcl_on, lcl_cn integer;
DECLARE lcl_od,lcl_rd,lcl_sd date;
DECLARE lcl_status varchar(15);
DECLARE lcl_comments text;
DECLARE finished integer default 0;

DECLARE ord_cur CURSOR for select 
ordernumber, orderdate, requireddate, shippeddate, status, comments, customernumber 
from orders;

DECLARE continue handler for NOT FOUND
begin
   set finished = 1;
end;
open ord_cur;

cancelloop: LOOP
            fetch ord_cur into 
            lcl_on, lcl_od, lcl_rd, 
            lcl_sd, lcl_status, 
            lcl_comments, lcl_cn;
              if finished = 1 then
                leave cancelloop;
              end if;
          if lcl_status = 'Cancelled' then 
               insert into cancellations(customernumber,ordernumber,comments)
                    values(lcl_cn, lcl_on, lcl_comments);
		  end if;
            END LOOP cancelloop; 
close ord_cur;
END