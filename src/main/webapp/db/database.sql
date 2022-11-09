drop table user;
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

insert into test_select values(1, '������ ���� ���� ���� ������?, �������ٰ� ���������� �ǹ��� �߰��ߴ� �� �Ӹ��ӿ���.., �ǹ��� �Ƿ��� �������! ������ ŷ�޴� ���� �����?, ������ �� �´� ����?, �׷��� ��� �� �ζǿ� ��÷�Ǿ���..!! ���� ���� �� �� �� ����?, ���� �� ����..! ���� �� �ǹ���.., �ǹ��ְ� �� ����.., ���� �� �غ��� ���� FLEX��?, �ǹ��ڰ� �� ���� ��ۿ� ���´ٸ� ��� ���� Ÿ��Ʋ��?', '�λ��� �����̾�~ ���ø� ��� ���� ���ؼ�, �� ���ڰ� �ž���... �̷��� ���� ���ؼ�, ��.. �� �ǹ� ���ϱ�?, ��.. �� �ǹ��ִ� ���� ���ҳ�?, ���� �� �İ� ���� ���� �����鼭 ������ �Ƴ���, ���� �Ϸ絵 �� ������ �����ؼ� ���⼼ �Ƴ���, Ƽ�� ��ƺ��� Ƽ���̴�, �� �Һ�� Ʋ���� �ʾҴ�. �� ������ �׼��� Ʋ�� �Ŵ�., �뷫���� �������� �Һ� ��ȹ���� ¥��, �׵��� ���� ���� ���� ������ ���Ǻ��� ���, ģ���� 1�� 1�ʴ� ������ ȭ���� ���� �� �ǹ�, ȥ�� �� ������ ���� �� ���� �� ���� �ǹ�, ���� ���� ���/������ �� �ִ� � ¥������ ������ ��!, ���������� ���� �޴� � ¥������ ������ ��!, �Ϻ�����  �ʹ丸 �԰����, �Ϻ� �̽��� 3��Ÿ�� �ʹ� �� ������ ��޽�Ű��, �Ϸ� ��ħ�� �λ� ������ ����� ���ΰ�!, 00�� XX�� �ǹ� �ż��� ������ ���ΰ�!');

insert into test_select values(2, 'ģ����� ī�信�� ���� �ٸ� �޴��� ��Ű�� �� ���� �����ϱ�� �ߴ�!, �� ������ ã���� ����� ������ �µ��� ��ʸ� �䱸�Ѵ�! �����ߴ� �ͺ��� �ݾ��� ����..., ģ�� ��ȥ�Ŀ� 10������ ������ �ߴµ� �ٸ� ģ������ �� 20������ ���ٰ� �Ѵٸ�?, ���� ID�� ���ø����� �����ϰ� �־��µ� �������. ��ħ ���� ������ ����µ�..., ������ ����Ʈ ������ �����ڰ� �Ѵٸ�?, �� ������ ���� ���� ������', '���� �ֹ��� �޴� �ݾ״�� ��û�Ѵ�, �׳� �Ȱ��� 1/N�� ��û�Ѵ�, �׳� ���� ������ ��ŭ�� ����Ѵ�, �䱸�� ��ŭ ����� �ش�. �׷��� �Ҿ�������� �� ���ؿ��� �Ŵϱ�..., �Ȱ��� 20���� ����, �׳� 10������ ����, ���� ���� ���� ������ ������ ����, �׷��� ��������� �α׾ƿ� �Ѵ�, �׷��ڰ� �Ѵ�, ����? �����Ѵ�, ���� ������ �ִ��� �Ʋ��� ���� ���� ��Ƴ��� �Ѵ�, ������ �ٽ� ���ƿ��� �ʴ´�! �� ��ŭ ���� ���� �� ������ �ȴ�');

insert into test_select values(3, '������� ������ٴ� �ҽ��� ó�� ����� �� ����, ����� ���� �ް��� �ٴٿ� �Դµ� ���ڱ� ���� ������..., �ᱹ ���� ���ҿ��� �ִٰ� ���ư����µ� ���� �׷��Ĵ� �� ������ ��������!, �� �� ���� ��ӵǴ� �ҳ���! ������� �� ģ���� �� �̵� �°� �Դ�, ģ���� ���� ������ ����ǰ�� �� ���ߴٸ� ����� �о���Ҵ�, �׷��� �� ���� �帣�� ��� �� ����̰� �ٰ��� ���� � �����̾����� ����µ�, �� �̻� �̷��Դ� �����! �Ѱ踦 ������ ������?, ������ ��ã�� ���شٴ� �ҹ��� ���԰� ��Ÿ����!, ���� �� ���� ���Ǹ� ��� �͵� ������ ã���� �� �ִٴµ�!, �ҹ��� ��� �ٵ� ������ �ϳ��� �����Դµ� ���� ������ ������?, ������ ���̴� ������ó�� �� ����! �ٵ� ȯȣ�ϸ� �⻵�ϴµ�, �׷��� �� �� �� ���� ���� ������ ���������� �Ҿ���� ������ ��� ���ƿԴ�!', '��ģ �� �Ƴ�? �츮 ���� ���?�Ф�, ��? ���� ���� �ƴϾ�?, �����̸� ���ؼ� ���� ���..., ���ҿ��� ���ٰ�? ������ ����!, �׳� ���� �������! �Ϸ�� �� �ӹ���, �ƽ��� ������ ���� ������ �����ؼ� ���ư���, ������? ������ ����߾�Ф�, �̷� �� �ϳ��� ì�� �ٴϴ°� �ְ��, ģ������ �ʿ��� ���̴� �͵��� ���캸�� ì���ش�, �̰Ŵ�? ���Ŵ�? �ϸ� ���� ����� ì���ش�, ���� 3-5���̰� ���� ���� �Ǵ� �����̾���!, ���� �����ϰ� ������ ���������� �����̾���!, ������ �� ���� ���� ������ �ڲٸ� ��ȹ�� ��ĥ ��, ���� ���� ���� ���ܵ� ���� ������ �� �� ���� ������ ��, �̷� ������ �ִٰ�? ���� �ҹ����� �ٴѴ�, ������ ��� �ִٰ� ȥ�� ��½ ������, �� ���� ����...? ��ü �� �Ϸ��� ����?, �� ���� ����? OK! �ٷ� ã�ƺ���, ������ �� ���� ���� ���� ����, �� ���� ��ġ�ص״� ����, ���� �س� �� �˾Ҿ�! ���������� ����� �ѵ�!, ����ߴ� �� �ڽ�.. ���� ������ ���ø��� ����.., ���̴ϱ� ��ũ�� ������! ���� �����Ϸ� ����, ���ο� ���� �� �ٸ�����? ������ ������ �ϵ��� ���ȴ�');

insert into test_select values(4, '�繫�ǿ� �������ڸ��� ���� �����ϴ� �泲. ��ħ���� ��û �ٺ� ���̴µ�.., ���������̼� ��ǥ�� ������ ����� ���� �������� �泲�� �ǵ�� ������ ������ �����ߴ�, �泲�� ����ǿ� ����� ���ϴ� �׶� �� ����� ���� ���ڰ� �Ѵ�, ����ǿ� ����� ����. �泲�� ��¦ ��Ȳ�� �� �ϴ��� ���ڱ� ��ŭ��ŭ �ٰ��´�!, �� �ڷ� ���� ���������̼� �� �����ϸ� ���� �� ���ٸ� �Ʊ� ���� ����ϰ� ���� ����� ��µ�..?, ����Ϸ��� �׶� ������� ����� ȸ���� �ϰ� �Ǿ��µ� �泲�� �� ����� �ڲ� ���µ�..!, ���� ���� ���� �ִ� �׶� �泲�� ��� �ۿ� ������� �Ѵ�! �� �԰� ������?, ���� �����̳׿�! ���ڱ� �ͼ� �̾��ؿ�. ����;.. ��� �ϴµ�!, ��ó�� ã�ƿ� �ָ� �泲���� ������ ����� ��Ҵ�. ��ӱ��� 4�ð�.. �غ��ϴ� ���� ����.., ������ ������ �� û���ϰ� ����! �Ϻ��� ����� ���ؼ�, ���ڱ� �ҳ��Ⱑ ������. ���۽����� ��Ȳ�� �� �� ���� ���� ���� ���� �Ź��ȴ�, ���� ���� �����԰� �ɾ� �ִµ� �����Ⱑ ���������.., ���� ���� ���ڴٴ� �泲. �׳� �̷��� ���ٰ�? �ٷ� ������ �ƽ��.., ������ ���� �泲�� ������� �� �ð�! �׷���.. ���ڱ� �泲 ǥ���� ����������..', '�ٻ� �� �� �ǵ帮�� �� �ְ�! ������ �̸� �����Ѵ�, Ȥ�� ���� �� ���͵帱���? �ٰ����� ì���ش�, ��Ʈ�� �ѵ�.. �׷��� ������!, ��.. �´� ������ ����� �����ϴ� ��, �׷����..?(�̲˹�), �� ����� �� �� �ǵ���? (��ħ ��), ���� ���� �Ϸ���..? ª�� ���� �°� ������ ���İ���, �ٸ� ������� ��ų�� �� �ٷ� ��û�� �θ���, ..�� ���ƿ�! �׷��� �������� �����ִ�, �� �׷� �̵� �Ŀ�! ����� ���� �Ϸ�!, ����.. �׷��Կ� �Ҹ��Ͼ�.. �Ӹ� Ÿ����, �ƴ� �����, �װ� �߿��� �� �ƴ϶�~ �� �帣�� ��ȭ ������ ����������, ���� �԰� ������ �پȲ� ��, ��� ������� ���� �Ǽ��� ��, ������? �� �鷯�� ��Ʈ�� ���ݼ��� , ���� ���� �;����! ���� �����ϰ� ǥ���Ѵ�, �ϴ� ���� �İ� �� �� ì����?, �̹� �Ӹ������� ����Ʈ �ùķ��̼� ��.., ��������� ������ ���� �� �� ���� ����ϰ� �����Դ´�, ���� �ŷ��� ������ �� �ְ� �� ���� �� �԰� ����, �̷� ��� �����ְ� ���� �ʾҴµ�.. ������ ���� ��� , ���� ������ �� ������ ���Ƿ���? �ɱ۴ɱ� ��Ʈ�� �ĺ���, ���� ���� ������ ������ ��� ��.., ��� �Ͼ�� �� ������ �����ش�, ���ݸ� �� �ִ� ����, ���� �� ���� �ͼ� �� ���� ���� �ٵ� Ȥ�ö� ���� ����.., ');

insert into test_select values(5, '���� �༺�� �����ߴ�!, ������ �༺�� ���캸��?, �������� ����� �� �� �Ǵµ�.. ���ּ���  ��ġ �����Ⱑ �޷� �ִ� ��Ȳ, �ķ��� �������� �ʰ� ������ �ɾ�߰ڴ�. ���� ���� ������?, ���� ������� ���� �ְŰ����� ����� ����! ���� ���� �� ���� �߿��� ��, �̷��� �� ���� ������ ��Ȱ�� �ͼ����� ����.., ��å �� ��ó���� ��ü�Ҹ��� �ܰ� ������ ������ �߰��ߴ�! �ٸ� ����ü�� ������..?, ���ڱ� ����ġ�� ��ǳ��! ���ϵ��� ��� ������������ ���Ҵ�. ���� �� ��ǳ�찡 ���� �𸣴� ��Ȳ! ��� �صη��� �ϴµ�.., �׋� �︮�� ��� ��ġ. �޽����� �Դ�. �� ������� ���� �´ٰ�?', '�ٸ� �༺�� �Դٴ�.. ���� �ű��ϴ�, ���⼭ ���� ���� ������? ���� �����ȴ�, ��Ȯ�� ������ ���� �Ĳ��ϰ� ���캻��, ��� �ٴ� �߽����� ���ƴٴϸ� ���캻��, ���⿡ �ӹ��� ������ ã�ƿ� �ž�. �ִ��� ���������� �����Ѵ�, Ȥ�� ��ġ �����Ⱑ ���峵�ٸ�..? ���� ������ ���۵ȴ�, ��� ������ 50%������ ���� ������� ���� �� �ִ� ����, ��� ������ 100%������ �Ҽ��� ����鸸 ���� �� �ִ� ����, ���赵 100% ����! ���� ���� �Ϻ��ϰ� ����� ��!, ���赵�� ���� �����! ���� ȯ�濡 �°� ��ȭ���Ѿ� ��!, ģ������� ����� ��Ƽ�� �ò������ߴ� �������� �׸�������, �ָ� ���ɰ� �� �� ħ��.. �Ҽ��� �������� �׸�������, �����ٸ� ���� ���� �ɾ��! ģ�ϰ� ������ �� �̵��̾�!, ���� ������ �� ���� ������? ��а��� ��������, ���� �ð��� �ɷ��� �Ĳ��ϰ� ����ϴ� �� �߿���!, ���� ��ƴ�� �־ ������ ����ϴ� �� �߿���!, ���� �� ���� ���� ��������.. ������� ���� ���� �ؾ���!, �� ���� ���� �ž�! ���ۿ� ��� �� �� ���´ٱ�~!');

insert into test_select values(6, '���� �� �� ��δ�?, �ſ��� ���� �� �� �ڴ�?, ȭ���� ���� �� ����? , ��⿡ ������ �� ������?, �Ǻ� ������ ������ �� �� ������?, �󱼿� �Ϸ����� ���� �� ����?, �޺��� ���ϰ� ������ �� ����?, �󱼿� ���� ���� �� ����?, �� �Ǻ��� ����?, ���� ���̴�?, ó�� �� ����� �����̶�� ���� �� �� ������?, �󱼿� ���� �ڱ��� ������ �� ����?', '����̳� �������� ����, �Ǻΰ� ���ϰ� ����, ����� �� ������ �ʴ´�, ����� �� ���δ�, ȭ���� �� ���� �ʰ� ����, ȭ���� �� ��������, �ݹ� �������, �������� �� ������� �ʴ´�, �Ǻ� ���� ��ȯ ġ�Ḧ ���� ���� ����, �Ǻ� ���� ��ȯ ġ�Ḧ ���� ���� �ִ�, ¥������ �ݹ� �������, ¥�� �� �������� ������ �д�, ���� �Ǻΰ� �Ӿ����� �� ź��, ���� �Ӿ����� �ݹ� ���ƿ´�, ��ҿ� �� �ִ� ���̶� �翬�ϴ�, ��?? ���� �� ��, ��ο����� ���Ѵ�, �Ͼ����� ���Ѵ�, 35�� �̻��̴�, 35�� ���ϴ�, ���� �ִ� ���̶� �ƹ����� �ʴ�, �� ���� �� ���� ����ϴ�, �ݹ� �������, �ڱ��� ���� ���´�');

insert into test_select values(7, '���� �������� �� ������ ����?, ���� ��ҿ� ���� �� ����?, ���� �����ϴ� ����?, ���� ��ȹ�� ū ���� ���� �� �� �����Ǵ� ����?, ���ο� ���ڱ�⸦ ���� �޾Ҵ� �� �� ����?, ���� ���� ���� �� ����� ����?, ģ���� ������ �̾߱��ϴµ� ģ���� �߸��� �� ���� �̶� ����? , ������̶�� �� ����� �����ϴ���?, ������ ������ ����ϴٰ� �� �� ����?, ��ȹ�� ���� �� ����?, �������� ģ������ ������ �Դ� ����?, ����� �ذ��� ���� ���̹� �˻��� �ߴ� ����?', 'ģ����� ������ ��Ƽ�ϰ� �� ��!, ������ ������ ������ ��� ��!, �ֺ��� ������� ���带 ������ ����, ���� ���� ����� ����! �� ģ������!, �����ϰ� �����ϰ� �� �����θ� �����ϴ� ��Ÿ��, Ȱ���ϰ� �������̰� ������� �����ϴ� ��Ÿ��, ���� ���� ���� ������ �ذ��� �� ����, �̰� �� ���� ���� ���� ���� ����, �������� ����? �ϴ� �̸����� ���� ����, �������� ���鼭 �������� �� ����, ���� ���� �;��� �� ��ü�� ������ �Ѵ�, �̰͵� ���͵� ���� �; �ٹ���� ������ ���Ѵ�, �װ� �߸��� �� �³�, ���� �����ϱ⿡�� �̷��� ������~ �� �� �� ���� ������..?, ������� ����� ������ �ذ�ȴ� ������!, �������.. ���� ����� �� ������ ����� ���� ��..?, ����� �� ��̿� ����� ������ �ذ�� �ž�!, �� �����..? ���� ����� �� �־�?, ��ü���� �ƿ� ���θ� �����ϰ� ���뼺�ְ� ó��!, ���� ���� �ؾ� �ϴ� �ͺ��� ��ȹ�� ������ ö���ϰ�!, �� �� ���¾�? �ѹ� ����? ���� ��� ������?, �� ������~ ���� �ѹ� ������, ����� �ݴ븻�� �������̳�.. ��ȣ?, ��.. �̷� �� ������̱��� �̷��� �̷��� �ذ��ϸ� �ǰڱ�!');

insert into test_select values(8, 'ģ����� �̾߱⸦ �� �� ����?, �ñ��� �� �־ ī���� �ߴµ� ������ ���� ���� �� ����?, ���� �Դٰ� ������ �ҷ��µ� ������ ���� ���� �� ����?, ģ����� 1���� �ų��� ��� 2���� ���ڰ� �Ѵٰ� �� �� ����?, ��ҿ� ���� ��� �;��� ������ ���� �� ����?, ģ���� ��ȭ�� ���µ� ���� �ḻ�� ������ �� ����?, �� �� �ڸ����� �� ���ô� ģ���� ��� ���� �� ����?, ģ���� ���� ¥�� ���� �ſ� �Ÿ� �Դ´� �� �� ����?, ������ �ؾ� �� �� ����?, ���� �� �´� ���� � ���ϱ�?, ģ������ �Ⱥ� ������ ���� �� ����?, ��� �ð��� �ٰ����� ���� �� ����?', ' ������ ��⸦ ���� õõ�� ����Ѵ�, �ϰ� ���� ��Ⱑ �ʹ� ���Ƽ� ģ���� ���� ���� ����ϱ⵵ �Ѵ�, ģ����.. ���� ���� �� �� �ٷ�? ����, �ٻ� �� ������ ���� �� ������ ��ٸ���, �����! �����! �ϰ� ū �Ҹ��� �θ���, �� ���� ������..? �ϸ鼭 ���� �� ��ٷ� ����, �� �ǰ��ѵ� �ϴ� ����!, ���� �̾� �� �ǰ��� �� ���� �ȳ�, �Һ�� �ູ�� ���̴� ������ �糪 ���� �糪 �Ȱ��� ����!, ��.. �̹� �� ������ �����ϸ� �������� �̷�߰ھ�, ������ �ǵ��� ����? �� �̷� �ḻ�ϱ�? ã�ƺ���, �� ������� �ູ�ϰ� �������� �� �ž�.. ���� ����, ���? �� ���? ��? ��?, ����� ���θ� �� ��� �ұ�..?, �� �ſ� �� �� �԰�? �߹�?, ��? �� ¥�� ����?, �̾� ����� �� ����, �� ����� �� ������ ���� �ѹ� �ϰ� �� �ش�, ��ȹ��, ������, �׷� �� ������~ ������ �ѹ� ���ڱ�~, �� ������~ ���� ������?, ������Ŭ�ϰ� �ð��� ���� �� �� ���� �� ����, ���� ����ؾ� ���� �ʰڳ�.. ���� ���� ���� Ÿ����');

insert into test_select values(9, '���� ���� ��ȭ ��Ÿ����?, �ٸ� ����� ���⿡ ����?, ���ο� ��ҳ� ���ӿ� ���� �� ���� ����� ����?, ���𰡸� ��ġ�ϰų� ���� �� ���� �����?, ���� ����� ������?, ����(����)��Ÿ�ϰ� ����� ����?, ���� ����� ����� �� ���� ����� ����?, ����� ���� �� ����?, ������ ���� ���� ������?, ������ ��ȹ��?, ���̳� �����ϴ� ��Ÿ�Ϸ� ���� ����� ����?, ���� ���� ��Ÿ�ϰ� ����� ����?', 'Ȱ���ϰ� ��ȭ�ϸ� ��ȭ ������ �پ��ϴ�, ������ ���� �����ϸ� �ʿ��� ���� �ƴ϶�� ������ �ִ´�, �� �����ϸ� �����ϰ� ���� ����̴�, �������̰� Ȱ������ ���� �������� �ִ� ����̴�, ������ �ֺ��� �����⸦ ���Ǹ� �������ٴ� ����� �ϴ� ���̴�, ���� �ڱ� �ڽ��� �Ұ��ϰ� ��ȭ�� �õ��Ѵ�, �ѹ� ���� ������ ��ġ�ϰų� �����, �������� ���� ���� �״�� ��ġ�ϰų� �����, �������̰� ���λ����� �� �ٷ�� ����̴�,  ���°� ���̵� ǳ���� ����̴�, �� ������ �ϴ� �ͺ��� �������� ���� �پ��ϰ� �ϰ� �;��Ѵ�, ���� ���� �־��� �Ͽ��� �����Ѵ�, �� ����� ������ �Ǿ� �������� ������ �� �ش�,  ����� ������� �������� ������ �� �ش�, ������ ����� �����ϴ� �� ������ ���ϴ�,  ���￡�� �̱�� ���� �߿��ϴ�, ����� ���� ���� ������ ���� ������� ���� ȭ�� ���� ��찡 ����, ������� ���� ȭ�� ���� ���� �幰�� ������ �����ϴ� ���� �幰��, ��ȹ�� �ϳ����� ������ �����ϰ� ö���ϰ� ����� ���̴�, ū Ʋ�� ��� �������� �����ϰ� ó���ϴ� ���̴�, ������ �������� �׶��׶� ���Ƽ� ������, �ð� ������ ��ȹ�� ���� ����(����)�� ������, ���������� �׳��� ������ ���� �����Ѵ�, ���� �����ϰ� ��ȹ�� ���� ������ �����Ѵ�');

insert into test_select values(10, '�׳� �ƹ� �������� �� ��� ���� �� ����?, ���θ� �ؾ� ������ �ϱ� ���� �� ����?, ���࿡ �װ� 500���� �־���.. �׷� ��� �� �ž�? ��� ������ �޾Ҵٸ�?, ���డ�� ���� ����?, �丮�� �� ����?, ������ �� �´� ������?, ���� ��ġ���� �� �´� ����?', '�۶����� ���� �ƹ� ������ ���� �ʴ� ���� ��ƴ�, �� �״�� �ƹ� ���� �� �� �� �ִ�, �ƴ� ���δ� �� �ؾ� �ϴ� �ɱ�? ���θ� �ؼ� ���� �� �̷��� ���̶� ���� ����?, ���� ������ �ʿ���? �׳� ���� �ϱ� �ȴٰ�, ��.. ���� �ϴ� ������ �Ű��� �߾�.. �����ϰ� ����ϰ� ����� �ش�, ����� �ϰ����� ������ �Ͼ���� �ʴ� �Ͽ� �� ����ؾ� �ϳ� �ʹ�, ���� ���� �ʹ�! ���� �ٸ� �� �ٷ� �ῡ ���, �ڱ� �� ���������� �Ͼ ��ǵ鿡 ���� �°� ����� �ϴٰ� ����, �����ǿ� ���� ��� ������ ���� ���߷��� ����Ѵ�, ���� ������ ������ �ǰ���~ �ϸ� ������ �ִ´�, �������� ���λ����� �ٷ�� ����, ���°� ���̵� �䱸�Ǵ� ����, �̷��� �������� ������ ������ ����, ���簡 ������ �̷��� ����');

insert into test_select values(11, 'ģ���� ���� �� ����ŷ ������ Ŭ������ �����Ϸ��� �Ѵ�., ��ȹ�� ����� �� ģ���� ������ ��ó���� ���ڰ� ����ٸ�?, ������ ������ ���� ���̴�. ģ���� ���ڱ� ���� ���ܼ� �ʰ� �����Ѵٰ� ���� �� ���� ���� �ϴ� ����?, ���� ���� �ſ� ������ ����̴�. �̶� ����� ��ã�� ��Ÿ����?, �����ߴ�! �׷��� �˰����� ģ���� ������ �ٸ� ��¥�� �س��Ҵ�. �̶� ���� ���� ��� ������?, �쿩���� ���� ��Ʃ��� ����. �װ��� �������� ���� ��â�� �ִ�!, �������� ��Ű �丮 �ÿ� �Ŀ� ���� ����� �ð�! ��� �����?, ȣ��Ʈ�԰� ��ȭ�� �ϴ� �߿� ���߿� � ������ ��� ������ �̾߱⸦ ������ �Ǿ���., ������ ȣ��Ʈ/�������� �ٰ��� ��Ǯ�̸� ���ڰ� ����ٸ�?, ���� ���� �濡 SNS�� Ŭ���� �ı���� �ø����� �Ѵ�. �̶� �����?, Ŭ������ ������������! ������ �� �ؾ���~��� �����Ѵٸ�?, ģ���� �� ���� �Ϸ���? ���������!','��ġ. ����. �ı�. ����. ���� ��. ����., ��Ʃ��� �����⵵ ���� ��Ű�� ���־� ���̳�!, �׷�. ���� ��� �ֺ� ��� �ѷ�����~, �̸� ��ó ī�� �˾ƺ���. �ı� ���� ���� ����!, �� ��¥? ���� �� �־�?, �˾Ҿ�! �� �� ���� �ɷ�?, ���۸ʰ� �Ͻɵ�ü, ���� ���� ������ -�� ���!- �Ҹ� �� ��´�., (�� �ʹ� ��Ȳ�߳�)�� ������~, �ܿ��� ������ ���� �������� ����. ���� ��� ����., ���� ���� �������̾�~ �λ��Ѵ�., �λ��ұ�...? �����Ѵ�., �˷��ֽ� ������ ��� �״�� ������., �̰� ���? ����� ���� ���� ����� ������ ����., ��ǵ� ���� ���뵵 ���� ���̸� ���ھ��., ������ ������ �������� ��� �;��., ���ƿ�~��� �����?, (����ϴ�)���� ���� �����Կ�! ���� �ð� ��������!, �������� ���� ģ���� #����ŷ��Ÿ�׷�, �� ���ݿ� �� ���� �����̸� �Ǹ��ߴ�! ���� 4.5��, ���߿� �� ��մ� �� ���� �ֳ� ���߰ڴ�., ���� �ֿ� �� ����? �����س��߰ڴ�., ī���ϱ� ��������.. ��ȭ�ؾ߰ڴ�., ��ȭ�ϱ� ��������.. ī���ؾ߰ڴ�.');

insert into test_select values(12, '�� ����ؼ� �Ӹ� �߶���, ���� �Բ� �ϰ� ���� ���϶�(Ȥ�� ������)��?, ������ ����� �ߴµ� A�� B ���� �տ��� ���� ��, �˰� ���� ������ �������̶��?, ���� ��ü��, �Ľ�Ÿ�� ������� �ϴµ� ��ᰡ ��������, ���� �������� �ǹ̴�?, ���Կ� ���µ� ������ ������ ������ ��ġ�� ����.., ȥ�� ���� �� ���� �����?, ��â ���� �غ��� �غ� �� �� ����?(ex. ������), �� �㸮�� �ʹ� ���ļ� ���� ġ�� �ް� �Ծ�, ģ������ ���� ���� �ִ� ī�� ��ġ�� �˷��� ��', '��..�׷��� �� ��︰��!(�켱 Ī�����ֱ�), �� ������ ������?(�켱 �������ֱ�), ���������� �׻� �ϰ����� �ִ� ���, �ϰ����� ���������� �ΰ����� ���� ���, ��� �˻���..A�� ���䵵 ���� �����ϳ�. �����!, �����̶� ���׸��� ���ϱ� B�� �����̾�. ���� ����?, ���! �ٷ� ģ����� ����� ��´�., ���! ȥ�ڸ��� �ð��� ����., �̸� ��ȹ�� ����� ���̴�., ���� �����Ȳ�� ���Ѻ��� ��ȹ�� ����� ���̴�., ��Ʈ�� ���� �� ���� ���� ��� ����Ʈ�� �������� �ۼ��Ѵ�., �켱 ��Ʈ�� �� �Ŀ� �ʿ��� �� �����Ѵ�(1�� ������ ���������..), �ƹ� ���� �� �ϴ� ��, ������� ������ ������ ���� ��, �͵� ���� ��� ����. ���� ���� ���� �ְ�, ���� ������ �� ������.., �ɽ��ϴ�.., ��ȭ�Ӵ�!, ���� ���� ������ ����..�Ϸ� ���� �غ��Ѵ�., ��濡 �����..���Ͽ� �غ��Ѵ�., ���� ġ�� �󸶾�? ȿ�� �־�?, �� �㸮�� ���ĤФй��� �� �־�?,  2�� �ⱸ�� ���ͼ� 3��° ���Ͽ��� ��ȸ�� ��, �������� ���̾�(�ֺ� ���帶ũ ����)' );

insert into test_select values(13, 'ģ���� �ݷ����� ������ �� ����?, �����ο� �ָ� ���� �ݷ��߰� �Բ�, �ݷ��߰� �Բ� ��å ���� �� ����?, �ݷ��߰� ������ ���ٸ� ����?, ã�ư� ������ ���� �ݾҴٸ�?, ��� ���� �� �ſ��� ���� ��� ������?, ȸ�翡�� ��� �ƾ� ��� ���� �� ģ������ ����?, ������ ���Ͽ� ����?, �� ���� Ȥ�� ���� �� �� ����?, ���� �ް� ���� ���������� ������?', '�Ǵϴ� �� ����. �ǹ̿��� �Ϸ翡 ���� ����, ������ ��â ������ �Ǵ� �� �Ϳ��� �Ф� �Ŀ� ����, ���� �츮 �Ѹ� ���� �� �ܵ��� �ǳɲǳ� ��å, �ٸ� ����� ģ������ ã�� �ݷ��� ���� ī��� ����, �ݷ����� ���¸� üũ�ϸ� ���� �ֽ�, �ֺ� ������ �ϸ鼭 �ݷ��߰� ��ī�� ��Ĭ!, �̹� �ݷ��� ���� ������ �ڽ��� ¥���Ҵ�, ���� ������ �ٷ��� ������ �������� �����, ��ٷ� �ٸ� ������ �˻��� ����, ������ ������ ���� �ֺ��� �ٸ� �Ĵ��� ã�ư���, ���� 1�ð��̳� �߳� ��� �����ϸ� ���� ������ ����, ���� �ٷ� �ټ���? ���� ���� ���� �������� ����, ���� ������ ��ü������ �����, ����� ģ������ �����ϰ� ���� ��Ȳ���� �����, �ڸ� Ǯ�����ϰ� ���ø��� �������ϸ� ����, ���� ��ӵ� ���� �� ������ Ż��, ���θ���Ʈ�� �������ﰳ. ���� ����ȭ �ڽ��� �����δ�, �Ż���� �ѷ����� īƮ�� ���� ��´�, ������ �� �ʿ��ߴ� �ǿ����� ����, ������ ���� ���� �θ�ƽ�� �ɰ� ����');

insert into test_select values(14, '����ö �հ� ȸ�� ����! �ð踦 ����?, ���� �� �ڸ��� ���ڸ��� �� �ؾ� �ϴ� ����?, ������ ������Ʈ �߰����� �� ����� �տ� �� �� �����?, ȸ�� �� �ð� �� ���ο� ����! ��� ���� �����غ���?, ���ڱ� Ŀ�� �������ڴ� �����.. �� ���� ������ε�, ���� ���� �� ������? ������� ������ ���´�, �ʹ� ���� �Ծ���? ���� �������.., �ŷ�ó�κ��� �ɷ��� ��ȭ. ���õ��� ������ �繫���� �����ѵ�.., �غ��ؿ� ������Ʈ�� �뼺���ߴ�! �� ������ �����ϴ� Ī����?, �׷��� ���� ������ ���޳�! �۰� ������ �������� ����?, �۾��ϴ� �� ���ư��� �Ф� ��� ���⿡�Լ� �� �޽����� ����? ��� 10�� �� ������ �׿� �ִ� ������. ���õ� �ٰ߱��ΰ�..', '��� �ð� 10�� �� ����. ����? �װ� ����?, 8�� 59�� ����. ���ϸ��� ¥���� ���, �ƹ��� �ٺ��� �� �� ����Ʈ�� �ʼ�?, ����� ����! Ŀ�� �������� ������ ã�´�, �ڷ�� �ŵ� ��! ��Ƽ���⽺�� �����Ѵ�, ��ǥ ������ ������ ��.. �غ��� �뺻�� �д´�, �μ��ΰ輭 ù ���������� �����Ѵ�, ���� ������ ���� ����! �� ��Ĵ�� �ٽ� �����Ѵ�, ���� �ٻ۵�.. ��� ��������?, ����? �� �߸��߳�? ���� �����ϸ鼭 ���󰣴�, ���ڸ��� �չ� ����. ���� �˻��� ������ �ȴ�, �߱��� �����? �̶��� �;� �԰� �ʹ� �� ���Ѵ�, ���� ������! ��� ��å�ϰ� �´�, ���� ������. �̸� �� �ƹ��� ���´�, ��ġ ��ġ.. ������ ��ȭ�Ѵ�, �Ӽ� �������? �ڸ����� ���ϰ� �޴´�, �� ���� �̷��� �غ��߾�? ���� ������ �ֳ�, �׷��� ������ �ϴ���! �� �س� �� �˾Ҿ�, �ĺ�� ��Ȱ��� ���� ������ ö���� ��ȹ�� ���� �Һ��Ѵ�, �Աݵ��ڸ��� �� �������� �����Ѵ�, �ڵ� ����� ���� ����? �ذ� ����� ã���ش�, �� �߱��ϸ鼭 ������ݾ� �Ф� ������ ������ �Բ��Ѵ�, ������ ���� �߱��� ������(������ �������� �� ������), ���� ���� ������ ������ �佺');


drop table test;
drop table user;
drop table test_select;
drop table test_result;