--� ���� ������ MS SQL Server ���� �������� � ���������.
--������ �������� ����� ��������������� ����� ���������, � ����� ��������� ����� ���� ����� ���������.
--�������� SQL ������ ��� ������ ���� ��� ���� �������� � ��� ���������.
--���� � �������� ��� ���������, �� ��� ��� ��� ����� ������ ����������.

--������ �� �������
select p.Name ProductName, c.Name CategoryName
from Products p LEFT JOIN 
Products_2_Categories p2c
on p2c.Product_id = p.Id 
LEFT JOIN Categories c
on p2c.Category_id =c.Id 

-- ����� ���� ������� ��� �������� ������� �������

-- �������� ���� ������ ��������� � ��������� ���� �� �� ����������
if not exists(select * from sys.databases where name = 'ProductsCategories')
begin
    create database ProductsCategories
END
-- ������������ �� ������������� ��������� ��� ������������ ��
go
USE ProductsCategories
go

-- �������� ������� ��������� ���� �� �� ����������
if not exists(select * from sysobjects where name = 'Products')
begin
    create table Products (
        Id int primary key,
        Name varchar(100)
    )
end
-- ���������� ���������� ������� �������� � ������� ���������
insert into Products
values
	(1, N'������� 1'),
	(2, N'������� 2'),
	(3, N'������� 3'),
	(4, N'������� 4')

-- �������� ������� ��������� ���� �� �� ����������
if not exists(select * from sysobjects where name = 'Categories')
begin
    create table Categories (
        Id int primary key,
        Name varchar(100)
    )
end
-- ���������� ���������� ������� �������� � ������� ���������
insert into Categories
values
	(1, N'��������� 1'),
	(2, N'��������� 2'),
	(3, N'��������� 3')

-- �������� ������� ����� ������ �� ������ ����� ��������� ��������� � ���������
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
-- ���������� ���������� ������� �������� � ������� ����� ��������� � ���������
insert into Products_2_Categories
values
	(1, 1),
	(1, 2),
	(1, 3),
	(2, 3),
	(3, 1),
	(3, 2)


--� ���� ������ MS SQL Server ���� �������� � ���������.
--������ �������� ����� ��������������� ����� ���������, � ����� ��������� ����� ���� ����� ���������.
--�������� SQL ������ ��� ������ ���� ��� ���� �������� � ��� ���������.
--���� � �������� ��� ���������, �� ��� ��� ��� ����� ������ ����������.

--������ �� �������
select p.Name ProductName, c.Name CategoryName
from Products p LEFT JOIN 
Products_2_Categories p2c
on p2c.Product_id = p.Id 
LEFT JOIN Categories c
on p2c.Category_id =c.Id