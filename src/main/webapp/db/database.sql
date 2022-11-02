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

create table reply(
	userID varchar(20),
	replyID int,
	replyContent varchar(20),
	b_ID int,
	replyAvailable int,
	primary key(replyID),
	foreign key(b_ID) references board(b_ID)
);

drop table test;
create table test(
	t_id int AUTO_INCREMENT primary key,
	t_title varchar(50) not null,
	t_kind varchar(15) not null,
	t_content varchar(100) not null,
	t_img varchar(2048) not null,
	t_src varchar(2048) not null
) default character set utf8 collate utf8_general_ci;

create table test_select(
	t_id varchar(20) primary key,
	t_title varchar(50) not null,
	s_content varchar(200) not null,
	
)charset = 'utf8';


drop table test;
drop table user;
