create table user(
	id varchar(20) primary key,
	name varchar(20) not null,
	pw varchar(30) not null,
	birth varchar(20) not null,
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

create table test(
	t_id int AUTO_INCREMENT primary key,
	t_title varchar(50) not null,
	t_kind varchar(15) not null,
	t_content varchar(100) not null,
	t_img varchar(2048) not null
) default character set utf8 collate utf8_general_ci;

drop table test;
drop table user;

insert into user values('방채연', 'qwert', 'qwert', '991202', 'bchy1202@naver.com', '여자', 'ISFP');
