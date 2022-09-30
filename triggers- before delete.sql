CREATE DEFINER=`root`@`localhost` TRIGGER `moviestrg` BEFORE DELETE ON `movies` FOR EACH ROW BEGIN
delete from rentals where movieid = 2;

END