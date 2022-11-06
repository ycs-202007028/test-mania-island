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

drop table reply;
create table reply(
	replyID int,
	id VARCHAR(20),
	replyContent varchar(20),
	r_Date DateTIME,
	b_ID int,
	replyAvailable int,
	primary key(replyID),
	foreign key(b_ID) references board(b_ID)
)charset = 'utf8';

create table test_reply(
	tr_ID int,
	id VARCHAR(20),
	tr_Content varchar(20),
	tr_Date DateTIME,
	t_id int,
	tr_Available int,
	primary key(tr_ID),
	foreign key(t_id) references test(t_id)
)charset = 'utf8';

drop table test;
create table test(
	t_id int AUTO_INCREMENT primary key,
	t_title varchar(50) not null,
	t_kind varchar(15) not null,
	t_content varchar(100) not null,
	t_img varchar(2048) not null,
	t_src varchar(2048) not null
) default character set utf8 collate utf8_general_ci;

drop table test_result;
create table test_result(
	t_id varchar(20) not null,
	s_id varchar(20) not null,
	r_content varchar(1200),
	r_img varchar(2048) not null
)default character set utf8 collate utf8_general_ci;

create table test_select(
	t_id varchar(20) primary key,
	s_content varchar(2048) not null,
	s_select varchar(10000) not null
)default character set utf8 collate utf8_general_ci;

insert into test_select values(1, '지금의 내가 돈을 버는 이유는?, 지나가다가 으리으리한 건물을 발견했다 내 머릿속에는.., 건물주 되려면 절약부터! 나만의 킹받는 절약 방법은?, 솔직히 더 맞는 말은?, 그러던 어느 날 로또에 당첨되었다..!! 내가 가장 먼 저 할 일은?, 드디어 꿈 실현..! 내가 살 건물은.., 건물주가 된 나는.., 내가 더 해보고 싶은 FLEX는?, 건물자가 된 내가 방송에 나온다면 얻고 싶은 타이틀은?', '인생은 지금이야~ 오늘만 사는 나를 위해서, 꼭 부자가 돼야지... 미래의 나를 위해서, 와.. 저 건물 얼마일까?, 와.. 저 건물주는 무슨 일할끼?, 매일 안 씻고 집에 누워 있으면서 수도세 아끼기, 매일 하루도 안 빠지고 외출해서 전기세 아끼기, 티끌 모아봤자 티끌이다, 내 소비는 틀리지 않았다. 내 월급의 액수가 틀린 거다., 대략적인 앞으로의 소비 계획부터 짜기, 그동안 사지 못한 눈에 밟혔던 물건부터 사기, 친구들 1일 1초대 가능한 화려한 도시 속 건물, 혼자 멍 때리기 좋은 물 좋고 뷰 좋은 건물, 내일 당장 퇴사/자퇴할 수 있는 삶에 짜릿함을 느끼는 중!, 고정적으로 월세 받는 삶에 짜릿함을 느끼는 중!, 일본가서  초밥만 먹고오기, 일본 미슐랭 3스타의 초밥 집 앞으로 배달시키기, 하루 아침에 인생 역전된 행운의 주인공!, 00동 XX억 건물 매수한 성공의 주인공!');

insert into test_select values(2, '친구들과 카페에서 서로 다른 메뉴를 시키고 한 번에 정산하기로 했다!, 내 지갑을 찾아준 사람이 무례한 태도로 사례를 요구한다! 생각했던 것보다 금액이 센데..., 친구 결혼식에 10만원만 내려고 했는데 다른 친구들이 다 20만원을 낸다고 한다면?, 애인 ID로 넷플릭스를 구독하고 있었는데 헤어졌다. 마침 보고 싶은게 생겼는데..., 애인이 데이트 통장을 만들자고 한다면?, 돈 관리에 대한 나의 생각은', '각자 주문한 메뉴 금액대로 요청한다, 그냥 똑같이 1/N로 요청한다, 그냥 내가 생각한 만큼만 사례한다, 요구한 만큼 사례해 준다. 그래도 잃어버렸으면 더 손해였을 거니까..., 똑같이 20만원 낸다, 그냥 10만원만 낸다, 먼저 연락 오기 전까지 조용히 쓴다, 그래도 헤어졌으니 로그아웃 한다, 그러자고 한다, 굳이? 거절한다, 젊을 때부터 최대한 아껴서 돈을 많이 모아놔야 한다, 젊음은 다시 돌아오지 않는다! 쓸 만큼 쓰고 남는 걸 모으면 된다');

insert into test_select values(3, '사계절이 사라진다는 소식을 처음 들었을 때 나는, 대망의 여름 휴가날 바다에 왔는데 갑자기 눈이 내린다..., 결국 내내 숙소에만 있다가 돌아가려는데 언제 그랬냐는 듯 날씨가 맑아졌다!, 한 달 내내 계속되는 소나기! 만나기로 한 친구가 비를 쫄딱 맞고 왔다, 친구가 날씨 때문에 생필품을 못 구했다며 고민을 털어놓았다, 그렇게 몇 년이 흐르고 어느 날 어린아이가 다가와 봄이 어떤 계절이었는지 물어보는데, 더 이상 이렇게는 못살아! 한계를 느끼는 순간은?, 계절을 되찾게 해준다는 소문의 가게가 나타났다!, 지금 안 쓰는 물건만 들고 와도 계절을 찾아줄 수 있다는데!, 소문을 듣고 다들 물건을 하나씩 가져왔는데 내가 가져온 물건은?, 물건이 모이니 거짓말처럼 갠 날씨! 다들 환호하며 기뻐하는데, 그렇게 몇 달 후 점점 봄과 가을이 느껴지더니 잃어버린 계절이 모두 돌아왔다!', '미친 거 아냐? 우리 이제 어떡해?ㅠㅠ, 엥? 거짓 뉴스 아니야?, 물놀이를 못해서 완전 억울..., 숙소에서 쉰다고? 오히려 좋아!, 그냥 가면 억울하지! 하루라도 더 머문다, 아쉽긴 하지만 내일 일정을 생각해서 돌아간다, 괜찮아? 오느라 고생했어ㅠㅠ, 이럴 땐 하나씩 챙겨 다니는게 최고야, 친구한테 필요해 보이는 것들을 살펴보고 챙겨준다, 이거는? 저거는? 하며 직접 물어보고 챙겨준다, 봄은 3-5월이고 꽃이 많이 피는 계절이었어!, 봄은 따뜻하고 마음도 포근해지는 계절이었어!, 종잡을 수 없는 날씨 때문에 자꾸만 계획을 망칠 때, 가고 싶은 곳이 생겨도 날씨 때문에 못 갈 때가 많아질 때, 이런 좋은게 있다고? 당장 소문내고 다닌다, 조용히 듣고만 있다가 혼자 슬쩍 가본다, 안 쓰는 물건...? 대체 뭘 하려는 거지?, 안 쓰는 물건? OK! 바로 찾아본다, 지금은 안 쓰는 상태 좋은 물건, 사 놓고 방치해뒀던 물건, 역시 해낼 줄 알았어! 만족스러운 결과에 뿌듯!, 고생했다 나 자신.. 지난 날들을 떠올리며 울컥.., 봄이니까 피크닉 가야지! 당장 만끽하러 간다, 새로운 봄은 또 다르려나? 앞으로 펼쳐질 일들이 기대된다');

drop table test;
drop table user;
drop table test_select;
drop table test_result;