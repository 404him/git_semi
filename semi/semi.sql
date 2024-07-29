
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
DROP SEQUENCE seq_reply_like_idx;
DROP SEQUENCE seq_reply_unlike_idx;
DROP SEQUENCE seq_report_idx;

-- Drop Table Line --

DROP TABLE REPORT;
DROP TABLE REPLY_LIKE;
DROP TABLE REPLY_UNLIKE;
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
CREATE SEQUENCE seq_reply_like_idx;
CREATE SEQUENCE seq_reply_unlike_idx;
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
                        mem_use		  CHAR(1) DEFAULT 'y' NOT NULL CHECK(mem_use IN ('y','n')) , 	-- 계정 활성화 상태
                        mem_grade 	  CHAR(10) DEFAULT '일반' NOT NULL CHECK(mem_grade IN ('일반','기자','관리자')) , 	-- 회원 등급
                        mem_regdate   DATE DEFAULT SYSDATE   NOT NULL	-- 회원가입 날짜
);

-- 회원 더미 데이터

INSERT INTO MEMBER values(seq_member_idx.nextval,'user1','1111','회원1','회원일번','010-1111-1111',NULL,'우편번호1','주소1','1997-02-17',DEFAULT, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO MEMBER values(seq_member_idx.nextval,'reporter1','1111','기자1','기자일번','010-1111-1111',NULL,'우편번호1','주소1','1997-02-17',DEFAULT, DEFAULT, '기자', DEFAULT);
INSERT INTO MEMBER values(seq_member_idx.nextval,'admin1','1111','관리자1','관리자일번','010-1111-1111',NULL,'우편번호1','주소1','1997-02-17',DEFAULT, DEFAULT, '관리자', DEFAULT);
INSERT INTO MEMBER values(seq_member_idx.nextval,'user2','1111','회원2','회원이번','010-1111-1111',NULL,'우편번호1','주소1','1997-02-17',5, 'n', '일반', DEFAULT);
INSERT INTO MEMBER values(seq_member_idx.nextval,'user3','1111','회원3','회원삼번','010-1111-1111',NULL,'우편번호1','주소1','1997-02-17',5, 'n', '일반', DEFAULT);
INSERT INTO MEMBER values(seq_member_idx.nextval,'reporter2','2222','기자2','기자이번','010-2222-1111',NULL,'우편번호2','주소2','1997-02-22',DEFAULT, DEFAULT, '기자', DEFAULT);

SELECT * FROM MEMBER;

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

INSERT INTO news values(seq_news_idx.nextval, '제목1', 'https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/ea056883-3icons8-%EA%B0%9C%EB%B0%9C-64.png','내용1', 27, DEFAULT, NULL, 2, 1);
INSERT INTO news values(seq_news_idx.nextval, '제목2', 'https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/ac13f79e-7country-6.jpg', '내용2', 12, DEFAULT, NULL, 6, 1);
INSERT INTO news values(seq_news_idx.nextval, '제목3', 'https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/c7bc9f7f-cgrid-2.jpg', '내용3', 27, DEFAULT, NULL, 2, 1);
INSERT INTO news values(seq_news_idx.nextval, '제목4', 'https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/6aa8d207-5%EC%A3%BC%EC%95%99.png', '내용4', 5, DEFAULT, NULL, 2, 1);
INSERT INTO news values(seq_news_idx.nextval, '제목5', 'https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/ea056883-3icons8-%EA%B0%9C%EB%B0%9C-64.png', '내용5', 2, DEFAULT, NULL, 6, 1);
INSERT INTO news values(seq_news_idx.nextval, '제목6', 'https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/6aa8d207-5%EC%A3%BC%EC%95%99.png', '내용6', 27, DEFAULT, NULL, 6, 1);
INSERT INTO news values(seq_news_idx.nextval, '제목7', 'https://goss-s3-test-bucket.s3.ap-northeast-2.amazonaws.com/images/c7bc9f7f-cgrid-2.jpg', '내용7', 27, DEFAULT, NULL, 6, 2);


SELECT * FROM news;


-- n

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
                               REFERENCES MEMBER (mem_idx)
);

-- 뉴스 좋아요 더미 데이터

INSERT INTO NEWS_LIKE values(seq_news_like_idx.nextval, 1, 1);
INSERT INTO NEWS_LIKE values(seq_news_like_idx.nextval, 1, 3);
INSERT INTO NEWS_LIKE values(seq_news_like_idx.nextval, 1, 4);
INSERT INTO NEWS_LIKE values(seq_news_like_idx.nextval, 2, 1);
INSERT INTO NEWS_LIKE values(seq_news_like_idx.nextval, 2, 2);

-- 뉴스 좋아요 전체 조회
SELECT * FROM NEWS_LIKE;


-- Subscribe
CREATE TABLE SUBSCRIBE (
                           subscribe_idx NUMBER PRIMARY KEY,
                           mem_idx NUMBER NOT NULL ,
                           news_idx NUMBER NOT NULL ,
                           CONSTRAINT fk_subscribe_member_idx FOREIGN KEY (mem_idx)
                               REFERENCES MEMBER (mem_idx) ON DELETE CASCADE,
                           CONSTRAINT fk_subscribe_news_idx FOREIGN KEY (news_idx)
                               REFERENCES NEWS (news_idx) ON DELETE CASCADE
);


------ 윤새힘's 테이블  --------

-- REPLY
CREATE TABLE REPLY (
                       rpy_idx      NUMBER PRIMARY KEY ,						-- 댓글 고유값
                       rpy_content  varchar2(2000) not null,				-- 댓글 내용
                       rpy_regdate  date default sysdate not null,			-- 댓글 등록일
                       rpy_modify	date default sysdate not null,			-- 댓글 수정일
                       mem_idx		NUMBER NOT NULL ,							-- 참조 회원 고유값
                       news_idx		number not null,						-- 참조 뉴스 고유값
                       constraint fk_reply_member_idx foreign key(mem_idx)
                           references member(mem_idx) on delete CASCADE ,
                       constraint fk_reply_news_idx foreign key(news_idx)
                           references news(news_idx) on delete cascade
);


-- REPLY_LIKE
CREATE TABLE REPLY_LIKE (
                            rpy_like_idx    NUMBER PRIMARY KEY ,				-- 댓글 좋아요 고유값
                            rpy_idx			NUMBER NOT NULL ,					-- 참조 댓글 고유값
                            mem_idx			NUMBER NOT NULL ,					-- 참조 회원 고유값
                            constraint fk_reply_like_reply_idx foreign key(rpy_idx)
                                references reply(rpy_idx) on delete CASCADE ,
                            constraint fk_reply_like_member_idx foreign key(mem_idx)
                                references member(mem_idx) on delete cascade
);


-- reply_unlikes
CREATE TABLE REPLY_UNLIKE (
                              rpy_unlikes_idx   	NUMBER PRIMARY KEY ,						-- 댓글 싫어요 고유값
                              rpy_idx				NUMBER NOT NULL, 							-- 참조 댓글 고유값
                              mem_idx				NUMBER NOT NULL ,					-- 참조 회원 고유값
                              constraint fk_reply_unlike_reply_idx foreign KEY (rpy_idx)
                                  references REPLY (rpy_idx) on delete CASCADE,
                              constraint fk_reply_unlike_member_idx foreign KEY (mem_idx)
                                  references MEMBER (mem_idx) on delete cascade
);


------ 최범준's 테이블  --------

-- report 테이블
CREATE TABLE REPORT (
                        rep_idx				NUMBER PRIMARY KEY ,  										-- 신고 고유값
                        rep_reporter_idx 	NUMBER ,														-- 신고한 회원 고유값
                        rep_type 			char(10) not null check (rep_type IN ('뉴스', '회원', '댓글')) ,	-- 신고 유형
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


-- 더미 데이터 라인 --









COMMIT;













