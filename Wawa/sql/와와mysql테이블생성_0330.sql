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

create table dogKind(
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
#메인펫 지정유무 컬럼추가
alter table petinfo add mainPet int default 0;
#프로필사진 file ID 컬럼추가
alter table petinfo add fileId int;

#펫프로필사진 저장할 테이블추가
create table petinfoFile(
fileId int primary key auto_increment,
originFileName varchar(50),
size int,
uri varchar(200)
);

create table vaccineinfo(
vaccineCode int primary key auto_increment,
vaccineName varchar(30),
vaccinePeriod int,
vaccineAge int
);

create table medicalManage(
idx int,
vaccineCode int,
realShotDate date,
foreign key(idx) references petinfo(idx),
foreign key(vaccineCode) references vaccineinfo(vaccineCode)
);

# medical 테이블 수정하세요
alter table medicalManage add nextday date;
alter table medicalManage add dDay varchar(20);

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
likeCount int,
lostPlace varchar(30),
fileUri varchar(50),
fileId int
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
parentNum int,
isDelete varchar(2),
foreign key(boardIdx) references board(boardIdx)
);

create table image(
imgIdx int primary key auto_increment,
physicalName varchar(50),
name varchar(50),
path varchar(100)
);

create table boardFile(
fileId int primary key auto_increment,
originFileName varchar(50),
size int,
uri varchar(200)
);

#medicalmanage테이블에서 외래키 설정 변경

ALTER TABLE  `medicalmanage` DROP FOREIGN KEY  `medicalmanage_ibfk_1` ;
ALTER TABLE  `medicalmanage` ADD FOREIGN KEY (  `idx` ) REFERENCES  `wawa_db`.`petinfo` (
`idx`
) ON DELETE CASCADE ON UPDATE CASCADE;

#management 테이블에서 외래키 설정 변경

ALTER TABLE  `management` DROP FOREIGN KEY  `management_ibfk_1` ;
ALTER TABLE  `medicalmanage` ADD FOREIGN KEY (  `idx` ) REFERENCES  `wawa_db`.`petinfo` (
`idx`
) ON DELETE CASCADE ON UPDATE CASCADE;
