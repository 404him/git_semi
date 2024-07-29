/*

-- reply
create sequence  seq_reply_tb_idx

create table  reply_tb
(
   rpy_idx      int,									-- 일련번호
   rpy_no		number,									-- 댓글번호
   rpy_content  varchar2(2000) not null,				-- 내용
   rpy_regdate  date default sysdate not null,			-- 등록일자
   rpy_modify	date default sysdate not null,			-- 수정일자
   mem_id		varchar2(100) not null,					-- 회원아이디
   news_no		number not null,						-- 게시물번호	
)

-- 기본키
	alter table reply_tb
 			 add constraint pk_reply_tb_idx primary key(reply_idx);
	
--외래키
	alter table reply_tb
   			add constraint fk_reply_tb_member_id foreign key(mem_idx)
                                      references member(mem_idx) on delete cascade;
		
	alter table reply_tb
   			add constraint fk_reply_tb_news_no foreign key(news_no)
                                      references news(news_no) on delete cascade;

		
								
-- REPLY_LIKE
create sequence  seq_reply_likes_tb_idx

create table  reply_likes_tb
(
   rpy_likes_idx    int,									-- 일련번호
   rpy_likes_no		number,									-- 댓글번호
   mem_id			varchar2(100) not null,					-- 회원아이디
   news_no			number not null,						-- 게시물번호	
)

-- 기본키
	alter table reply_likes_tb
 			 add constraint pk_reply_likes_tb_idx primary key(reply_likes_idx);
	
--외래키
	alter table reply_likes_tb
   			add constraint fk_reply_likes_reply_no foreign key(reply_no)
                                     		 references reply(reply_no) on delete cascade;
		
	alter table reply_like_tb
   			add constraint fk_reply_likes_member_id foreign key(mem_idx)
                                 	     references member(mem_idx) on delete cascade;



-- reply_unlikes

create sequence  seq_reply_unlikes_tb_idx

create table  reply_unlikes_tb
(
   rpy_unlikes_no		number,										-- 댓글번호
   rpy_unlikes_idx   	int,										-- 일련번호
   mem_id				varchar2(100) not null,						-- 회원아이디
   news_no				number not null,							-- 게시물번호	
)

-- 기본키
	alter table reply_unlikes_tb
 			 add constraint pk_reply_likes_tb_idx primary key(reply_likes_idx);
	
--외래키
	alter table reply_unlikes_tb
   			add constraint fk_reply_likes_reply_no foreign key(reply_no)
                                     		 references reply(reply_no) on delete cascade;
		
	alter table reply_unlike_tb
   			add constraint fk_reply_likes_member_id foreign key(mem_idx)
                                 	     references member(mem_idx) on delete cascade;


);
										
	

*/