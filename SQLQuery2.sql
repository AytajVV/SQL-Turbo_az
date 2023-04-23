CREATE DATABASE Course
USE Course 
CREATE TABLE Teachers(
Id int IDENTITY PRIMARY KEY,
[Name] nvarchar(20),
Surname nvarchar(30),
Email nvarchar(50) UNIQUE,
Age int CHECK(Age>0),
Salary decimal(10,2)
)


--VALUES--
INSERT INTO Teachers VALUES
('Aytaj', 'Veyisli', 'aveyisli@gmail.com', 20, 1500.4),
('Nijat', 'Abdulla', 'nabdulla@gmail.com', 28, 2000.5),
('Lorem', 'Ipsum', 'ipsum@gmail.com', 30, 1685.2),
('Ali', 'Aliyev', 'aaliyev@gmail.com', 33, 2050.7)



--QUERIES--
 --Yashi butun muellimlerin orta yashindan boyuk olan muellimlerin siyahisi.
 SELECT * FROM Teachers WHERE Age>(SELECT AVG(Age) AvgAge FROM Teachers)
 SELECT AVG(Age) FROM Teachers


 -- Maashi 1000  ve 3000 araliqinda olan muellimlerin siyahisi.
 SELECT * FROM Teachers WHERE Salary BETWEEN 1000 AND 3000


 --Emailin sonu mail.ru olan muellimlerin adi ve soyadi
 SELECT Name, Surname FROM Teachers WHERE Email LIKE '%mail.ru'
 
 INSERT INTO Teachers VALUES
('Aytaj1', 'Veyisli1', 'aveyisli@mail.ru', 99, 900.4)



--Adi C herfi ile bashlayan muellimlerin siyahisi.
SELECT * FROM Teachers WHERE Name LIKE 'C%'

INSERT INTO Teachers VALUES
('Celal', 'Veyisov', 'cveyisov@mail.ru', 32, 5000.876)