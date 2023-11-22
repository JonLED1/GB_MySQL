DROP DATABASE IF EXISTS home_work_6;
CREATE DATABASE home_work_6;
USE home_work_6;

-- Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
 -- Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds ' 
 
 DROP FUNCTION IF EXISTS time_convert;
 DELIMITER //
 CREATE FUNCTION time_convert (seconds INT)
 RETURNS CHAR(40)
 DETERMINISTIC
 BEGIN
	DECLARE days, hours, minutes, sec INT DEFAULT 0;
    DECLARE result CHAR(40);
    SET days = FLOOR(seconds / 86400);
    SET seconds = seconds % 86400;
    SET hours = FLOOR(seconds / 3600);
    SET seconds = seconds % 3600;
    SET minutes = FLOOR(seconds / 60);
    SET seconds = seconds % 60;
    SET result = CONCAT(days, ' days ', hours, ' hours ', minutes, ' minutes ', seconds, ' seconds');
	RETURN result;
END //
DELIMITER ;

SELECT time_convert(123456);

-- Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10 

DROP PROCEDURE IF EXISTS even_numbers;
DELIMITER //
CREATE PROCEDURE even_numbers (numbers INT)
BEGIN
	DECLARE n INT DEFAULT 1;
    DECLARE evenNum CHAR(255) DEFAULT '';
	WHILE n <= numbers DO
		IF n % 2 = 0 THEN
			SET evenNum = CONCAT(evenNum, n, ', '); 
		END IF;
		SET n = n + 1;
	END WHILE;
	SELECT evenNum;
END//
DELIMITER ;

CALL even_numbers(10);


 