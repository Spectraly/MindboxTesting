--В базе данных MS SQL Server есть продукты и категории.
--Одному продукту может соответствовать много категорий, в одной категории может быть много продуктов.
--Напишите SQL запрос для выбора всех пар «Имя продукта – Имя категории».
--Если у продукта нет категорий, то его имя все равно должно выводиться.

--Запрос по заданию
select p.Name ProductName, c.Name CategoryName
from Products p LEFT JOIN 
Products_2_Categories p2c
on p2c.Product_id = p.Id 
LEFT JOIN Categories c
on p2c.Category_id =c.Id 

-- Далее идут запросы для проверки данного запроса

-- Создание базы данных категорий и продуктов если ее не существует
if not exists(select * from sys.databases where name = 'ProductsCategories')
begin
    create database ProductsCategories
END
-- Переключение на использование созданной или существующей БД
go
USE ProductsCategories
go

-- Создание таблицы продуктов если ее не существует
if not exists(select * from sysobjects where name = 'Products')
begin
    create table Products (
        Id int primary key,
        Name varchar(100)
    )
end
-- Добавление нескольких пробных значений в таблицу продуктов
insert into Products
values
	(1, N'Продукт 1'),
	(2, N'Продукт 2'),
	(3, N'Продукт 3'),
	(4, N'Продукт 4')

-- Создание таблицы категорий если ее не существует
if not exists(select * from sysobjects where name = 'Categories')
begin
    create table Categories (
        Id int primary key,
        Name varchar(100)
    )
end
-- Добавление нескольких пробных значений в таблицу категорий
insert into Categories
values
	(1, N'Категория 1'),
	(2, N'Категория 2'),
	(3, N'Категория 3')

-- Создание таблицы связи многих ко многим между таблицами продуктов и категорий
if not exists(select * from sysobjects where name = 'Products_2_Categories')
begin
	create table Products_2_Categories
	(
	  Product_id int,
	  Category_id int,
	  CONSTRAINT Id PRIMARY KEY (Product_id, Category_id),
	  CONSTRAINT FK_Product 
		  FOREIGN KEY (Product_id) REFERENCES Products (Id),
	  CONSTRAINT FK_Category 
		  FOREIGN KEY (Category_id) REFERENCES Categories (Id)
	);
end
-- Добавление нескольких пробных значений в таблицу связи продуктов и категорий
insert into Products_2_Categories
values
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 3),
	(3, 1),
	(3, 2)


--В базе данных MS SQL Server есть продукты и категории.
--Одному продукту может соответствовать много категорий, в одной категории может быть много продуктов.
--Напишите SQL запрос для выбора всех пар «Имя продукта – Имя категории».
--Если у продукта нет категорий, то его имя все равно должно выводиться.

--Запрос по заданию
select p.Name ProductName, c.Name CategoryName
from Products p LEFT JOIN 
Products_2_Categories p2c
on p2c.Product_id = p.Id 
LEFT JOIN Categories c
on p2c.Category_id =c.Id