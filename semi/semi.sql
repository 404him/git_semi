
-- This is Semi Project SQL Script File --


--- Next Execute All Line (이후 실행 라인) ---

-- Drop Sequence Line --

DROP SEQUENCE seq_member_idx;
DROP SEQUENCE seq_news_idx;
DROP SEQUENCE news_s3attechment_seq;
DROP SEQUENCE seq_news_like_idx;
DROP SEQUENCE seq_category_idx;
DROP SEQUENCE seq_subscribe_idx;
DROP SEQUENCE seq_reply_idx;
DROP SEQUENCE seq_report_idx;

-- Drop Table Line --

DROP TABLE REPORT;
DROP TABLE REPLY;
DROP TABLE SUBSCRIBE;
DROP TABLE NEWS_LIKE;
DROP TABLE news_s3attechment;
DROP TABLE NEWS;
DROP TABLE CATEGORY;
DROP TABLE MEMBER;


--- First Execute All Line (처음 실행 라인) ---

-- Create Sequence Line --

CREATE SEQUENCE seq_member_idx;
CREATE SEQUENCE seq_news_idx;
CREATE SEQUENCE news_s3attechment_seq;
CREATE SEQUENCE seq_news_like_idx;
CREATE SEQUENCE seq_category_idx;
CREATE SEQUENCE seq_subscribe_idx;
CREATE SEQUENCE seq_reply_idx;
CREATE SEQUENCE seq_report_idx;


------ 이지훈's 테이블  --------

-- Member
CREATE TABLE MEMBER (
                        mem_idx 	  INT PRIMARY KEY ,					-- 회원 고유값
                        mem_id		  VARCHAR2(100) NOT NULL UNIQUE ,	-- 회원 아이디
                        mem_pwd  	  VARCHAR2(100) NOT NULL,			-- 회원 비밀번호
                        mem_name 	  VARCHAR2(100) NOT NULL,			-- 회원 이름
                        mem_nickname  VARCHAR2(100) NOT NULL UNIQUE ,	-- 회원 닉네임
                        mem_phone	  VARCHAR2(100) NOT NULL,			-- 회원 전화번호
                        mem_img_url	  VARCHAR2(400) ,					-- 회원 프로필 이미지
                        mem_zipcode   VARCHAR2(100) NOT NULL,			-- 회원 우편번호
                        mem_addr 	  VARCHAR2(200) NOT NULL,			-- 회원 주소
                        mem_birth 	  VARCHAR2(100) NOT NULL,			-- 회원 생년월일
                        mem_lockcount INT DEFAULT 0 NOT NULL,			-- 계정잠금 카운트
                        mem_use		  varchar2(1) DEFAULT 'y' NOT NULL CHECK(mem_use IN ('y','n')) , 	-- 계정 활성화 상태
                        mem_grade 	  varchar2(10) DEFAULT '일반' NOT NULL CHECK(mem_grade IN ('일반','기자','관리자')) , 	-- 회원 등급
						mem_regdate   DATE DEFAULT SYSDATE   NOT NULL	-- 회원가입 날짜
);

-- 회원 더미 데이터

INSERT INTO MEMBER values(seq_member_idx.nextval,'admin','1111','관리자','관리자','010-1111-1111','https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/default/admin.png','우편번호1','주소1','1997-02-17',DEFAULT, DEFAULT, '관리자', DEFAULT);
INSERT INTO MEMBER values(seq_member_idx.nextval,'reporter1','1111','기자1','기자일번','010-1111-1111','https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/default/default_member_image.jpg','우편번호1','주소1','1997-02-17',DEFAULT, DEFAULT, '기자', DEFAULT);
INSERT INTO MEMBER values(seq_member_idx.nextval,'reporter2','2222','기자2','기자이번','010-2222-1111','https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/default/default_member_image.jpg','우편번호2','주소2','1997-02-22',DEFAULT, DEFAULT, '기자', DEFAULT);
INSERT INTO MEMBER values(seq_member_idx.nextval,'reporter3','2222','기자3','기자삼번','010-2222-1111','https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/default/default_member_image.jpg','우편번호2','주소2','1997-02-22',DEFAULT, DEFAULT, '기자', DEFAULT);
INSERT INTO MEMBER values(seq_member_idx.nextval,'user1','1111','회원1','회원일번','010-1111-1111','https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/default/default_member_image.jpg','우편번호1','주소1','1997-02-17',DEFAULT, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO MEMBER values(seq_member_idx.nextval,'user2','1111','회원2','회원이번','010-1111-1111','https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/default/default_member_image.jpg','우편번호1','주소1','1997-02-17',5, 'n', '일반', DEFAULT);
INSERT INTO MEMBER values(seq_member_idx.nextval,'user3','1111','회원3','회원삼번','010-1111-1111','https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/default/default_member_image.jpg','우편번호1','주소1','1997-02-17',5, 'n', '일반', DEFAULT);


-- SELECT * FROM MEMBER;

------ 성수&순철's 테이블  --------

-- Category
CREATE TABLE CATEGORY (
                          category_idx NUMBER PRIMARY KEY ,
                          category_name varchar2(100) NOT NULL UNIQUE
);

-- 카테고리 데이터

INSERT INTO CATEGORY VALUES (seq_category_idx.nextval,'정치');
INSERT INTO CATEGORY VALUES (seq_category_idx.nextval,'연예');
INSERT INTO CATEGORY VALUES (seq_category_idx.nextval,'스포츠');


-- News
CREATE TABLE NEWS (
                      news_idx NUMBER PRIMARY KEY ,
                      news_title varchar2(200) NOT NULL ,
                      news_thumbnail_image varchar2(400) ,
                      news_content CLOB NOT NULL ,
                      news_count NUMBER ,
                      news_createAt DATE DEFAULT sysdate NOT NULL ,
                      news_updateAt DATE ,
                      mem_idx NUMBER NOT NULL ,
                      category_idx NUMBER NOT NULL ,
                      CONSTRAINT fk_news_member_idx FOREIGN KEY (mem_idx)
                          REFERENCES MEMBER (mem_idx) ON DELETE CASCADE ,
                      CONSTRAINT fk_news_category_idx FOREIGN KEY (category_idx)
                          REFERENCES CATEGORY (category_idx)
);

-- 뉴스 더미 데이터

INSERT INTO news values(seq_news_idx.nextval, '윤 대통령, 이진숙 방통위원장에 임명장 수여··· 야당은 탄핵절차 돌입', 'https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/default/%EC%A0%95%EC%B9%981.jpg','이들은 탄핵안에서 "이 위원장의 경우 인사청문회에서 도덕성과 자질에 큰 문제가 드러났지만, 윤석열 대통령은 아랑곳없이 임명을 강행했다"고 비판했다.<br>더불어민주당·조국혁신당·진보당·사회민주당·새로운미래·기본소득당 등 6개 야당은 이날 이 위원장에 대한 탄핵소추안을 당론으로 채택하고 국회 의안과에 제출했다.<br>야당이 방통위 관련 탄핵안을 제출한 것은 이동관·김홍일 전 방통위원장과 이상인 전 방통위원장 직무대행에 이이 이번이 네 번째다.<br>이번 탄핵안은 이날 오후 열리는 본회의에 보고될 예정이며, 그 뒤 24시간 이후부터 72시간 이내에 무기명 표결을 거치게 된다.', 27, DEFAULT, NULL, 2, 1);
INSERT INTO news values(seq_news_idx.nextval, '정부, 적십자사 통해 수해 피해 북한에 물자 지원키로', 'https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/default/%EC%A0%95%EC%B9%982.jpg', '정부가 최근 폭우로 압록강 범람의 수해를 입은 북한에 물자 지원을 하겠다는 의사를 표명했다. 남북 간 통신선도 없이 남북관계가 사실상 최악으로 치닫는 상황에서 북한이 어떤 반응을 내놓을지 주목된다.<br>앞서 지난달 27일 폭우 발생으로 압록강이 범람하면서 인근 지역이 적잖은 피해를 입은 것으로 나타났다. 같은 달 31일 <조선중앙통신>은 압록강 하류에 있는 평안북도 신의주시와 의주군에서폭우로 4100여 세대와 농경지 3천 정보를 비롯해 공공건물과 시설물, 도로, 철길이 침수됐다고 보도했다.<br>박 사무총장은 "우리측은 북한 주민들이 처한 인도적 어려움에 대해 인도주의와 동포애의 견지에서 북한의 이재민들에게 긴급히 필요한 물자들을 신속히 지원할 용의가 있음을 밝힌다"며 "지원 품목, 규모, 지원 방식 등에 대해서 북한 적십자회 중앙위원회와 협의할 준비가 되어 있으며, 조속한 호응을 기대한다"고 말했다.', 12, DEFAULT, NULL, 2, 1);
INSERT INTO news values(seq_news_idx.nextval, '티메프 물린 소상공인들 도산이냐 빚쟁이냐…정부, 대책 내놔라', 'https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/default/%EC%A0%95%EC%B9%983.jpg', '티메프 사태는 대금 정산일이었던 지난달 7일 위메프 입점 업체 셀러 500여 명이 대금을 지급받지 못한 사실이 온라인에 확산하면서 촉발했다. 이후 사태는 티몬으로도 번졌다.<br>티메프가 정산해야 하는 판매 대금은 현재까지 약 1조 원 규모로 추산된다.<br>이에 이대건 중소벤처기업부 소상공인 정책국장이 "최대한 신속하게 집행될 수 있도록 관계 부처에 사안을 전달하겠다"고 답하자, 이 의원은 "6~7일이 정산기일인데 잘못되면 도산할 수 있고 한분 한분이 집안의 가장이시다. 쉽게 생각하면 안 되고 해결되실 때까지 집에 못 들어간다 생각하고 책임지셔라"고 말했다.', 27, DEFAULT, NULL, 2, 1);
INSERT INTO news values(seq_news_idx.nextval, '채 상병 특검법, 한동훈 안 놓고 여야 엇갈린 셈법', 'https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/default/%EC%A0%95%EC%B9%984.jpg', '채 상병 특검법과 관련 제3자 특검 추천 방식이 정치권의 화두로 부상했다. 국민의힘 한동훈 대표가 제안했던 3자 특검 추천에 대해 야당 일각에서 적극 수용해야 한다는 주장이 나왔다. 야당에서 한동훈 안을 먼저 발의해 국민의힘을 압박해야 한다는 주장이다. 다만 더불어민주당 이재명 전 대표 등은 제3자 추천 특검에 부정적인 반응을 보였다.<br>친명계에서도 온건파인 정성호 의원은 한동훈 안을 논의할 필요가 있다고 주장했다. 정 의원은 이날 KBS 라디오 전격시사 인터뷰에서 한동훈 안에 대해 “논의해봐야 한다”고 말했다. 정 의원은 “여야가 정략적으로 판단할 게 아니라 진실 규명이 가장 중요하니까 (다른 특검안과)같이 테이블에서 논의해 볼 필요가 있다”고 말했다.<br>그러나 야당이 실제로 한동훈 안을 수용해 법안을 발의해도 여야 합의 통과가 어려울 것이라는 분석도 나온다. 국민의힘의 한 의원은 이와 관련 “한 대표는 독소조항이 제거된 특검법을 말했다”면서 “독소조항의 내용에서 야당과 합의점을 찾기 어렵기 때문에 여야 합의로 특검법을 처리할 가능성은 낮다고 본다”고 말했다.', 5, DEFAULT, NULL, 2, 1);
INSERT INTO news values(seq_news_idx.nextval, '하니예 암살에 중동 정세 격랑... 대통령실 "유사시 교민 철수"', 'https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/default/%EC%A0%95%EC%B9%985.jpg', '팔레스타인 무장 정파 하마스 최고 지도자의 암살 사건으로 중동 정세 악화 가능성이 커지면서 대통령실이 1일 관련 대응 회의를 열고 유사시 교민 철수 대책 등을 논의했다.<br>대통령실은 이날 오전 장호진 국가안보실장과 성태윤 정책실장 공동 주재로 ‘중동 상황 관련 안보 경제 합동 점검회의’를 개최하고 현지 교민 안전 강구 방안과 유사시 교민 철수 대책 등을 검토했다. 최근 하마스 최고지도자 이스마일 하니예가 이란 새 대통령 취임식 참석차 테헤란을 방문했다가 암살을 당하면서 중동 위기가 고조된 데 따른 차원이다.<br>대통령실은 현 상황에 대한 관련 중동 국가들의 입장과 향후 정세 전망을 분석한 후 이에 따른 외교적 대비책을 마련할 방침이다. 이번 사건으로 바이든 정부 역시 "분명 긴장 고조를 우려하고 있다"는 입장을 밝히며 당혹감을 감추지 못하는 만큼, 미국 등 주요 국가들의 움직임도 예의주시할 방침이다.<br>이날 회의에선 "중동 사태 등으로 국제유가가 상승했으나 원유·가스 수급 및 유조선 운항 등 국내 수급상 영향은 없다"며 "국내외 금융시장의 경우에도 미국 통화정책 변화 기대에 더 큰 영향을 받으며 대체로 안정적이다"라는 평가가 나왔다. 다만 향후 중동 지역 정세 급변 가능성이 큰 상황이라, 긴장감을 가지고 국내외 시장 동향을 예의주시할 계획이다.', 2, DEFAULT, NULL, 2, 1);
INSERT INTO news values(seq_news_idx.nextval, '정보사 블랙요원 정보 유출, 건국 이래 최대 방첩 실패', 'https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/default/%EC%A0%95%EC%B9%986.jpg', '국군정보사령부 대북 요원들의 신상정보 등 군사기밀이 유출된 데 대해, 윤건영 더불어민주당 의원이 1일 “대한민국 건국 이래 정보전에서 최대의 사고가 터진 것”이라고 비판했다.<br>윤 의원은 이날 문화방송(MBC) 라디오 ‘김종배의 시선집중’에 출연해 “자세한 내용은 수사를 통해 밝혀야 하겠지만 분명한 건 건국 이래 최대의 정보 실패, 방첩 실패 사건(이라는 점)”이라며 이렇게 말했다.<br>윤 의원은 “블랙 요원(신분을 숨기고 활동하는 요원)의 명단이 유출됐다는 건 정보망 자체가 무너진 것”이라며 “정보기관에서는 블랙 요원을 귀국시켰다고 하는데 쉽게 납득되지 않는다. 가족들이 남아있을 수 있는데 블랙 요원만 귀국하면 뭐하는가”라고 지적했다. 이어 “일례로 귀국 조치할 때 급하게 기밀서류들만 소각하고 왔다는 건데, 그럼 운영했던 사무실이라든지 업체라는 그대로 두는 것이다. 그렇게 되면 (블랙 요원과 현지에서 협조했던) 망들은 다 드러날 수밖에 없다”고 덧붙였다.<br>한편, 윤 의원은 윤석열 대통령이 김문수 경제사회노동위원장을 고용노동부 장관 후보자로 지명한 데 대해 “윤 대통령의 인재풀 자체가 거론할 상황도 아닌 것 같다. 아예 없다. 한마디로 완벽하게 실패한 인사”라고 말했다. 윤 의원은 “(김 후보자는) 경사노위위원장이 아니라 그냥 보수 유튜버였다. 쌍용차 노조를 자살 특공대라고 했던 분”이라며 “이런 분을 어떻게 고용노동부 장관에 임명하겠다는 생각하는지 그것조차도 정말 궁금하다”고 했다.', 27, DEFAULT, NULL, 2, 1);
INSERT INTO news values(seq_news_idx.nextval, '2PM 이준호, 압구정 로데오 175억원 건물주!...故 강수연 건물', 'https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/default/%EC%97%B0%EC%98%881.jpeg', '그룹 2PM 멤버 겸 배우 이준호(34)가 압구정 로데오거리의 건물주가 됐다.<br>1일 부동산 업계에 따르면 이준호는 지난 3월12일 서울 강남구 신사동 소재 지하 1층, 지상 4층 규모의 상가건물을 175억원에 매입했다. 대지면적 323.70㎡(97.92평), 연면적 830.8㎡(251.32평)인 해당 건물은 사무실, 브런치카페, 네일숍, 발레학원 등이 입점해 있으며 가족법인(제이에프컴퍼니) 명의로 샀다. 보증금 2억원, 월 임대료 2000만원(수익률 1.4%)이며, 신한자산신탁회사에 신탁돼 있다.<br>빌딩랩부동산중개법인의 박지은 차장은 “압구정 로데오역에서 도보로 5분거리에 있는 이 건물은 압구정 로데오와 도산공원 인근에 위치해 평일과 주말 모두 유동인구가 많은 곳이라 상권이 좋다”며 “메인 골목 코너에 위치해 가시성이 우수하고 현재 임대수익은 낮은 수준이나 인근 거래 사례에 비해 좋은 시세에 매입했다”고 평가했다.<br>특히 이준호가 매입한 건물은 지난 2022년 5월 뇌출혈로 세상을 떠난 고(故) 배우 강수연이 지난 2017년 80억원에 산 곳으로, 강수연 사망 후 가족 3명에게 상속됐다.<br>이준호는 지난 2019년 2월 서울 청담동 소재 고급 오피스텔 ‘더 리버스 청담’ 2개 호실의 소유권을 신탁사로부터 이전받으며 뛰어난 부동산 투자 수완으로 화제를 모았다. 여관을 재건축한 신축 오피스텔이 지어지기 전 지주작업을 할 때부터 투자해 상당한 이익을 거둔 것으로 알려졌다.', 27, DEFAULT, NULL, 3, 2);
INSERT INTO news values(seq_news_idx.nextval, '아이유, 76세 美 유애나 할아버지 만났다...“구름 위 걷는 기분”', 'https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/default/%EC%97%B0%EC%98%882.jpg', '가수 아이유 팬으로 화제를 모은 미국인 할아버지 제브 라테트가 깜짝 소식을 전했다.<br>1일(이하 한국시간) 라테트는 자신의 유튜브 채널을 통해 한 장의 사진을 게재했다. 공개된 사진 속 라테트는 아내와 함께 아이유와 만나 기념사진을 찍고 있는 모습이다.<br>라테트는 아이유 콘서트를 다녀온 사진과 함께 후기 영상을 올리기도 했다. 당시 아이유에게 싸인 CD와 한국 전통 비녀, 나비 넥타이 등을 선물 받았다고 자랑했다.<br>그러면서 “콘서트 여파로 비몽사몽이지만 구름 위를 걷는 기분”이라며 “아이유가 나를 안아줬고 얘기를 나눴다. 정말 꿈만 같았던 믿을 수 없는 시간이 됐다”고 소감을 밝혔다. 이어 “환상적이었다. 꿈이 이뤄졌다”고 당시를 떠올렸다.<br>‘유애나 미국 할아버지’로 알려진 라테트는 자신의 유튜브 채널을 운영하며 K드라마와 아이유의 영상을 올려왔다. 아이유는 할아버지의 영상을 보고 직접 콘서트에 초대하기도 했다.', 27, DEFAULT, NULL, 3, 2);
INSERT INTO news values(seq_news_idx.nextval, '다시 뭉친 2NE1 데뷔 15주년 콘서트에 쏠리는 기대', 'https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/default/%EC%97%B0%EC%98%883.jpg', 'YG엔터테인먼트는 8월 1일 공식 블로그에 2024 2NE1 CONCERT [WELCOME BACK] IN SEOUL - SPOT VIDEO를 게재했다.<br>관객들의 터질 듯한 함성 속 스테이지 곳곳을 누비며 무대를 장악하는 멤버들의 모습이 짜릿한 전율을 안긴다. 2NE1 특유의 화려한 퍼포먼스도 보는 이의 눈과 귀를 사로잡은 지점. 특히 멤버들의 진심이 담긴 감동적인 멘트가 과거 추억을 불러일으키며 완전체 콘서트를 향한 기대감을 증폭시켰다.<br>이날 공식 블로그에 공개된 티켓 오픈 티저 포스터 역시 이목을 집중시켰다. 이는 지난 2014년 ALL OR NOTHING 투어 사진을 활용한 것으로, 카메라를 향해 환하게 웃고 있는 멤버들과 블랙잭(팬덤명)의 모습이 뭉클함을 선사했다.<br>2NE1은 오는 10월 5일과 6일 양일간 서울 올림픽공원 올림픽홀에서 2024 2NE1 CONCERT [WELCOME BACK] IN SEOUL을 개최한다. 이후 일본 고베와 도쿄 공연을 비롯 그 외 일정을 점차 확대해가며 내년까지 가급적 많은 나라의 관객들을 찾아간다는 계획이다.', 27, DEFAULT, NULL, 3, 2);
INSERT INTO news values(seq_news_idx.nextval, '유병재 건강 악화로 응급실行 “간 수치 2000, 수술 가능성 높다고”', 'https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/default/%EC%97%B0%EC%98%884.jpg', '유병재 건강 악화로 응급실行 “간 수치 2000, 수술 가능성 높다고”<br>유병재는 지난달 29일 자신의 유튜브 채널에 “응급실 다녀온, 소름 돋은 유병재”라는 제목의 쇼츠 영상을 게재했다.<br>영상 속 그는 “피 검사를 한 번 했는데 결과부터 말씀드리면 간 수치 평균이 40인 것으로 알고 있는데 2000이 나왔다. 병원에서 ‘오늘 진단해야 하고 오늘 수술 들어갈 가능성이 높다’고 하더라”고 고백했다.<br>유병재는 “상담 받고 나왔는데 규선이 형(매니저)이 없더라. 화장실 갔나 싶었는데 진료실에서 나오더라. ‘내가 생각했던 것보다 상황이 심각한가? 형에게 따로 이야기해야 하는 상황이었나?’ 했는데 그 사이에 다이어트 약을 진료 받고 나온 거더라”고 폭로(?)했다. 이어 “진료 기다리면서 대기하고 있을 때 형이 센다 센다 막 그래가지고 뭐라 그러는 거지 싶었는데 O센다라는 다이어트 약이 있더라. 어느 정도면 나도 웃는데 리얼 소름 돋았다”고 털어놨다.<br>다급하게 등장한 매니저가 해명하려는 찰나에 영상이 끊겨 해명은 듣지 못했다.<br>유병재는 지난달 19일 자신의 인스타그램에 입원한 사실을 알렸다. 최근에는 최장기간 금주 중이라고 소식을 전하기도 했다.', 27, DEFAULT, NULL, 3, 2);
INSERT INTO news values(seq_news_idx.nextval, '맨유 사기당했나? 오자마자 3개월 부상 충격…<br>믿었던 공격수도 6주 OUT', 'https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/default/%EC%8A%A4%ED%8F%AC%EC%B8%A01.jpg', '맨체스터 유나이티드가 본 시즌을 시작하기도 전에 핵심 전력 두 명을 잃었다.<br>여름 이적시장에서 영입된 프랑스 출신의 유망한 수비수 레니 요로와 지난해 영입돼 향후 팀의 공격을 이끌어줄 것으로 기대됐던 라스무스 회이룬이 프리시즌 친선경기에서 부상을 당해 한동안 경기에 출전하지 못하게 됐다.<br>젊고 쌩쌩한 센터백 조합으로 노선을 갈아타려던 상황에서 요로가 쓰러진 것이다. 가뜩이나 요로는 이제 맨유와 PL에서 보내는 첫 시즌이기 때문에 적응할 시간이 필요한데, 동료들과 채 합을 맞춰보기도 전에 부상을 당하면서 맨유 커리어를 어렵게 시작하게 됐다.<br>설상가상 같은 경기에 선발 출전한 회이룬마저 쓰러졌다. 회이룬은 16분 만에 햄스트링 부상을 당해 경기장을 빠져나갔다. 럭허스트는 회이룬이 복귀하기까지 3주가 걸릴 것으로 예상하고 있지만, 햄스트링이 재발률이 높은 부상이라는 점을 생각하면 재발을 방지하기 위해 구단 차원에서 회이룬의 복귀 시기를 더 늦출 가능성도 적지 않다.<br>문제는 맨유 내에 회이룬을 대신할 수 있는 스트라이커가 마땅히 없다는 것이다. 맨유는 지난 시즌 최악의 경기력을 보여줬던 마커스 래시퍼드를 다시 믿어보거나, 이번 여름 이적시장에서 영입한 네덜란드 출신 공격수 조슈아 지르크지가 좋은 활약을 보여주길 기도해야 하는 상황이다.<br>럭허스트는 "마르티네스는 다음 주에 훈련에 복귀할 예정이지만, 맨유는 요로의 부상으로 인해 에버턴의 수비수 재러드 브랜스웨이트를 영입하기 위핸 세 번째 입찰을 할 수도 있다. 또한 맨유는 이번 여름 추가 영입에 열려 있는 가운데 바이에른 뮌헨의 수비수 마테이스 더리흐트에게도 관심을 갖고 있다"고 했다.', 27, DEFAULT, NULL, 4, 3);
INSERT INTO news values(seq_news_idx.nextval, '전반 25분 동안 무득점→"선수들 질책"... <br>방한 경기중 격노한 토트넘 감독, 뭐라고 했나', 'https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/default/%EC%8A%A4%ED%8F%AC%EC%B8%A02.jpg', '토트넘 선수들이 전반 중반 이후 달라진 모습을 보여준 이유가 있었다.<br>영국 매체 스포츠바이블은 1일(한국시간) “팀 K리그와의 경기에서 엔지 포스테코글루 토트넘 감독이 격노했다. 토트넘 선수들을 질책하는 모습이 포착됐다”라고 전했다.<br>포스테코글루 감독이 화가 난 이유로 전반 25분 동안 토트넘이 무득점에 그쳤기 때문이라고 매체는 분석했다.<br>포스테코글루 감독은 선수들에게 “맨투맨으로 싸워라. 앞으로 나아가라”라고 소리쳤다.<br>스포츠바이블은 “그의 말은 선수들에게 분명히 영향을 미쳤다. (전반 28분에 터진) 데안 쿨루셉스키 득점을 시작으로 손흥민의 멀티골까지 터졌다”라고 말했다.<br>포스테코글루 감독의 꾸지람을 들었던 토트넘은 승리를 챙겼다. 손흥민의 활약이 주효했다.<br>한편 최근 토트넘과 계약을 맺은 양민혁(18, 강원FC)이 손흥민을 보고 입을 다물지 못했다. 그의 활약이 동기부여로 작용하고 있다. 이날 양민혁은 전반 45분을 소화, 공격포인트를 기록하진 못했다.br>경기 종료 후 양민혁은 손흥민을 토트넘에서 가장 인상 깊은 선수로 꼽은 뒤 “슈팅이 정말 달랐다. 확실히 잘한다는 것을 다시 한 번 느꼈다. 저도 빨리 그 레벨에 도달해야 한다는 것을 많이 느낀 경기”라고 말했다.', 27, DEFAULT, NULL, 4, 3);

-- SELECT * FROM news;



CREATE TABLE news_s3Attechment(
                                  idx int PRIMARY KEY ,
                                  fileUrl varchar2(400),
                                  news_idx int ,
                                  CONSTRAINT fk_news_s3attechment_news_idx FOREIGN KEY (news_idx)
                                      REFERENCES NEWS (news_idx)
);



-- NEWS_LIKE
CREATE TABLE NEWS_LIKE (
                           news_like_idx NUMBER PRIMARY KEY ,
                           news_idx NUMBER NOT NULL ,
                           mem_idx NUMBER NOT NULL ,
                           CONSTRAINT fk_likes_news_idx FOREIGN KEY (news_idx)
                               REFERENCES NEWS (news_idx) ON DELETE CASCADE ,
                           CONSTRAINT fk_likes_member_idx FOREIGN KEY (mem_idx)
                               REFERENCES MEMBER (mem_idx) on delete cascade
);

-- 뉴스 좋아요 더미 데이터

INSERT INTO NEWS_LIKE values(seq_news_like_idx.nextval, 1, 1);
INSERT INTO NEWS_LIKE values(seq_news_like_idx.nextval, 1, 3);
INSERT INTO NEWS_LIKE values(seq_news_like_idx.nextval, 1, 4);
INSERT INTO NEWS_LIKE values(seq_news_like_idx.nextval, 2, 1);
INSERT INTO NEWS_LIKE values(seq_news_like_idx.nextval, 2, 2);

-- 뉴스 좋아요 전체 조회
-- SELECT * FROM NEWS_LIKE;


-- Subscribe
CREATE TABLE SUBSCRIBE (
                           subscribe_idx NUMBER PRIMARY KEY,
                           mem_idx NUMBER NOT NULL ,
                           reporter_idx NUMBER NOT NULL ,
                           CONSTRAINT fk_subscribe_member_idx FOREIGN KEY (mem_idx)
                               REFERENCES MEMBER (mem_idx) ON DELETE CASCADE,
                           CONSTRAINT fk_subscribe_reporter_idx FOREIGN KEY (reporter_idx)
                               REFERENCES MEMBER (mem_idx) ON DELETE CASCADE
);


------ 윤새힘's 테이블  --------

-- REPLY
CREATE TABLE REPLY (
                       rpy_idx      NUMBER PRIMARY KEY ,					-- 댓글 고유값
                       rpy_content  varchar2(2000) not null,				-- 댓글 내용
                       rpy_regdate  date default sysdate not null,			-- 댓글 등록일
                       rpy_modify	date default sysdate not null,			-- 댓글 수정일
                       mem_idx		NUMBER NOT NULL ,						-- 참조 회원 고유값
                       news_idx		number not null,						-- 참조 뉴스 고유값
                       constraint fk_reply_member_idx foreign key(mem_idx)
                           references member(mem_idx) on delete CASCADE ,
                       constraint fk_reply_news_idx foreign key(news_idx)
                           references news(news_idx) on delete cascade
);


------ 최범준's 테이블  --------

-- report 테이블
CREATE TABLE REPORT (
                        rep_idx				NUMBER PRIMARY KEY ,  										-- 신고 고유값
                        rep_reporter_idx 	NUMBER ,														-- 신고한 회원 고유값
                        rep_type 			varchar2(10) not null check (rep_type IN ('뉴스', '회원', '댓글')) ,	-- 신고 유형
                        news_idx 			NUMBER ,														-- 참조 뉴스 고유값
                        mem_idx 			NUMBER ,														-- 참조 회원 고유값
                        rpy_idx				NUMBER ,														-- 참조 댓글 고유값
                        constraint fk_report_news_idx foreign key (news_idx)
                            references NEWS (news_idx) on delete CASCADE,
                        constraint fk_report_member_idx foreign key (mem_idx)
                            references MEMBER (mem_idx) on delete CASCADE,
                        constraint fk_report_reply_idx foreign key (rpy_idx)
                            references REPLY (rpy_idx) on delete CASCADE
);

-- select * from report;


 -- 신고 한방 조회
--  select * from (
--  select distinct rr.*
--  from (select  r.rep_type, r.mem_idx as idx,
-- (select count( * ) from report where mem_idx = r.mem_idx ) as count
--   from report r
--   where r.mem_idx is not null) rr
--    union
--   select distinct rr.*
--  from (select  r.rep_type, r.news_idx as idx,
-- (select count( * ) from report where news_idx = r.news_idx ) as count
--   from report r
--   where r.news_idx is not null) rr
--    union
--     select distinct rr.*
--  from (select  r.rep_type, r.rpy_idx as idx,
-- (select count( * ) from report where news_idx = r.rpy_idx ) as count
--   from report r
--   where r.rpy_idx is not null) rr )
--  order by count desc;
--


-- 더미 데이터 라인 --

-- 댓글 더미 데이터
insert into REPLY values(seq_reply_idx.nextval,'댓글1',default,default,5,4);

-- 신고 더미 데이터
-- select * from report;

insert into report values(seq_report_idx.nextval, 1, '회원',null,4,null);
insert into report values(seq_report_idx.nextval, 1, '뉴스',1,null,null);
insert into report values(seq_report_idx.nextval, 2, '댓글',null,null,1);
insert into report values(seq_report_idx.nextval, 1, '회원',null,2,null);
insert into report values(seq_report_idx.nextval, 1, '회원',null,5,null);
insert into report values(seq_report_idx.nextval, 2, '회원',null,5,null);

COMMIT;





