create table user(
	id varchar(20) primary key,
	name varchar(20) not null,
	pw varchar(30) not null,
	birth varchar(20) not null,
	nickname varchar(30) not null,
	email varchar(30) not null,
	gender varchar(6) not null,
	mbti varchar(4)
) charset = 'utf8';

create table board(
	b_ID INT,
	b_Title VARCHAR(50),
	id VARCHAR(20),
	b_Date DATETIME,
	b_Content VARCHAR(2048),
	b_Available INT,
	primary key (b_ID)
) charset = 'utf8';