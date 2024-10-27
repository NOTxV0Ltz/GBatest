<ваши SQL запросы>
mysql> USE Друзья_человека;
Database changed
mysql> CREATE TABLE Домашние_животные (id INT AUTO_INCREMENT PRIMARY KEY,имя VARCHAR(255),команда VARCHAR(255),дата_рождения DATE);
Query OK, 0 rows affected (0,28 sec)

mysql> CREATE TABLE Вьючные_животные (id INT AUTO_INCREMENT PRIMARY KEY,имя VARCHAR(255),команда VARCHAR(255),дата_рождения DATE);
Query OK, 0 rows affected (0,10 sec)

mysql> INSERT INTO Домашние_животные (имя,команда,дата_рождения) VALUES ('Собака','Сидеть','2020-01-01');
Query OK, 1 row affected (0,24 sec)

mysql> SHOW TABLES;
+-----------------------------------------+
| Tables_in_Друзья_человека               |
+-----------------------------------------+
| Вьючные_животные                        |
| Домашние_животные                       |
+-----------------------------------------+
2 rows in set (0,01 sec)

mysql> INSERT INTO Домашние_животные (имя,команда,дата_рождения) VALUES ('Кот','Спать','2023-02-01');
Query OK, 1 row affected (0,04 sec)

mysql> INSERT INTO Домашние_животные (имя,команда,дата_рождения) VALUES ('Хомяк','Играть','2022-02-01');
Query OK, 1 row affected (0,12 sec)

mysql> INSERT INTO Вьючные_животные (имя,команда,дата_рождения) VALUES ('Лошадь','Прыгать','2018-11-11');
Query OK, 1 row affected (0,02 sec)

mysql> INSERT INTO Вьючные_животные (имя,команда,дата_рождения) VALUES ('Верблюд','Пить','2021-11-11');
Query OK, 1 row affected (0,03 sec)

mysql> INSERT INTO Вьючные_животные (имя,команда,дата_рождения) VALUES ('Осел','Смотреть','2023-08-29');
Query OK, 1 row affected (0,16 sec)

mysql> DELETE FROM Вьючные_животные WHERE имя = 'Верблюд';
Query OK, 1 row affected (0,06 sec)

mysql> CREATE TABLE Объединенные_животные AS SELECT * FROM Вьючные_животные WHERE имя != 'Верблюд';
Query OK, 2 rows affected (0,15 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE Молодые_животные AS 
    -> SELECT *, TIMESTAMPDIFF(MONTH, дата_рождения, CURDATE()) AS возраст 
    -> FROM Домашние_животные 
    -> CREATE TABLE Молодые_животные AS SELECT *, TIMESTAMPDIFF(MONTH, дата_рождения,CURDATE()) AS возраст FROM Домашние_животные WHERE YEAR(CURDATE()) - YEAR(дата_рождения) < 3;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'CREATE TABLE Молодые_животные AS SELECT *, TIMESTAMPDIFF(MONTH, Ð' at line 4
mysql> CREATE TABLE Молодые_животные AS SELECT *, TIMESTAMPDIFF(MONTH, дата_рождения,CURDATE()) AS возраст FROM Домашние_животные WHERE YEAR(CURDATE()) - YEAR(дата_рождения) < 3;
Query OK, 2 rows affected (0,14 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> CREATE TABLE Все_животные AS SELECT * FROM Домашние_животные UNION ALL SELECT * FROM Вьючные_животные;
Query OK, 5 rows affected (0,08 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> q
