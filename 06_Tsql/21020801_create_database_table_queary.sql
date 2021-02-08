use tempdb;
go

create database sqlDB;
go

-- DB����

use sqlDB;
go
create table userTbl -- ȸ�����̺�
(
	userID char(8) NOT null primary key, -- ����ھ��̵�
	username nvarchar(10) not null, -- �̸�
	birthYear int not null, -- ����⵵
	addr nchar(2) not null, --����
	mobile1 char(3), -- �޴��� ����
	mobile2 char(8), -- �޴��� ������ ��ȭ��ȣ (������ ����)
	height smallint, -- Ű
	mDate date -- ȸ�� ������
);
go

create table buyTbl -- ȸ�� ���� ���̺�
(
	num int identity not null primary key, -- ����
	userID char(8) not null -- ���̵�
	foreign key references userTbl(userID),
	prodname nvarchar(20) not null, -- ��ǰ��
	groupName nchar(4) , -- �з�
	price int not null, -- �ܰ�
	amount smallint not null -- ����
);
go


