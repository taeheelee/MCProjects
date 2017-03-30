create table userinfo(
idx int primary key auto_increment,
id varchar(30),
password varchar(30),
nickname varchar(30),
sex varchar(30),
phone varchar(30),
adminCheck int,
email varchar(30)
);

create table dog_kind(
kind varchar(30) primary key,
dogSize varchar(30),
adultWeight double
);

create table petinfo(
idx int primary key auto_increment,
resist varchar(30),
id varchar(30),
name varchar(30),
kind varchar(30),
birthday date,
neutral varchar(30),
weight double,
sex varchar(30),
groomingStart date,
groomingPeriod int
);

create table vaccineinfo(
vaccineCode int primary key auto_increment,
vaccineName varchar(30),
vaccinePeriod int,
vaccineAge int
);

create table medical_manage(
idx int,
vaccineCode int,
realShotDate date,
foreign key(idx) references petinfo(idx),
foreign key(vaccineCode) references vaccineinfo(vaccineCode)
);

create table management(
managementIdx int primary key auto_increment,
idx int,
date date,
weight double,
foreign key(idx) references petinfo(idx)
);

create table board(
boardIdx int primary key auto_increment,
boardCode int,
title varchar(30),
writer varchar(30),
content varchar(1000),
readCount int,
writeDate date,
category varchar(30),
name varchar(30),
resist varchar(30),
lostDate date,
kind varchar(30),
weight double,
age int,
sex varchar(30),
phone varchar(30),
email varchar(30),
birthday date,
starPoint int,
likeCount int
);

create table reple(
repleIdx int primary key auto_increment,
boardIdx int,
nickname varchar(30),
content varchar(1000),
writedate date,
groupCode int,
groupSeq int,
groupLv int,
foreign key(boardIdx) references board(boardIdx)
);

create table image(
imgIdx int primary key auto_increment,
physicalName varchar(50),
name varchar(50),
path varchar(100)
);
