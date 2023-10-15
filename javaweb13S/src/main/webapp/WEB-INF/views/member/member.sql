create table member (
	idx int not null auto_increment,			/* 고유번호 */
	uid varchar(20) not null,					/* 아이디 */
	pwd varchar(100) not null,					/* 비밀번호 */
	email varchar(50) not null,					/* 이메일 */
	name varchar(20),							/* 이름 */
	nickName varchar(50),						/* 닉네임(uuid)처리 */
	tel varchar(15),							/* 핸드폰 */
	address varchar(100),						/* 주소 */
	level int default 2,						/* 회원등급 */
	point int default 0,						/* 포인트 */
	userDel char(2) default "NO",				/* 탈퇴신청 : OK , 반대 : NO */
	startDate datetime default now(),			/* 가입일 */
	lastDate datetime default now(),			/* 마지막 접속일 */
	primary key(idx),
	unique key(uid)
);

drop table member;