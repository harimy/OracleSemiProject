SELECT USER
FROM DUAL;
--==>> PMJ


-- ■■■ TBL_ADMIN 관리자 테이블 생성 ■■■ --

CREATE TABLE TBL_ADMIN
( A_CODE        VARCHAR2(6)
, A_NAME        VARCHAR2(10)    CONSTRAINT ADMIN_A_NAME_NN NOT NULL
, A_ID          VARCHAR2(11)    CONSTRAINT ADMIN_A_ID_NN NOT NULL
, A_PW          VARCHAR2(20)    CONSTRAINT ADMIN_A_PW_NN NOT NULL
, A_REG_DATE    DATE            DEFAULT SYSDATE
, CONSTRAINT ADMIN_A_CODE_PK PRIMARY KEY(A_CODE)
, CONSTRAINT ADMIN_A_ID_UK UNIQUE(A_ID)
);
--==>> Table TBL_ADMIN이(가) 생성되었습니다.

/*
INSERT INTO TBL_ADMIN(A_CODE, A_NAME, A_ID, A_PW)
VALUES('A00001', '관리자1', 'admin1', 'admin1234');
INSERT INTO TBL_ADMIN(A_CODE, A_NAME, A_ID, A_PW)
VALUES('A00002', '관리자2', 'admin2', 'admin5678');
*/


-- ■■■ TBL_STUDENT 학생 테이블 생성 ■■■ --

CREATE TABLE TBL_STUDENT
( S_CODE        VARCHAR2(6)
, S_NAME        VARCHAR2(10)    CONSTRAINT STUDENT_S_NAME_NN NOT NULL
, S_SSN         CHAR(14)        CONSTRAINT STUDENT_S_SSN_NN NOT NULL
, S_ID          VARCHAR2(11)    CONSTRAINT STUDENT_S_ID_NN NOT NULL
, S_PW          VARCHAR2(20)    CONSTRAINT STUDENT_S_PW_NN NOT NULL
, S_REG_DATE    DATE            DEFAULT SYSDATE
, CONSTRAINT STUDENT_S_CODE_PK PRIMARY KEY(S_CODE)
, CONSTRAINT STUDENT_S_ID_UK UNIQUE(S_ID)
, CONSTRAINT STUDENT_S_SSN_UK UNIQUE(S_SSN)
);
--==>> Table TBL_STUDENT이(가) 생성되었습니다.

/*
INSERT INTO TBL_STUDENT(S_CODE, S_NAME, S_SSN, S_ID, S_PW)
VALUES('S00001', '박민지', '960907-2012345', '01039315569', '2012345');
INSERT INTO TBL_STUDENT(S_CODE, S_NAME, S_SSN, S_ID, S_PW)
VALUES('S00002', '심혜진', '940708-2012346', '01071019504', '2012346');
INSERT INTO TBL_STUDENT(S_CODE, S_NAME, S_SSN, S_ID, S_PW)
VALUES('S00003', '이하림', '971022-2012347', '01040331022', '2012347');
INSERT INTO TBL_STUDENT(S_CODE, S_NAME, S_SSN, S_ID, S_PW)
VALUES('S00004', '이희주', '950107-2012348', '01082695439', '2012348');
INSERT INTO TBL_STUDENT(S_CODE, S_NAME, S_SSN, S_ID, S_PW)
VALUES('S00005', '전혜림', '950630-2012349', '01080019506', '2012349');
*/

-- ■■■ TBL_PROFESSOR 교수 테이블 생성 ■■■ --

CREATE TABLE TBL_PROFESSOR
( P_CODE        VARCHAR2(6)
, P_NAME        VARCHAR2(10)    CONSTRAINT PROFESSOR_P_NAME_NN NOT NULL
, P_SSN         CHAR(14)        CONSTRAINT PROFESSOR_P_SSN_NN NOT NULL
, P_ID          VARCHAR2(11)    CONSTRAINT PROFESSOR_P_ID_NN NOT NULL
, P_PW          VARCHAR2(20)    CONSTRAINT PROFESSOR_P_PW_NN NOT NULL
, P_REG_DATE    DATE            DEFAULT SYSDATE
, CONSTRAINT PROFESSOR_P_CODE_PK PRIMARY KEY(P_CODE)
, CONSTRAINT PROFESSOR_P_ID_UK UNIQUE(P_ID)
, CONSTRAINT PROFESSOR_P_SSN_UK UNIQUE(P_SSN)
);
--==>> Table TBL_PROFESSOR이(가) 생성되었습니다.
/*
INSERT INTO TBL_PROFESSOR(P_CODE, P_NAME, P_SSN, P_ID, P_PW)
VALUES('P00001', '김호진', '-1123456', '01048484114', '1123456');
*/


-- ■■■ TBL_BOOK 교재 테이블 생성 ■■■ --

CREATE TABLE TBL_BOOK 
( B_CODE     VARCHAR2(4)        
, B_NAME     VARCHAR2(60)       CONSTRAINT BOOK_B_NAME_NN NOT NULL 
, CONSTRAINT BOOK_B_CODE_PK PRIMARY KEY(B_CODE)
, CONSTRAINT BOOK_B_NAME_UK UNIQUE(B_NAME)
);
--==>> Table TBL_BOOK이(가) 생성되었습니다.

-- ■■■ TBL_SUBJECT 과목 테이블 생성 ■■■ --

CREATE TABLE TBL_SUBJECT 
( SJ_CODE    VARCHAR2(4)
, SJ_NAME    VARCHAR2(60)        CONSTRAINT SUBJECT_NAME_NN NOT NULL
, CONSTRAINT SUBJECT_CODE_PK PRIMARY KEY(SJ_CODE)
, CONSTRAINT SUBJECT_NAME_UK UNIQUE(SJ_NAME)
);
--==>> Table TBL_SUBJECT이(가) 생성되었습니다.


-- ■■■ TBL_COURSE 과정 테이블 생성 ■■■ --

CREATE TABLE TBL_COURSE
( C_CODE         VARCHAR2(4)
, C_NAME         VARCHAR2(60)   CONSTRAINT COURSE_NAME_NN NOT NULL
, CONSTRAINT COURSE_CODE_PK PRIMARY KEY(C_CODE)
, CONSTRAINT COURSE_NAME_UK UNIQUE(C_NAME)
);
--==>> Table TBL_COURSE이(가) 생성되었습니다.


-- ■■■ TBL_ROOM 강의실 테이블 생성 ■■■ --

CREATE TABLE TBL_ROOM
( R_CODE    VARCHAR2(4)
, R_NAME    VARCHAR2(30)    CONSTRAINT ROOM_R_NAME_NN NOT NULL
, R_EXPLAIN   VARCHAR2(60)
, CONSTRAINT ROOM_R_CODE_PK PRIMARY KEY(R_CODE)
, CONSTRAINT ROOM_R_NAME_UK UNIQUE(R_NAME)
);
--==>> Table TBL_ROOM이(가) 생성되었습니다.

/*
INSERT INTO TBL_ROOM(R_CODE, R_NAME, EXPLAIN)
VALUES('R001', 'A강의실', '2층');
INSERT INTO TBL_ROOM(R_CODE, R_NAME, C_CODE, EXPLAIN)
VALUES('R002', 'B강의실', '2층');
INSERT INTO TBL_ROOM(R_CODE, R_NAME, C_CODE, EXPLAIN)
VALUES('R003', 'F강의실', '4층');
*/



-- ■■■ TBL_ALLOT 배점 테이블 생성 ■■■ --

CREATE TABLE TBL_ALLOT
(AL_CODE NUMBER(4) 
,A_ALLOT NUMBER(3) CONSTRAINT ALLOT_A_ALLOT_NN NOT NULL 
,W_ALLOT NUMBER(3) CONSTRAINT ALLOT_W_ALLOT_NN NOT NULL 
,P_ALLOT NUMBER(3) CONSTRAINT ALLOT_P_ALLOT_NN NOT NULL 
,CONSTRAINT ALLOT_AL_CODE_PK PRIMARY KEY(AL_CODE)
);
--==>> Table TBL_ALLOT이(가) 생성되었습니다.


CREATE SEQUENCE SEQ_ALLOT
START WITH 1001
INCREMENT BY 1
MINVALUE 1001
MAXVALUE 9999
NOCACHE;
--==>> Sequence SEQ_ALLOT이(가) 생성되었습니다.



-- ■■■ TBL_OP_COURSE 과정개설 테이블 생성 ■■■ --

CREATE TABLE TBL_OP_COURSE
(OPC_CODE       NUMBER(4)
,C_CODE         VARCHAR2(4) CONSTRAINT OP_COURSE_C_CODE_NN NOT NULL
,R_CODE         VARCHAR2(4) CONSTRAINT OP_COURSE_R_CODE_NN NOT NULL
,START_DATE     DATE
,END_DATE       DATE
,CONSTRAINT OP_COURSE_OPC_CODE_PK PRIMARY KEY(OPC_CODE)
,CONSTRAINT OP_COURSE_C_CODE_FK FOREIGN KEY(C_CODE)
            REFERENCES TBL_COURSE(C_CODE)
,CONSTRAINT OP_COURSE_R_CODE_FK FOREIGN KEY(R_CODE)
            REFERENCES TBL_ROOM(R_CODE)
,CONSTRAINT OP_COURSE_DATE_CK CHECK(START_DATE < END_DATE)
);
--==>> Table TBL_OP_COURSE이(가) 생성되었습니다.

CREATE SEQUENCE SEQ_OP_COURSE
START WITH 1001
INCREMENT BY 1
MINVALUE 1001
MAXVALUE 9999
NOCACHE;
--==>> Sequence SEQ_OP_COURSE이(가) 생성되었습니다.


-- ■■■ TBL_OP_SUBJECT 과목개설 테이블 생성 ■■■ --

CREATE TABLE TBL_OP_SUBJECT
(OPS_CODE NUMBER(4)     
,SJ_CODE  VARCHAR2(4)   CONSTRAINT OP_SUBJECT_SJ_CODE_NN NOT NULL  
,OPC_CODE NUMBER(4)     CONSTRAINT OP_SUBJECT_OPC_CODE_NN NOT NULL
,P_CODE VARCHAR2(6)     CONSTRAINT OP_SUBJECT_P_CODE_NN NOT NULL
,B_CODE VARCHAR2(4)     CONSTRAINT OP_SUBJECT_B_CODE_NN NOT NULL
,AL_CODE NUMBER(4)      CONSTRAINT OP_SUBJECT_AL_CODE_NN NOT NULL
,START_DATE DATE        CONSTRAINT OP_SUBJECT_START_DATE_NN NOT NULL
,END_DATE DATE          CONSTRAINT OP_SUBJECT_END_DATE_NN NOT NULL 
, CONSTRAINT OP_SUBJECT_OPS_CODE_PK PRIMARY KEY(OPS_CODE)
, CONSTRAINT  OP_SUBJECT_SJ_CODE_FK FOREIGN KEY(SJ_CODE)
                        REFERENCES TBL_SUBJECT(SJ_CODE)
, CONSTRAINT  OP_SUBJECT_OPC_CODE_FK FOREIGN KEY(OPC_CODE)
                        REFERENCES TBL_OP_COURSE(OPC_CODE)
, CONSTRAINT  OP_SUBJECT_P_CODE_FK FOREIGN KEY(P_CODE)
                        REFERENCES TBL_PROFESSOR(P_CODE)
, CONSTRAINT  OP_SUBJECT_B_CODE_FK FOREIGN KEY(B_CODE)
                        REFERENCES TBL_BOOK(B_CODE)
, CONSTRAINT  OP_SUBJECT_AL_CODE_FK FOREIGN KEY(AL_CODE)
                        REFERENCES TBL_ALLOT(AL_CODE)
, CONSTRAINT OP_SUBJECT_END_DATE_CK CHECK(START_DATE<END_DATE)
);
--==>> Table TBL_OP_SUBJECT이(가) 생성되었습니다.

CREATE SEQUENCE SEQ_OPS_CODE
START WITH 1001
INCREMENT BY 1
MINVALUE 1001
MAXVALUE 9999
NOCACHE;
--==>> Sequence SEQ_OPS_CODE이(가) 생성되었습니다.


-- ■■■ TBL_SUGANG 수강신청 테이블 생성 ■■■ --


CREATE TABLE TBL_SUGANG
( SG_CODE    NUMBER(4)    
, S_CODE     VARCHAR2(6)  CONSTRAINT SUGANG_S_CODE_NN NOT NULL
, OPC_CODE   NUMBER(4)    CONSTRAINT SUGANG_OPC_CODE_NN NOT NULL
, SG_DATE    DATE         DEFAULT SYSDATE
, CONSTRAINT SUGANG_SG_CODE_PK PRIMARY KEY(SG_CODE) 
, CONSTRAINT SUGANG_S_CODE_FK FOREIGN KEY(S_CODE)
             REFERENCES TBL_STUDENT(S_CODE)            
, CONSTRAINT SUGANG_OPC_CODE_FK FOREIGN KEY(OPC_CODE)
             REFERENCES TBL_OP_COURSE(OPC_CODE)                            
);
--==>> Table TBL_SUGANG이(가) 생성되었습니다.

CREATE SEQUENCE SEQ_SUGANG
START WITH 1001
INCREMENT BY 1
MINVALUE 1001
MAXVALUE 9999
NOCACHE;
--==>> Sequence SEQ_SUGANG이(가) 생성되었습니다.


-- ■■■ TBL_DROP 중도탈락 테이블 생성 ■■■ --

CREATE TABLE TBL_DROP
( D_CODE    NUMBER(4)
, SG_CODE   NUMBER(4)   CONSTRAINT DROP_SG_CODE_NN NOT NULL 
, REASON    VARCHAR2(60)
, DR_DATE   DATE        DEFAULT SYSDATE
, CONSTRAINT DROP_D_CODE_PK PRIMARY KEY(D_CODE)
, CONSTRAINT DROP_SG_CODE_FK FOREIGN KEY(SG_CODE)
             REFERENCES TBL_SUGANG(SG_CODE)
);
--==>> Table TBL_DROP이(가) 생성되었습니다.

CREATE SEQUENCE SEQ_DROP
START WITH 1001
INCREMENT BY 1
MINVALUE 1001
MAXVALUE 9999
NOCACHE;
--==>> Sequence SEQ_DROP이(가) 생성되었습니다.

-- ■■■ TBL_SCORE 성적 테이블 생성 ■■■ --

CREATE TABLE TBL_SCORE
( SC_CODE   NUMBER(4)
, SG_CODE   NUMBER(4)   CONSTRAINT SCORE_SG_CODE_NN NOT NULL
, OPS_CODE  NUMBER(4)   CONSTRAINT SCORE_OPS_CODE_NN NOT NULL
, A_SCORE   NUMBER(3)
, W_SCORE   NUMBER(3)
, P_SCORE   NUMBER(3)
, CONSTRAINT SCORE_SC_CODE_PK PRIMARY KEY(SC_CODE)
, CONSTRAINT SCORE_SG_CODE_FK FOREIGN KEY(SG_CODE)
             REFERENCES TBL_SUGANG(SG_CODE)
, CONSTRAINT SCORE_OPS_CODE_FK FOREIGN KEY(OPS_CODE)
             REFERENCES TBL_OP_SUBJECT(OPS_CODE)
);
--==>> Table TBL_SCORE이(가) 생성되었습니다.

CREATE SEQUENCE SEQ_SCORE
START WITH 1001
INCREMENT BY 1
MINVALUE 1001
MAXVALUE 9999
NOCACHE;
--==>> Sequence SEQ_SCORE이(가) 생성되었습니다.








------------------------- 테이블 구조 확인 -------------------------------------


DESC TBL_ADMIN;
/*
이름         널?       유형           
---------- -------- ------------ 
A_CODE     NOT NULL VARCHAR2(6)  
A_NAME     NOT NULL VARCHAR2(10) 
A_ID       NOT NULL VARCHAR2(11) 
A_PW       NOT NULL VARCHAR2(20) 
A_REG_DATE          DATE         
*/

DESC TBL_STUDENT;
/*
이름         널?       유형           
---------- -------- ------------ 
S_CODE     NOT NULL VARCHAR2(6)  
S_NAME     NOT NULL VARCHAR2(10) 
S_SSN      NOT NULL CHAR(14)     
S_ID       NOT NULL VARCHAR2(11) 
S_PW       NOT NULL VARCHAR2(20) 
S_REG_DATE          DATE       
*/

DESC TBL_PROFESSOR;
/*
이름         널?       유형           
---------- -------- ------------ 
P_CODE     NOT NULL VARCHAR2(6)  
P_NAME     NOT NULL VARCHAR2(10) 
P_SSN      NOT NULL CHAR(14)     
P_ID       NOT NULL VARCHAR2(11) 
P_PW       NOT NULL VARCHAR2(20) 
P_REG_DATE          DATE  
*/

DESC TBL_BOOK;
/*
이름     널?       유형           
------ -------- ------------ 
B_CODE NOT NULL VARCHAR2(4)  
B_NAME NOT NULL VARCHAR2(60)
*/

DESC TBL_SUBJECT;
/*
이름      널?       유형           
------- -------- ------------ 
SJ_CODE NOT NULL VARCHAR2(4)  
SJ_NAME NOT NULL VARCHAR2(60)
*/

DESC TBL_COURSE;
/*
이름     널?       유형           
------ -------- ------------ 
C_CODE NOT NULL VARCHAR2(4)  
C_NAME NOT NULL VARCHAR2(60)
*/

DESC TBL_ROOM;
/*
이름      널?       유형           
------- -------- ------------ 
R_CODE  NOT NULL VARCHAR2(4)  
R_NAME  NOT NULL VARCHAR2(30) 
R_EXPLAIN        VARCHAR2(60)
*/

DESC TBL_ALLOT;
/*
이름      널?       유형        
------- -------- --------- 
AL_CODE NOT NULL NUMBER(4) 
A_ALLOT NOT NULL NUMBER(3) 
W_ALLOT NOT NULL NUMBER(3) 
P_ALLOT NOT NULL NUMBER(3) 
*/

DESC TBL_OP_COURSE;
/*
이름         널?       유형          
---------- -------- ----------- 
OPC_CODE   NOT NULL NUMBER(4)   
C_CODE     NOT NULL VARCHAR2(4) 
R_CODE     NOT NULL VARCHAR2(4) 
START_DATE NOT NULL DATE        
END_DATE   NOT NULL DATE        
*/

DESC TBL_OP_SUBJECT;
/*
이름         널?       유형          
---------- -------- ----------- 
OPS_CODE   NOT NULL NUMBER(4)   
SJ_CODE    NOT NULL VARCHAR2(4) 
OPC_CODE   NOT NULL NUMBER(4)   
P_CODE     NOT NULL VARCHAR2(6) 
B_CODE     NOT NULL VARCHAR2(4) 
AL_CODE    NOT NULL NUMBER(4)   
START_DATE NOT NULL DATE        
END_DATE   NOT NULL DATE 
*/

DESC TBL_SUGANG;
/*
이름       널?       유형          
-------- -------- ----------- 
SG_CODE  NOT NULL NUMBER(4)   
S_CODE   NOT NULL VARCHAR2(6) 
OPC_CODE NOT NULL NUMBER(4)   
SG_DATE           DATE        
*/

DESC TBL_DROP;
/*
이름      널?       유형           
------- -------- ------------ 
D_CODE  NOT NULL NUMBER(4)    
SG_CODE NOT NULL NUMBER(4)    
REASON           VARCHAR2(60) 
DR_DATE          DATE         
*/

DESC TBL_SCORE;
/*
이름       널?       유형        
-------- -------- --------- 
SC_CODE  NOT NULL NUMBER(4) 
SG_CODE  NOT NULL NUMBER(4) 
OPS_CODE NOT NULL NUMBER(4) 
A_SCORE           NUMBER(3) 
W_SCORE           NUMBER(3) 
P_SCORE           NUMBER(3)
*/


------------------------제약조건 확인-------------------------------------------

--※ 제약조건 확인 전용 뷰(VIEW) 생성
CREATE OR REPLACE VIEW VIEW_SG_CONSTCHECK
AS
SELECT UC.OWNER "OWNER"
     , UC.CONSTRAINT_NAME "CONSTRAINT_NAME"
     , UC.TABLE_NAME "TABLE_NAME"
     , UC.CONSTRAINT_TYPE "CONSTRAINT_TYPE"
     , UCC.COLUMN_NAME "COLUMN_NAME"
     , UC.SEARCH_CONDITION "SEARCH_CONDITION"
     , UC.DELETE_RULE "DELETE_RULE"
FROM USER_CONSTRAINTS UC JOIN USER_CONS_COLUMNS UCC
ON UC.CONSTRAINT_NAME = UCC.CONSTRAINT_NAME;
--==>> View VIEW_SG_CONSTCHECK이(가) 생성되었습니다.

SELECT *
FROM VIEW_SG_CONSTCHECK
WHERE TABLE_NAME = 'TBL_ADMIN';
--==>>
/*
HR	ADMIN_A_NAME_NN	TBL_ADMIN	C	A_NAME	"A_NAME" IS NOT NULL	
HR	ADMIN_A_ID_NN	TBL_ADMIN	C	A_ID	"A_ID" IS NOT NULL	
HR	ADMIN_A_PW_NN	TBL_ADMIN	C	A_PW	"A_PW" IS NOT NULL	
HR	ADMIN_A_CODE_PK	TBL_ADMIN	P	A_CODE		
HR	ADMIN_A_ID_UK	TBL_ADMIN	U	A_ID		
*/

SELECT *
FROM VIEW_SG_CONSTCHECK
WHERE TABLE_NAME = 'TBL_STUDENT';
--==>>
/*
HR	STUDENT_S_NAME_NN	TBL_STUDENT	C	S_NAME	"S_NAME" IS NOT NULL	
HR	STUDENT_S_SSN_NN	TBL_STUDENT	C	S_SSN	"S_SSN" IS NOT NULL	
HR	STUDENT_S_ID_NN	    TBL_STUDENT C	S_ID	"S_ID" IS NOT NULL	
HR	STUDENT_S_PW_NN 	TBL_STUDENT C	S_PW	"S_PW" IS NOT NULL	
HR	STUDENT_S_CODE_PK	TBL_STUDENT	P	S_CODE		
HR	STUDENT_S_ID_UK	    TBL_STUDENT U	S_ID		
HR	STUDENT_S_SSN_UK	TBL_STUDENT	U	S_SSN		
*/

SELECT *
FROM VIEW_SG_CONSTCHECK
WHERE TABLE_NAME = 'TBL_PROFESSOR';
--==>>
/*
HR	PROFESSOR_P_NAME_NN	TBL_PROFESSOR	C	P_NAME	"P_NAME" IS NOT NULL	
HR	PROFESSOR_P_SSN_NN	TBL_PROFESSOR	C	P_SSN	"P_SSN" IS NOT NULL	
HR	PROFESSOR_P_ID_NN	TBL_PROFESSOR	C	P_ID	"P_ID" IS NOT NULL	
HR	PROFESSOR_P_PW_NN	TBL_PROFESSOR	C	P_PW	"P_PW" IS NOT NULL	
HR	PROFESSOR_P_CODE_PK	TBL_PROFESSOR	P	P_CODE		
HR	PROFESSOR_P_ID_UK	TBL_PROFESSOR	U	P_ID		
HR	PROFESSOR_P_SSN_UK	TBL_PROFESSOR	U	P_SSN		
*/

SELECT *
FROM VIEW_SG_CONSTCHECK
WHERE TABLE_NAME = 'TBL_BOOK';
--==>>
/*
HR	BOOK_B_NAME_NN	TBL_BOOK	C	B_NAME	"B_NAME" IS NOT NULL	
HR	BOOK_B_CODE_PK	TBL_BOOK	P	B_CODE		
HR	BOOK_B_NAME_UK	TBL_BOOK	U	B_NAME		
*/

SELECT *
FROM VIEW_SG_CONSTCHECK
WHERE TABLE_NAME = 'TBL_SUBJECT';
--==>>
/*
HR	SUBJECT_NAME_NN	TBL_SUBJECT	C	SJ_NAME	"SJ_NAME" IS NOT NULL	
HR	SUBJECT_CODE_PK	TBL_SUBJECT	P	SJ_CODE		
HR	SUBJECT_NAME_UK	TBL_SUBJECT	U	SJ_NAME		
*/

SELECT *
FROM VIEW_SG_CONSTCHECK
WHERE TABLE_NAME = 'TBL_COURSE';
--==>>
/*
HR	COURSE_NAME_NN	TBL_COURSE	C	C_NAME	"C_NAME" IS NOT NULL	
HR	COURSE_CODE_PK	TBL_COURSE	P	C_CODE		
HR	COURSE_NAME_UK	TBL_COURSE	U	C_NAME		
*/

SELECT *
FROM VIEW_SG_CONSTCHECK
WHERE TABLE_NAME = 'TBL_ROOM';
--==>>
/*
HR	ROOM_R_NAME_NN	TBL_ROOM	C	R_NAME	"R_NAME" IS NOT NULL	
HR	ROOM_R_CODE_PK	TBL_ROOM	P	R_CODE		
HR	ROOM_R_NAME_UK	TBL_ROOM	U	R_NAME		
*/

SELECT *
FROM VIEW_SG_CONSTCHECK
WHERE TABLE_NAME = 'TBL_ALLOT';
--==>>
/*
HR	ALLOT_A_ALLOT_NN	TBL_ALLOT	C	A_ALLOT	"A_ALLOT" IS NOT NULL	
HR	ALLOT_W_ALLOT_NN	TBL_ALLOT	C	W_ALLOT	"W_ALLOT" IS NOT NULL	
HR	ALLOT_P_ALLOT_NN	TBL_ALLOT	C	P_ALLOT	"P_ALLOT" IS NOT NULL	
HR	ALLOT_AL_CODE_PK	TBL_ALLOT	P	AL_CODE		
*/

SELECT *
FROM VIEW_SG_CONSTCHECK
WHERE TABLE_NAME = 'TBL_OP_COURSE';
--==>>
/*
HR	OP_COURSE_C_CODE_NN	TBL_OP_COURSE	C	C_CODE	"C_CODE" IS NOT NULL	
HR	OP_COURSE_R_CODE_NN	TBL_OP_COURSE	C	R_CODE	"R_CODE" IS NOT NULL	
HR	OP_COURSE_DATE_CK	TBL_OP_COURSE	C	START_DATE	START_DATE < END_DATE	
HR	OP_COURSE_DATE_CK	TBL_OP_COURSE	C	END_DATE	START_DATE < END_DATE	
HR	OP_COURSE_OPC_CODE_PKTBL_OP_COURSE	P	OPC_CODE		
HR	OP_COURSE_C_CODE_FK	TBL_OP_COURSE	R	C_CODE		NO ACTION
HR	OP_COURSE_R_CODE_FK	TBL_OP_COURSE	R	R_CODE		NO ACTION
*/

SELECT *
FROM VIEW_SG_CONSTCHECK
WHERE TABLE_NAME = 'TBL_OP_SUBJECT';
--==>>
/*
HR	OP_SUBJECT_SJ_CODE_NN	TBL_OP_SUBJECT	C	SJ_CODE	"SJ_CODE" IS NOT NULL	
HR	OP_SUBJECT_OPC_CODE_NN	TBL_OP_SUBJECT	C	OPC_CODE	"OPC_CODE" IS NOT NULL	
HR	OP_SUBJECT_P_CODE_NN	TBL_OP_SUBJECT	C	P_CODE	"P_CODE" IS NOT NULL	
HR	OP_SUBJECT_B_CODE_NN	TBL_OP_SUBJECT	C	B_CODE	"B_CODE" IS NOT NULL	
HR	OP_SUBJECT_AL_CODE_NN	TBL_OP_SUBJECT	C	AL_CODE	"AL_CODE" IS NOT NULL	
HR	OP_SUBJECT_START_DATE_NNTBL_OP_SUBJECT	C	START_DATE	"START_DATE" IS NOT NULL	
HR	OP_SUBJECT_END_DATE_NN	TBL_OP_SUBJECT	C	END_DATE	"END_DATE" IS NOT NULL	
HR	OP_SUBJECT_END_DATE_CK	TBL_OP_SUBJECT	C	START_DATE	START_DATE<END_DATE	
HR	OP_SUBJECT_END_DATE_CK	TBL_OP_SUBJECT	C	END_DATE	START_DATE<END_DATE	
HR	OP_SUBJECT_OPS_CODE_PK	TBL_OP_SUBJECT	P	OPS_CODE		
HR	OP_SUBJECT_SJ_CODE_FK	TBL_OP_SUBJECT	R	SJ_CODE		NO ACTION
HR	OP_SUBJECT_OPC_CODE_FK	TBL_OP_SUBJECT	R	OPC_CODE		NO ACTION
HR	OP_SUBJECT_P_CODE_FK	TBL_OP_SUBJECT	R	P_CODE		NO ACTION
HR	OP_SUBJECT_B_CODE_FK	TBL_OP_SUBJECT	R	B_CODE		NO ACTION
HR	OP_SUBJECT_AL_CODE_FK	TBL_OP_SUBJECT	R	AL_CODE		NO ACTION
*/

SELECT *
FROM VIEW_SG_CONSTCHECK
WHERE TABLE_NAME = 'TBL_SUGANG';
--==>>
/*
HR	SUGANG_S_CODE_NN	TBL_SUGANG	C	S_CODE	    "S_CODE" IS NOT NULL	
HR	SUGANG_OPC_CODE_NN	TBL_SUGANG	C	OPC_CODE	"OPC_CODE" IS NOT NULL	
HR	SUGANG_SG_CODE_PK	TBL_SUGANG	P	SG_CODE		
HR	SUGANG_S_CODE_FK	TBL_SUGANG	R	S_CODE		NO ACTION
HR	SUGANG_OPC_CODE_FK	TBL_SUGANG	R	OPC_CODE	NO ACTION
*/

SELECT *
FROM VIEW_SG_CONSTCHECK
WHERE TABLE_NAME = 'TBL_DROP';
--==>>
/*
HR	DROP_SG_CODE_NN	TBL_DROP	C	SG_CODE	"SG_CODE" IS NOT NULL	
HR	DROP_D_CODE_PK	TBL_DROP	P	D_CODE		
HR	DROP_SG_CODE_FK	TBL_DROP	R	SG_CODE		NO ACTION
*/

SELECT *
FROM VIEW_SG_CONSTCHECK
WHERE TABLE_NAME = 'TBL_SCORE';
--==>>
/*
HR	SCORE_SG_CODE_NN	TBL_SCORE	C	SG_CODE	    "SG_CODE" IS NOT NULL	
HR	SCORE_OPS_CODE_NN	TBL_SCORE	C	OPS_CODE	"OPS_CODE" IS NOT NULL	
HR	SCORE_SC_CODE_PK	TBL_SCORE	P	SC_CODE		
HR	SCORE_SG_CODE_FK	TBL_SCORE	R	SG_CODE		NO ACTION
HR	SCORE_OPS_CODE_FK	TBL_SCORE	R	OPS_CODE	NO ACTION
*/



--------------------- 시퀀스 확인 ----------------------------------------------

SELECT *
FROM USER_SEQUENCES;
--==>>
/*
SEQ_ALLOT   	1001	9999	1	N	N	0	1001
SEQ_DROP	    1001	9999	1	N	N	0	1001
SEQ_OPS_CODE	1001	9999	1	N	N	0	1001
SEQ_OP_COURSE	1001	9999	1	N	N	0	1001
SEQ_SCORE	    1001	9999	1	N	N	0	1001
SEQ_SUGANG	    1001	9999	1	N	N	0	1001
*/


---------------------------


DROP SEQUENCE SEQ_ALLOT;
DROP SEQUENCE SEQ_DROP;
DROP SEQUENCE SEQ_OPS_CODE;
DROP SEQUENCE SEQ_OP_COURSE;
DROP SEQUENCE SEQ_SCORE;
DROP SEQUENCE SEQ_SUGANG;


DROP TABLE TBL_SCORE;

DROP TABLE TBL_DROP;

DROP TABLE TBL_SUGANG;

DROP TABLE TBL_OP_SUBJECT;

DROP TABLE TBL_OP_COURSE;

DROP TABLE TBL_SUBJECT;

DROP TABLE TBL_COURSE;

DROP TABLE TBL_ROOM;

DROP TABLE TBL_STUDENT;

DROP TABLE TBL_ALLOT;

DROP TABLE TBL_ADMIN;

DROP TABLE TBL_PROFESSOR;

DROP TABLE TBL_ROOM;