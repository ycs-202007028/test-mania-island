create table member(
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
	boardid int AUTO_INCREMENT primary key,
	wrdate datetime,
	id varchar(20),
	wrcontent varchar(500) NOT NULL,
	FOREIGN KEY (id)
    REFERENCES member(id) ON UPDATE CASCADE
) charset = 'utf8';