CREATE DEFINER=`root`@`localhost` TRIGGER `moviestrg1` AFTER UPDATE ON `movies` FOR EACH ROW BEGIN
   update rentals set movieid = 50 where memid=3;
END