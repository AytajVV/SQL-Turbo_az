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


