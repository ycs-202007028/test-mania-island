create table user(
	id varchar(20) primary key,
	name varchar(20) not null,
	pw varchar(30) not null,
	birth varchar(20) not null,
	email varchar(30) not null,
	gender varchar(6) not null,
	mbti varchar(4),
	t_id varchar(20),
	s_id varchar(20)
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

insert into test_select values(4, '사무실에 도착하자마자 일을 시작하는 썸남. 아침부터 엄청 바빠 보이는데.., 프레젠테이션 발표가 끝나고 부장님 말을 시작으로 썸남이 피드백 공격을 날리기 시작했다, 썸남이 탕비실에 오라며 말하던 그때 이 사원이 같이 가자고 한다, 탕비실에 사람이 많다. 썸남도 살짝 당황한 듯 하더니 갑자기 성큼성큼 다가온다!, 이 자료 다음 프레젠테이션 때 참고하면 좋을 것 같다며 아까 일을 사과하고 저녁 약속을 잡는데..?, 퇴근하려던 그때 부장님이 붙잡아 회식을 하게 되었는데 썸남과 이 사원을 자꾸 엮는데..!, 집에 들어와 쉬고 있던 그때 썸남이 잠시 밖에 나오라고 한다! 뭐 입고 나가지?, 빨리 나오셨네요! 갑자기 와서 미안해요. 보고싶어서.. 라고 하는데!, 모처럼 찾아온 주말 썸남에게 연락해 약속을 잡았다. 약속까지 4시간.. 준비하는 동안 나는.., 오늘은 무조건 썸 청산하고 만다! 완벽한 모습을 위해서, 갑자기 소나기가 내린다. 갑작스러운 상황에 둘 다 물에 젖은 생쥐 꼴이 돼버렸다, 대충 옷을 갈아입고 앉아 있는데 분위기가 어색해졌다.., 이제 집에 가겠다는 썸남. 그냥 이렇게 간다고? 바로 보내긴 아쉬운데.., 이제는 정말 썸남을 보내줘야 할 시간! 그런데.. 갑자기 썸남 표정이 진지해졌다..', '바쁠 땐 안 건드리는 게 최고! 조용히 미모나 감상한다, 혹시 제가 좀 도와드릴까요? 다가가서 챙겨준다, 팩트긴 한데.. 그래도 서운해!, 뭐.. 맞는 말이지 어느새 납득하는 중, 그럴까요..?(이꽉물), 저 탕비실 안 갈 건데요? (시침 뚝), 무슨 말을 하려고..? 짧은 순간 온갖 생각이 스쳐간다, 다른 사람에게 들킬까 봐 바로 딴청을 부린다, ..네 좋아요! 그래도 서운함은 남아있다, 네 그럼 이따 봬요! 충분히 납득 완료!, ㅎㅎ.. 그러게요 할많하않.. 속만 타들어간다, 아니 부장님, 그게 중요한 게 아니라~ 물 흐르듯 대화 주제를 돌려버린다, 오늘 입고 나갔던 꾸안꾸 옷, 방금 건조기로 돌린 뽀송한 옷, 정말요? 훅 들러온 멘트에 수줍수줍 , 저도 보고 싶었어요! 나도 솔직하게 표현한다, 일단 먼저 씻고 또 뭐 챙기지?, 이미 머릿속으로 데이트 시뮬레이션 중.., 건조기까지 돌려서 먼지 한 톨 없이 깔끔하게 차려입는다, 반전 매력을 보여줄 수 있게 새 옷을 사 입고 간다, 이런 모습 보여주고 싶지 않았는데.. 걱정이 먼저 든다 , 저희 집에서 옷 말리고 가실래요? 능글능글 멘트를 쳐본다, 무슨 말을 꺼내면 좋을지 고민 중.., 대뜸 일어나서 집 구경을 시켜준다, 조금만 더 있다 가요, 지금 비 많이 와서 차 많이 막힐 텐데 혹시라도 사고라도 나면.., ');

insert into test_select values(5, '낯선 행성에 도착했다!, 어디부터 행성을 살펴보지?, 지구와의 통신이 잘 안 되는데.. 우주선에  위치 추적기가 달려 있는 상황, 식량이 부족하지 않게 씨앗을 심어야겠다. 내가 심을 씨앗은?, 이제 사람들을 위한 주거공간을 만들어 보자! 집을 지을 때 가장 중요한 건, 이렇게 세 달이 지나고 생활에 익숙해진 나는.., 산책 중 근처에서 정체불명의 외계어가 가득한 동굴을 발견했다! 다른 생명체가 있을까..?, 갑자기 몰아치는 폭풍우! 새싹들이 모두 망가져버리고 말았다. 언제 또 폭풍우가 올지 모르는 상황! 대비를 해두려고 하는데.., 그떄 울리는 통신 장치. 메시지가 왔다. 헉 사람들이 내일 온다고?', '다른 행성에 왔다니.. 그저 신기하다, 여기서 무슨 일이 있을까? 내심 걱정된다, 정확한 구역을 나눠 꼼꼼하게 살펴본다, 산과 바다 중심으로 돌아다니며 살펴본다, 여기에 머물러 있으면 찾아올 거야. 최대한 현실적으로 생각한다, 혹시 위치 추적기가 고장났다면..? 무한 걱정이 시작된다, 재배 성공률 50%이지만 많은 사람들이 먹을 수 있는 씨앗, 재배 성공률 100%이지만 소수의 사람들만 먹을 수 있는 씨앗, 설계도 100% 복붙! 오차 없이 완벽하게 지어야 해!, 설계도는 그저 참고용! 지금 환경에 맞게 변화시켜야 해!, 친구들과의 여행과 파티와 시끌벅적했던 순간들이 그리워진다, 주말 예능과 내 방 침대.. 소소한 순간들이 그리워진다, 만난다면 먼저 말을 걸어보자! 친하게 지내는 게 이득이야!, 조금 위험할 수 있지 않을까? 당분간은 조심하자, 조금 시간이 걸려도 꼼꼼하게 대비하는 게 중요해!, 조금 빈틈이 있어도 빠르게 대비하는 게 중요해!, 아직 할 일이 조금 남았지만.. 사람들이 오면 같이 해야지!, 왜 이제 오는 거야! 진작에 모든 걸 다 끝냈다구~!');

insert into test_select values(6, '세안 후 내 비부는?, 거울을 봤을 때 내 코는?, 화장을 했을 때 나는? , 모기에 물렸을 때 반응은?, 피부 때문에 병원에 가 본 경험은?, 얼굴에 뾰루지가 났을 때 나는?, 햇빛을 강하게 내리쬘 때 나는?, 얼굴에 점이 났을 때 나는?, 내 피부의 색은?, 나의 나이는?, 처음 본 사람이 동안이라고 했을 때 내 반응은?, 얼굴에 베개 자국이 생겼을 때 나는?', '당김이나 끈적임이 없다, 피부가 심하게 당긴다, 모공이 잘 보이지 않는다, 모공이 잘 보인다, 화장이 잘 먹지 않고 들뜬다, 화장이 잘 지워진다, 금방 사라진다, 오래가고 잘 사라지지 않는다, 피부 관련 질환 치료를 받은 적이 없다, 피부 관련 질환 치료를 받은 적이 있다, 짜고나면 금방 사라진다, 짜면 더 심해져서 가만히 둔다, 쉽게 피부가 붉어지고 잘 탄다, 얼굴이 붉어지다 금방 돌아온다, 평소에 좀 있는 편이라 당연하다, 엥?? 말도 안 돼, 어두운편에 속한다, 하얀편에 속한다, 35세 이상이다, 35세 이하다, 자주 있는 일이라 아무렇지 않다, 들어본 적이 잘 없어 어색하다, 금방 사라진다, 자국이 오래 남는다');

insert into test_select values(7, '나의 에너지가 더 높아질 때는?, 낯선 장소에 갔을 때 나는?, 내가 생각하는 나는?, 내가 계획한 큰 일이 있을 때 더 걱정되는 것은?, 새로운 전자기기를 선물 받았다 이 때 나는?, 내가 배우고 싶은 게 생겼다 나는?, 친구가 고민을 이야기하는데 친구가 잘못한 것 같다 이때 나는? , 우울증이라는 건 뭐라고 생각하는지?, 누군가 나에게 우울하다고 할 때 나는?, 계획을 세울 때 나는?, 오랜만에 친구에게 연락이 왔다 나는?, 우울증 해결을 위해 네이버 검색을 했다 나는?', '친구들과 만나서 파티하고 놀 때!, 집에서 조용히 여유를 즐길 때!, 주변의 분위기와 무드를 고요히 즐긴다, 낯선 곳과 사람이 좋아! 다 친해지자!, 조용하고 진중하고 나 스스로를 좋아하는 스타일, 활발하고 적극적이고 사람들을 좋아하는 스타일, 지금 당장 내가 무엇을 해결할 지 걱정, 이게 안 됐을 때에 대한 상상과 걱정, 설명서가 무엇? 일단 이리저리 만져 본다, 설명서를 보면서 차근차근 해 본다, 내가 배우고 싶었던 것 자체에 집중을 한다, 이것도 저것도 배우고 싶어서 다방면적 집중을 원한다, 네가 잘못한 거 맞네, 내가 생각하기에는 이렇게 저렇게~ 한 게 안 좋지 않을까..?, 우울증은 사람을 만나면 해결된다 으하하!, 우울증은.. 내가 우울할 때 끝없이 우울해 지는 거..?, 우울한 건 취미와 사람을 만나면 해결될 거야!, 왜 우울해..? 요즘에 어려운 일 있어?, 전체적인 아웃 라인만 설계하고 융통성있게 처리!, 지금 당장 해야 하는 것부터 계획의 끝까지 철저하게!, 오 잘 지냈어? 한번 볼까? 언제 어디서 만날까?, 잘 지냈지~ 언제 한번 봐야지, 우울증 반대말은 조울증이네.. 오호?, 아.. 이런 게 우울증이구나 이렇게 이렇게 해결하면 되겠군!');

insert into test_select values(8, '친구들과 이야기를 할 때 나는?, 궁금한 게 있어서 카톡을 했는데 답장이 오지 않을 때 나는?, 밥을 먹다가 직원을 불렀는데 직원이 오지 않을 때 나는?, 친구들과 1차에 신나게 놀고 2차를 가자고 한다고 할 때 나는?, 평소에 내가 사고 싶었던 물건이 있을 때 나는?, 친구와 영화를 보는데 열린 결말로 끝났을 때 나는?, 내 앞 자리에서 술 마시는 친구가 울고 있을 때 나는?, 친구가 오늘 짜증 나서 매운 거를 먹는다 할 때 나는?, 거절을 해야 할 때 나는?, 나와 더 맞는 것은 어떤 것일까?, 친구에게 안부 연락이 왔을 때 나는?, 약속 시간이 다가오고 있을 때 나는?', ' 끝까지 얘기를 들어보고 천천히 얘기한다, 하고 싶은 얘기가 너무 많아서 친구의 말을 끊고 얘기하기도 한다, 친구야.. 빨리 답장 좀 해 줄래? 급해, 바쁜 거 같은데 답장 올 때까지 기다리자, 사장님! 여기요! 하고 큰 소리로 부른다, 왜 오지 않을까..? 하면서 조금 더 기다려 본다, 아 피곤한데 일단 가자!, 얘들아 미안 나 피곤해 집 갈게 안녕, 소비는 행복한 것이다 다음에 사나 지금 사나 똑같지 사자!, 음.. 이번 달 통장을 생각하면 다음으로 미뤄야겠어, 감독의 의도가 뭘까? 왜 이런 결말일까? 찾아본다, 그 사람들은 행복하게 오래오래 살 거야.. 만족 만족, 울어? 왜 울어? 왜? 왜?, 뭐라고 위로를 해 줘야 할까..?, 오 매운 거 뭐 먹게? 닭발?, 어? 왜 짜증 났어?, 미안 어려울 것 같아, 음 어려울 것 같은데 고민 한번 하고 해 준다, 계획적, 즉흥적, 그럼 잘 지내지~ 조만간 한번 보자구~, 잘 지내지~ 언제 만날래?, 스펙터클하게 시간에 맞을 듯 안 맞을 듯 간다, 슬슬 출발해야 늦지 않겠네.. 지금 오는 버스 타야지');

insert into test_select values(9, '평상시 나의 대화 스타일은?, 다른 사람이 보기에 나는?, 새로운 장소나 모임에 갔을 때 나와 비슷한 것은?, 무언가를 설치하거나 만들 때 나의 모습은?, 나와 비슷한 유형은?, 업무(공부)스타일과 비슷한 것은?, 고민 상담을 들어줄 때 나와 비슷한 것은?, 상대방과 논쟁 시 나는?, 감정에 대한 나의 생각은?, 나에게 계획은?, 일이나 공부하는 스타일로 나와 비슷한 것은?, 나의 여행 스타일과 비슷한 것은?', '활발하게 대화하며 대화 주제가 다양하다, 말수가 적고 조용하며 필요한 때가 아니라면 가만히 있는다, 늘 신중하며 조용하고 싶은 사람이다, 개방적이고 활동적인 밝은 에너지가 있는 사람이다, 가만히 주변의 분위기를 살피며 질문보다는 대답을 하는 편이다, 먼저 자기 자신을 소개하고 대화를 시도한다, 한번 보고 감으로 설치하거나 만든다, 설명서에 나온 정석 그대로 설치하거나 만든다, 현실적이고 세부사항을 잘 다루는 사람이다,  상상력과 아이디어가 풍부한 사람이다, 한 가지만 하는 것보단 여러가지 일을 다양하게 하고 싶어한다, 지금 현재 주어진 일에만 집중한다, 그 사람의 입장이 되어 감정적인 공감을 해 준다,  사실을 기반으로 현실적인 조언을 해 준다, 상대방의 기분을 고려하는 게 마음이 편하다,  논쟁에서 이기는 것이 중요하다, 사람에 의한 감정 이입이 쉽고 사람으로 인해 화가 나는 경우가 많다, 사람으로 인해 화가 나는 일이 드물며 감정에 공감하는 일이 드물다, 계획은 하나부터 열까지 세세하고 철저하게 세우는 편이다, 큰 틀만 잡고 나머지는 유연하게 처리하는 편이다, 정해진 순서보다 그때그때 몰아서 끝낸다, 시간 단위의 계획을 세워 업무(공부)를 끝낸다, 즉흥적으로 그날의 느낌에 따라 여행한다, 예측 가능하고 계획한 범위 내에서 여행한다');

insert into test_select values(10, '그냥 아무 생각하지 마 라고 했을 때 나는?, 공부를 해야 하지만 하기 싫을 때 나는?, 만약에 네가 500억을 주었어.. 그럼 어떻게 할 거야? 라는 질문을 받았다면?, 여행가기 전날 나는?, 요리할 때 나는?, 나에게 딱 맞는 업무는?, 나의 가치관과 더 맞는 것은?', '멍때리는 순간 아무 생각도 하지 않는 것이 어렵다, 말 그대로 아무 생각 안 할 수 있다, 아니 공부는 왜 해야 하는 걸까? 공부를 해서 내가 먼 미래에 돈이라도 많이 버나?, 무슨 이유가 필요해? 그냥 내가 하기 싫다고, 음.. 나는 일단 경찰에 신고를 했어.. 진지하게 상상하고 대답해 준다, 대답은 하겠지만 솔직히 일어나지도 않는 일에 왜 대답해야 하나 싶다, 빨리 가고 싶다! 짐을 꾸린 후 바로 잠에 든다, 자기 전 여행지에서 일어난 사건들에 대해 온갖 상상을 하다가 잠든다, 레시피에 나온 대로 정량을 딱딱 맞추려고 노력한다, 대충 이정도 넣으면 되겠지~ 하며 감으로 넣는다, 디테일한 세부사항을 다루는 업무, 상상력과 아이디어가 요구되는 업무, 미래를 생각하지 않으면 발전이 없다, 현재가 없으면 미래도 없다');

insert into test_select values(11, '친구랑 같이 갈 베이킹 원데이 클래스를 예약하려고 한다., 계획을 세우던 중 친구가 끝나고 근처에서 놀자고 물어본다면?, 수업을 들으러 가는 길이다. 친구가 갑자기 일이 생겨서 늦게 도착한다고 했을 때 가장 먼저 하는 말은?, 가는 길이 매우 복잡한 골목이다. 이때 당신의 길찾기 스타일은?, 도착했다! 그런데 알고보니 친구가 예약을 다른 날짜로 해놓았다. 이때 가장 먼저 드는 생각은?, 우여곡절 끝에 스튜디오 입장. 그곳에 오랜만에 보는 동창이 있다!, 선생님의 쿠키 요리 시연 후에 각자 만드는 시간! 어떻게 만들까?, 호스트님과 대화를 하는 중에 나중에 어떤 집에서 살고 싶은지 이야기를 나누게 되었다., 끝나고 호스트/선생님이 다같이 뒤풀이를 하자고 물어본다면?, 집에 오는 길에 SNS에 클래스 후기글을 올리려고 한다. 이때 당신은?, 클래스는 만족스러웠다! 다음에 또 해야지~라고 생각한다면?, 친구도 또 같이 하려나? 물어봐야지!','위치. 평점. 후기. 사진. 가격 굿. 좋다., 스튜디오 분위기도 좋고 쿠키도 맛있어 보이네!, 그래. 수업 듣고 주변 골목 둘러보자~, 미리 근처 카페 알아볼게. 후기 좋은 데로 가자!, 아 진짜? 무슨 일 있어?, 알았어! 몇 분 정도 걸려?, 구글맵과 일심동체, 직진 본능 때문에 -야 어디가!- 소리 좀 듣는다., (얘 너무 당황했네)야 괜찮아~, 잔여석 있으면 들어가게 해줄지도 몰라. 들어가서 물어나 보자., 먼저 가서 오랜만이야~ 인사한다., 인사할까...? 고민한다., 알려주신 레시피 모양 그대로 만들어본다., 이건 어떨까? 만들고 싶은 데로 모양을 변형해 본다., 상권도 좋고 교통도 편한 곳이면 좋겠어요., 한적한 데에서 유유자적 살고 싶어요., 좋아요~어디 갈까요?, (어색하다)저는 먼저 가볼게요! 좋은 시간 보내세요!, 오랜만에 만난 친구랑 #베이킹스타그램, 이 가격에 이 정도 경험이면 훌륭했다! 별점 4.5점, 나중에 또 재밌는 거 뭐가 있나 봐야겠다., 다음 주에 뭐 없나? 예약해놔야겠다., 카톡하기 귀찮은데.. 전화해야겠다., 전화하기 귀찮은데.. 카톡해야겠다.');

insert into test_select values(12, '나 우울해서 머리 잘랐어, 내가 함께 하고 싶은 윗하람(혹은 선생님)은?, 맛집을 가기로 했는데 A랑 B 가게 앞에서 고민 중, 알고 보니 내일이 공휴일이라면?, 나는 대체로, 파스타를 만들려고 하는데 재료가 떨어졌다, 멍을 때린다의 의미는?, 가게에 들어갔는데 점원이 나한테 오려고 눈치를 본다.., 혼자 있을 때 나의 모습은?, 학창 시절 준비물을 준비 할 때 나는?(ex. 색종이), 나 허리가 너무 아파서 도수 치료 받고 왔어, 친구한테 지금 내가 있는 카페 위치를 알려줄 때', '헐..그래도 잘 어울린다!(우선 칭찬해주기), 헐 지금은 괜찮아?(우선 위로해주기), 엄격하지만 항상 일관성이 있는 사람, 일관성은 부족하지만 인간성이 좋은 사람, 잠깐 검색좀..A가 리뷰도 많고 유명하네. 여기야!, 간판이랑 인테리어 보니까 B가 맛집이야. 느낌 알지?, 대박! 바로 친구들과 약속을 잡는다., 대박! 혼자만의 시간을 즐긴다., 미리 계획을 세우는 편이다., 일의 진행상황을 지켜보고 계획을 세우는 편이다., 마트에 가기 전 집에 없는 재료 리스트를 빠짐없이 작성한다., 우선 마트에 간 후에 필요한 걸 생각한다(1개 정도는 까먹을지도..), 아무 생각 안 하는 것, 잡생각이 꼬리에 꼬리를 무는 것, 와도 딱히 상관 없다. 도움 받을 수도 있고, 제발 나한테 안 왔으면.., 심심하다.., 평화롭다!, 무슨 일이 생길지 몰라..하루 전날 준비한다., 등교길에 사야지..당일에 준비한다., 도수 치료 얼마야? 효과 있어?, 왜 허리가 아파ㅠㅠ무슨 일 있어?,  2번 출구로 나와서 3번째 블록에서 좌회전 해, 쉑쉑버거 앞이야(주변 랜드마크 설명)' );

insert into test_select values(13, ‘친구의 반려견을 돌보게 된 나는?, 여유로운 주말 나는 반려견과 함께, 반려견과 함께 산책 중일 때 나는?, 반려견과 여행을 간다면 나는?, 찾아간 맛집이 문을 닫았다면?, 운동을 끝낸 후 거울을 보며 드는 생각은?, 회사에서 사고 쳤어 라며 연락 온 친구에게 나는?, 간만의 휴일에 나는?, 장 보러 혹은 쇼핑 갈 때 나는?, 내가 받고 싶은 서프라이즈 선물은?’, ‘뽀니는 잘 지내. 뽀미와의 하루에 대해 보고, 사진을 왕창 보내며 뽀니 넘 귀여버 ㅠㅠ 파워 주접, 세상에 우리 둘만 남은 듯 단둘이 꽁냥꽁냥 산책, 다른 댕댕이 친구들을 찾아 반려견 동반 카페로 직행, 반려견의 상태를 체크하며 전방 주시, 주변 구경을 하면서 반려견과 셀카도 찰칵!, 이미 반려견 입장 가능한 코스로 짜놓았다, 가는 곳마나 바려견 입장이 가능한지 물어본다, 곧바로 다른 맛집을 검색해 본다, 맛집은 다음에 가고 주변에 다른 식당을 찾아간다, 오늘 1시간이나 했네 라고 생각하며 빨리 씻으러 간다, 내가 바로 근수저? 벌써 복근 생긴 느낌적인 느낌, 무슨 일인지 구체적으로 물어본다, 놀랐을 친구부터 위로하고 무슨 상황인지 물어본다, 자리 풀셋팅하고 넷플릭스 정주행하며 집콕, 없던 약속도 만들어서 집 밖으로 탈출, 쇼핑리스트만 오조오억개. 동선 최적화 코스로 움직인다, 신상부터 둘러보며 카트에 가득 담는다, 나에게 꼭 필요했던 실용적인 선물, 진심을 가득 담은 로맨틱한 꽃과 편지’);

insert into test_select values(14, ‘지옥철 뚫고 회사 도착! 시계를 보니?, 업무 전 자리에 앉자마자 꼭 해야 하는 일은?, 오늘은 프로젝트 중간보고 날 모두의 앞에 선 내 모습은?, 회의 후 맡게 된 새로운 업무! 어떻게 일을 시작해볼까?, 갑자기 커피 한잔하자는 팀장님.. 할 일이 산더미인데, 오늘 점심 뭐 먹을까? 팀장님이 나에게 묻는다, 너무 많이 먹었나? 잠이 쏟아진다.., 거래처로부터 걸려온 전화. 오늘따라 유난히 사무실이 고요한데.., 준비해온 프로젝트가 대성공했다! 내 심장이 반응하는 칭찬은?, 그러고 보니 오늘은 월급날! 작고 소중한 월급으로 나는?, 작업하던 거 날아갔어 ㅠㅠ 라며 동기에게서 온 메신저에 나는? 퇴근 10분 전 여전히 쌓여 있는 업무들. 오늘도 야근각인가..’, ‘출근 시간 10분 전 도착. 지각? 그게 뭐죠?, 8시 59분 도착. 매일매일 짜릿한 출근, 아무리 바빠도 투 두 리스트는 필수?, 탕비실 직행! 커피 포션으로 여유를 찾는다, 자료는 거들 뿐! 스티브잡스에 빙의한다, 발표 때마다 떨리는 나.. 준비한 대본을 읽는다, 인수인계서 첫 페이지부터 정독한다, 나는 나만의 길을 간다! 내 방식대로 다시 정리한다, 지금 바쁜데.. 어떻게 거절하지?, 왜지? 뭐 잘못했나? 괜히 걱정하면서 따라간다, 듣자마자 손발 줄줄. 맛집 검색에 혈안이 된다, 중국집 어떠세요? 이때다 싶어 먹고 싶던 걸 말한다, 정신 차리자! 잠시 산책하고 온다, 졸면 죽음뿐. 이를 꽉 꺠물고 참는다, 눈치 눈치.. 나가서 통화한다, 머선 상관이죠? 자리에서 편하게 받는다, 와 언제 이렇게 준비했어? 역시 감각이 있네, 그렇게 열심히 하더니! 잘 해낼 줄 알았어, 식비와 생활비와 저축 등으로 철저히 계획에 맞춰 소비한다, 입금되자마자 뭐 살지부터 고민한다, 자동 저장된 파일 없어? 해결 방법을 찾아준다, 헉 야근하면서 만들었잖아 ㅠㅠ 동기의 슬픔을 함께한다, 내일을 위해 야근을 조진다(하지만 조져지는 건 나였다), 남은 일은 내일의 나에게 토스’);


drop table test;
drop table user;
drop table test_select;
drop table test_result;