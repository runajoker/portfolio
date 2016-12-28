
/* Drop Tables */

DROP TABLE t_comment CASCADE CONSTRAINTS;
DROP TABLE t_article CASCADE CONSTRAINTS;
DROP TABLE t_board CASCADE CONSTRAINTS;
DROP TABLE t_m CASCADE CONSTRAINTS;
DROP TABLE t_matching CASCADE CONSTRAINTS;
DROP TABLE t_message CASCADE CONSTRAINTS;
DROP TABLE t_member CASCADE CONSTRAINTS;
DROP TABLE t_team CASCADE CONSTRAINTS;

select * from t_member
select * from T_TEAM
select * from t_matching where mat_no=4
delete from t_matching where mat_no=4
/* Drop Sequences */

DROP SEQUENCE seq_article;
DROP SEQUENCE seq_board;
DROP SEQUENCE seq_comment;
DROP SEQUENCE seq_matching;
DROP SEQUENCE seq_member;
DROP SEQUENCE seq_message;
DROP SEQUENCE seq_team;




/* Create Sequences */

CREATE SEQUENCE seq_article;
CREATE SEQUENCE seq_board;
CREATE SEQUENCE seq_comment;
CREATE SEQUENCE seq_matching;
CREATE SEQUENCE seq_member;
CREATE SEQUENCE seq_message;
CREATE SEQUENCE seq_team;



/* Create Tables */

CREATE TABLE t_article
(
	art_no number NOT NULL,
	art_title varchar2(200) NOT NULL,
	art_content varchar2(4000) NOT NULL,
	art_regdate date DEFAULT sysdate NOT NULL,
	art_readcount number DEFAULT 0 NOT NULL,
	art_com_cnt number DEFAULT 0 NOT NULL,
	m_no number NOT NULL,
	b_no number NOT NULL,
	PRIMARY KEY (art_no)
);


CREATE TABLE t_board
(
	b_no number NOT NULL,
	b_name varchar2(30) NOT NULL,
	b_status number(1) DEFAULT 1 NOT NULL,
	m_no number NOT NULL,
	PRIMARY KEY (b_no)
);


CREATE TABLE t_comment
(
	com_no number NOT NULL,
	com_comment varchar2(1000) NOT NULL,
	com_regdate date DEFAULT sysdate NOT NULL,
	m_no number NOT NULL,
	art_no number NOT NULL,
	PRIMARY KEY (com_no)
);


CREATE TABLE t_m
(
	t_no number DEFAULT 1 NOT NULL,
	mat_no number DEFAULT 1 NOT NULL
);


CREATE TABLE t_matching
(
	mat_no number DEFAULT 1 NOT NULL,
	mat_time date NOT NULL,
	mat_place varchar2(500) NOT NULL,
	mat_home number DEFAULT 1,
	mat_home_name varchar2(30) NOT NULL,
	mat_away number DEFAULT 1,
	mat_away_name varchar2(30) NOT NULL,
	mat_play_time number DEFAULT 0 NOT NULL,
	mat_memo varchar2(500) NOT NULL,
	PRIMARY KEY (mat_no)
);


CREATE TABLE t_member
(
	m_no number NOT NULL,
	m_pw varchar2(128),
	m_id varchar2(20) NOT NULL UNIQUE,
	m_name varchar2(20) NOT NULL,
	m_admin number(1) DEFAULT 1 NOT NULL,
	m_phone varchar2(13),
	m_position varchar2(10) NOT NULL,
	m_score number DEFAULT 0 NOT NULL,
	t_no number DEFAULT 1 NOT NULL,
	PRIMARY KEY (m_no)
);


CREATE TABLE t_message
(
	g_no number NOT NULL,
	g_send_no number NOT NULL,
	g_content varchar2(1000) NOT NULL,
	g_check number(1) NOT NULL,
	g_readdate date,
	g_delete varchar2(1) DEFAULT '1' NOT NULL,
	g_regdate date DEFAULT sysdate NOT NULL,
	m_no number NOT NULL,
	PRIMARY KEY (g_no)
);


CREATE TABLE t_team
(
	t_no number DEFAULT 1 NOT NULL,
	t_name varchar2(30) NOT NULL,
	t_captain varchar2(30) NOT NULL,
	t_place varchar2(30) NOT NULL,
	t_intro varchar2(1000) NOT NULL,
	t_record_win number DEFAULT 0 NOT NULL,
	t_record_draw number DEFAULT 0 NOT NULL,
	t_record_lose number DEFAULT 0 NOT NULL,
	t_captain_no number DEFAULT 0 NOT NULL,
	PRIMARY KEY (t_no)
);



/* Create Foreign Keys */

ALTER TABLE t_comment
	ADD FOREIGN KEY (art_no)
	REFERENCES t_article (art_no)
;


ALTER TABLE t_article
	ADD FOREIGN KEY (b_no)
	REFERENCES t_board (b_no)
;


ALTER TABLE t_m
	ADD FOREIGN KEY (mat_no)
	REFERENCES t_matching (mat_no)
;


ALTER TABLE t_article
	ADD FOREIGN KEY (m_no)
	REFERENCES t_member (m_no)
;


ALTER TABLE t_board
	ADD FOREIGN KEY (m_no)
	REFERENCES t_member (m_no)
;


ALTER TABLE t_comment
	ADD FOREIGN KEY (m_no)
	REFERENCES t_member (m_no)
;


ALTER TABLE t_message
	ADD FOREIGN KEY (m_no)
	REFERENCES t_member (m_no)
;


ALTER TABLE t_m
	ADD FOREIGN KEY (t_no)
	REFERENCES t_team (t_no)
;


ALTER TABLE t_member
	ADD FOREIGN KEY (t_no)
	REFERENCES t_team (t_no)
;
select * from t_member
delete from t_team where t_no=1
insert into t_team(t_no, t_name, t_captain, t_captain_no, t_place, t_intro)
values(seq_team.nextval, '팀 없음', '팀 없음', 0,'팀이 없는 상태입니다.', '팀이 없는 상태입니다.');

insert into t_matching(mat_no, mat_time, mat_place, mat_home, mat_away, mat_home_name, mat_away_name, mat_memo)
values(seq_matching.nextval, '0001-01-01', '매칭 없음', 1, 1, '홈 팀 없음', '어웨이 팀 없음', '매칭이 없는 상태');

insert into t_m(t_no, mat_no)
values(1, 1);

select * from t_matching

insert into t_team(t_no, t_name, t_captain, t_captain_no, t_place, t_intro)
values(2, 'a', 'a', 1,'a', 'a');
select * from t_m
where mat_no=30
select * from T_MATCHING
select * from t_team
delete from t_matching where mat_no>1
select * from t_member
select mat_no, to_char(mat_time, 'YYYY-MM-DD HH24:MI') as mat_time, mat_home_name, mat_away_name, mat_memo, mat_play_time, mat_place
from t_matching
order by mat_no desc

select * from t_comment
insert into t_m(t_no, mat_no)

values(1, 1);
select mat_no
		from t_matching
		where mat_home=5
		delete from T_MEMBER where m_no=7
select *
from t_member;
select mat_no
		from t_matching
		where mat_home=#{t_no}
      insert into t_team(t_no, t_name, t_captain, t_captain_no, t_place, t_intro)
      values(seq_team.nextval, 'test', 'test', 2, 'test', 'test')
      
      select * from t_team
      delete from t_team where t_no=3
insert into t_matching(mat_no, mat_time, mat_place, mat_home, mat_away, mat_home_name, mat_away_name, mat_memo, mat_play_time)
values(seq_matching.nextval, '2016-12-16', 'test', 2, 1, 'test', '어웨이 팀 없음', 'test', 120)

insert into t_board(b_no, b_name, b_status, m_no)
values(seq_board.nextval, '모집게시판', 1, 1);
select * from t_board
select * from t_board;
delete from t_member where m_no=7
insert into t_article(art_no, art_title, art_content, art_regdate, b_no, m_no)
values(seq_article.nextval, 'TEST', 'TEST', '2016-12-19', 1, 1)

begin
for i in 1..123 loop
insert into t_article(art_no, art_title, art_content, art_regdate, b_no, m_no)
values(seq_article.nextval, 'TEST', 'TEST', '2016-12-19', 1, 1)
end loop;
end;
select * from t_member
delete from t_member
where m_no=22
select * from t_member
where t_no=6
select * from t_member
select * from t_matching
insert into t_message(g_no,   g_send_no, g_content, g_check, m_no)
values (seq_message.nextval, 2 , 'GD에게', '1', 1);

insert into t_message(g_no,   g_send_no, g_content, g_check, m_no)
values (seq_message.nextval, 1 , 'GD에게', '0', 2);