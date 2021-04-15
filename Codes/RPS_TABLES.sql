SELECT USER
FROM DUAL;



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

DESC TBL_ADMIN;

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

DESC TBL_STUDENT;


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

DESC TBL_PROFESSOR;

-- ■■■ TBL_BOOK 교재 테이블 생성 ■■■ --
/*

- B_CODE 교재코드 (PK): VARCHAR2(4) B001
- B_NAME 교재명: VARCHAR2

→ UNIQUE: 교재명
→ NOT NULL: 교재명
*/
CREATE TABLE TBL_BOOK 
( B_CODE     VARCHAR2(4)        
, B_NAME     VARCHAR2(30) CONSTRAINT BOOK_B_NAME_NN NOT NULL 
, CONSTRAINT BOOK_B_CODE_PK PRIMARY KEY(B_CODE)
, CONSTRAINT BOOK_B_NAME_UK UNIQUE(B_NAME)
);
--==>> Table TBL_BOOK이(가) 생성되었습니다.

--■■■  TBL_BOOK 교재 값 입력■■■---
--INSERT INTO TBL_BOOK(B_CODE, B_NAME) VALUES('B001' , 'JAVA의정석');
--INSERT INTO TBL_BOOK(B_CODE, B_NAME) VALUES('B002' , '웹표준의정석');

--■■■  TBL_BOOK 교재 값 입력■■■---
--INSERT INTO TBL_SUGANG(SG_CODE, S_CODE, OPC_CODE, SG_DATE) VALUES();   
             
             
--==>>Table TBL_BOOK이(가) 생성되었습니다.

-- ■■■ TBL_SUBJECT 과목 테이블 생성 ■■■ --

CREATE TABLE TBL_SUBJECT 
( SJ_CODE    VARCHAR2(4)
, SJ_NAME    VARCHAR2(30)    CONSTRAINT SUBJECT_NAME_NN NOT NULL
, CONSTRAINT SUBJECT_CODE_PK PRIMARY KEY(SJ_CODE)
, CONSTRAINT SUBJECT_NAME_UK UNIQUE(SJ_NAME)
);
--==>> Table TBL_SUBJECT이(가) 생성되었습니다.


-- ■■■ TBL_COURSE 과정 테이블 생성 ■■■ --

CREATE TABLE TBL_COURSE
( C_CODE         VARCHAR2(4)
, C_NAME         VARCHAR2(30)    CONSTRAINT COURSE_NAME_NN NOT NULL
, CONSTRAINT COURSE_CODE_PK PRIMARY KEY(C_CODE)
, CONSTRAINT COURSE_NAME_UK UNIQUE(C_NAME)
);
--==>> Table TBL_COURSE이(가) 생성되었습니다.


-- ■■■ TBL_ROOM 강의실 테이블 생성 ■■■ --

CREATE TABLE TBL_ROOM
( R_CODE    VARCHAR2(4)
, R_NAME    VARCHAR2(30)    CONSTRAINT ROOM_R_NAME_NN NOT NULL
, EXPALIN   VARCHAR2(30)
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

SELECT * FROM TBL_ROOM;

DESC TBL_ROOM;

-- ■■■ TBL_ALLOT 배점 테이블 생성 ■■■ --

CREATE TABLE TBL_ALLOT
(AL_CODE NUMBER(4) 
,A_ALLOT NUMBER(3) CONSTRAINT ALLOT_A_ALLOT_NN NOT NULL 
,W_ALLOT NUMBER(3) CONSTRAINT ALLOT_W_ALLOT_NN NOT NULL 
,P_ALLOT NUMBER(3) CONSTRAINT ALLOT_P_ALLOT_NN NOT NULL 
,CONSTRAINT ALLOT_AL_CODE_PK PRIMARY KEY(AL_CODE)
);
--==>> Table TBL_ALLOT이(가) 생성되었습니다.


DESC TBL_ALLOT;

CREATE SEQUENCE SEQ_ALLOT
INCREMENT BY 1
START WITH 1001
MINVALUE 1
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
NOMAXVALUE
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
INCREMENT BY 1
START WITH 1001
MINVALUE 1
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
NOMAXVALUE
NOCACHE;
--==>> Sequence SEQ_SUGANG이(가) 생성되었습니다.


-- ■■■ TBL_DROP 중도탈락 테이블 생성 ■■■ --

CREATE TABLE TBL_DROP
( D_CODE    NUMBER(4)
, SG_CODE   NUMBER(4)   CONSTRAINT DROP_SG_CODE_NN NOT NULL 
, REASON    VARCHAR2(30)
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




