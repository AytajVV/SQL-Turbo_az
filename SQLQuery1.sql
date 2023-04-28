CREATE DATABASE Turbo_az
USE Turbo_az

---------------------------------------TABLES-----------------------------------------------
CREATE TABLE Marka(
Id int IDENTITY PRIMARY KEY,
[Name] nvarchar(40) not null
)


CREATE TABLE Model(
Id int IDENTITY PRIMARY KEY,
[Name] nvarchar(30) not null,
Marka_id int references Marka(Id)
)


CREATE TABLE Ban(
Id int IDENTITY PRIMARY KEY,
Ban_type nvarchar(30) not null,
Yurush int not null
)


CREATE TABLE ModelBan(
Id int IDENTITY PRIMARY KEY,
Ban_id int references Ban(Id),
Model_id int references Model(Id)
)


CREATE TABLE Reng(
Id int IDENTITY PRIMARY KEY,
Color_name nvarchar(30) not null,
ModelBan_id int references ModelBan(Id)
)



CREATE TABLE Qiymet(
Id int IDENTITY PRIMARY KEY,
Price int not null,
Own int not null,
Color_id int references Reng(Id)
)


CREATE TABLE Yanacaq(
Id int IDENTITY PRIMARY KEY,
Fuel_type nvarchar(50) not null, 
Price_id int references Qiymet(Id)

)



CREATE TABLE Oturucu(
Id int IDENTITY PRIMARY KEY,
[Type] nvarchar(30) not null,
Fuel_id int references Yanacaq(Id)
)


CREATE TABLE Suretler_qutusu(
Id int IDENTITY PRIMARY KEY,
[Type] nvarchar(40) not null,
Pass_id int references Oturucu(Id)
)


CREATE TABLE İl(
Id int IDENTITY PRIMARY KEY,
[Year] int not null,
Speed_id int references Suretler_qutusu(Id)
)


CREATE TABLE Muherrik(
Id int IDENTITY PRIMARY KEY,
Engine_capacity int not null,
Engine_power int not null,
Bazar nvarchar(40) not null,
Year_id int references İl(Id)
)


CREATE TABLE Veziyyet(
Id int IDENTITY PRIMARY KEY,
Vurugu_var bit not null,
Qezali bit not null,
Renglenib bit not null,
Yerlerin_sayi int,
Kreditdedir bit,
Barter bit, 
VIN_code int not null,
Additional_Information nvarchar(max),
Engine_id int references Muherrik(Id)
)


CREATE TABLE Techizat(
Id int IDENTITY PRIMARY KEY,
Yungul_lehimli_diskler bit,
Merkezi_qapanma bit,
Deri_salon bit,
Oturacaqlarin_ventilyasiyasi bit,
[ABS] bit,
Park_radari bit,
Ksenon_lampalar bit,
Lyuk bit,
Kondisioner bit,
Arxa_goruntu_kamerasi bit,
Yagish_sensoru bit,
Oturacaqlarin_isidilmesi bit,
Yan_perdeler bit,
Veziyyet_id int references Veziyyet(Id)
)



CREATE TABLE Shekiller(
Id int IDENTITY,
On_gorunush nvarchar(100) not null,
Arxa_gorunush nvarchar(100) not null,
On_panel nvarchar(100) not null,
Techizat_id int references Techizat(Id)
)



CREATE TABLE Contact(
Id int IDENTITY PRIMARY KEY,
[Name] nvarchar(40) not null,
Email nvarchar(80) not null UNIQUE,
Number int not null
)

CREATE TABLE City(
Id int IDENTITY,
City nvarchar(70) not null,
Contact_id int references Contact(Id)
)


CREATE TABLE AvtoContact(
Id int identity,
Shekiller_Id int references Shekiller(Id),
City_Id int references City(Id)
)








-----------------------------------------VALUES------------------------------------------------

USE Turbo_az

INSERT INTO Marka VALUES
('Audi')


INSERT INTO Model VALUES
('Q8', 1),
('RS7', 1),
('S8', 1)

INSERT INTO Ban VALUES
('Offroader', 0),
('Rodster', 100),
('Kabriolet', 0),
('Sedan', 200),
('Universal', 400)


INSERT INTO ModelBan VALUES
(1, 1)


INSERT INTO Reng VALUES 
('Qara', 1),
('Ag', 1)


INSERT INTO Qiymet VALUES
(200000, 1, 1),
(250000, 1, 2)

INSERT INTO Yanacaq VALUES
('Benzin', 1),
('Benzin', 2)


INSERT INTO Oturucu VALUES
('Tam', 1),
('Tam', 2)


INSERT INTO Suretler_qutusu VALUES
('Avtomat', 1),
('Avtomat', 2)


INSERT INTO İl VALUES
(2022, 1),
(2023, 2)


INSERT INTO Muherrik VALUES
(3000, 340, 'Amerika', 1),
(3000, 350, 'Amerika', 2)


INSERT INTO Veziyyet VALUES
(0, 0, 0, 4, 0, 0, 12345, 'Ela veziyyetdedir', 1),
(0, 0, 0, 2, 0, 1, 234, 'Idealdir', 2)



INSERT INTO Techizat VALUES
(1, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 2),
(1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 3)

------------Veziyyet tableda id-nin BASHI qachib---------------


INSERT INTO Shekiller VALUES
('SHEKIL 1', 'SHEKIL 2', 'SHEKIL 3', 4),
('SHEKIL 1', 'SHEKIL 2', 'SHEKIL 3', 5)

-----------TECHIZATDA ID-NIN BASHI QACHIB-----------------
-----------SHEKILLERDE ID-NIN BASI QACIB--------------

INSERT INTO Contact VALUES
('Lorem', 'lorem@gmail.com', 1234567890)

INSERT INTO City VALUES
('Baku', 1)

INSERT INTO AvtoContact VALUES 
(2, 1),
(3, 1)




-------------------------------------QUERIES----------------------------------------------------

SELECT ma.Name Model, mo.Name Marka, b.Ban_type Ban_novu, b.Yurush, r.Color_name Reng, q.Price Qiymet, q.Own Necenci_sahibi, y.Fuel_type, o.Type Oturucu, s_q.Type Suretler_qutusu, i.Year il, muh.Bazar, muh.Engine_capacity Muherrikin_hecmi_sm3, muh.Engine_power Muherrikin_gucu_a_g, v.Qezali, v.Renglenib, v.Vurugu_var, v.Kreditdedir, v.Barter, v.VIN_code, v.Yerlerin_sayi, v.Additional_Information Elave_melumat, tc.ABS, tc.Arxa_goruntu_kamerasi, tc.Deri_salon, tc.Kondisioner, tc.Ksenon_lampalar, tc.Lyuk, tc.Merkezi_qapanma, tc.Oturacaqlarin_isidilmesi, tc.Oturacaqlarin_ventilyasiyasi, tc.Park_radari, tc.Yagish_sensoru, tc.Yan_perdeler, tc.Yungul_lehimli_diskler, sh.On_gorunush, sh.Arxa_gorunush, sh.On_panel, c.City Sheher, con.Name Ad, con.Email, con.Number Elaqe_nomresi FROM Marka ma
INNER JOIN Model mo
ON ma.Id = mo.Marka_id
INNER JOIN ModelBan mb
ON mo.Id = mb.Model_id
INNER JOIN Ban b
ON b.Id = mb.Ban_id
INNER JOIN Reng r
ON r.ModelBan_id = mb.Id
INNER JOIN Qiymet q
ON q.Color_id = r.Id
INNER JOIN Yanacaq y
ON y.Price_id = q.Id
INNER JOIN Oturucu o
ON o.Fuel_id = y.Id
INNER JOIN Suretler_qutusu s_q
ON s_q.Pass_id = o.Id
INNER JOIN İl i
ON i.Speed_id = s_q.Id
INNER JOIN Muherrik muh
ON muh.Year_id = i.Id
INNER JOIN Veziyyet v
ON v.Engine_id = muh.Id
INNER JOIN Techizat tc
ON tc.Veziyyet_id = v.Id
INNER JOIN Shekiller sh
ON sh.Techizat_id = tc.Id
INNER JOIN AvtoContact ac
ON ac.Shekiller_Id = sh.Id
INNER JOIN City c
ON c.Id = ac.City_Id
INNER JOIN Contact con
ON con.Id = c.Contact_id





