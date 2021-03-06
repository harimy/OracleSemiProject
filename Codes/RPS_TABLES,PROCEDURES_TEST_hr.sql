

--○ TBL_ADMIN 데이터 입력 
INSERT INTO TBL_ADMIN(A_CODE, A_NAME, A_ID, A_PW)
VALUES('A00001', '관리자1', 'admin1', 'admin1234');
INSERT INTO TBL_ADMIN(A_CODE, A_NAME, A_ID, A_PW)
VALUES('A00002', '관리자2', 'admin2', 'admin5678');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_ADMIN;
--==>>
/*
A00001	관리자1	admin1	admin1234	21/04/16
A00002	관리자2	admin2	admin5678	21/04/16
*/


--○ TBL_STUDENT 데이터 입력 (프로시저 사용)
EXEC PRC_STUDENT_INSERT('박민지', '960907-2345678', '01039315569');
EXEC PRC_STUDENT_INSERT('심혜진', '940708-2345678', '01071019504');
EXEC PRC_STUDENT_INSERT('이하림', '971022-2345678', '01040331022');
EXEC PRC_STUDENT_INSERT('이희주', '950107-2345678', '01082695439');
EXEC PRC_STUDENT_INSERT('전혜림', '950630-2345678', '01080019506');
EXEC PRC_STUDENT_INSERT('스윙스', '930320-2345678', '01036952468');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다. * 6

SELECT *
FROM TBL_STUDENT;
--==>>
/*
S_CODE	S_NAME	S_SSN	        S_ID	    S_PW	S_REG_DATE
S10001	박민지	960907-2345678	01039315569	2345678	2021-04-16
S10002	심혜진	940708-2345678	01071019504	2345678	2021-04-16
S10003	이하림	971022-2345678	01040331022	2345678	2021-04-16
S10004	이희주	950107-2345678	01082695439	2345678	2021-04-16
S10005	전혜림	950630-2345678	01080019506	2345678	2021-04-16
S10006	스윙스	930320-2345678	01036952468	2345678	2021-04-16
*/


--○ TBL_PROFESSOR 데이터 입력
-- 생성된 프로시저 확인
EXEC PRC_PROFESSOR_INSERT('김호진', '751212-1234567','01011112222');
EXEC PRC_PROFESSOR_INSERT('김동수', '681229-1293882','01022223333');
EXEC PRC_PROFESSOR_INSERT('강창묵', '820419-1342327','01033334444');
EXEC PRC_PROFESSOR_INSERT('김태형', '650901-1288321','01044445555');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다. * 4

SELECT *
FROM TBL_PROFESSOR;
--==>> 
/*
P10001	김호진	751212-1234567	01011112222	1234567	21/04/16
P10002	김동수	681229-1293882	01022223333	1293882	21/04/16
P10003	강창묵	820419-1342327	01033334444	1342327	21/04/16
P10004	김태형	650901-1288321	01044445555	1288321	21/04/16
*/


--○ TBL_BOOK 데이터 입력
INSERT INTO TBL_BOOK(B_CODE, B_NAME)
VALUES('B001', 'JAVA의 정석');
INSERT INTO TBL_BOOK(B_CODE, B_NAME)
VALUES('B002', 'ORACLE의 정석');
INSERT INTO TBL_BOOK(B_CODE, B_NAME)
VALUES('B003', 'HTML5+CSS3의 정석');
INSERT INTO TBL_BOOK(B_CODE, B_NAME)
VALUES('B004', 'SPRING의 정석');
INSERT INTO TBL_BOOK(B_CODE, B_NAME)
VALUES('B005', 'PYTHON의 정석');
INSERT INTO TBL_BOOK(B_CODE, B_NAME)
VALUES('B006', 'R의 정석');


SELECT *
FROM TBL_BOOK;
--==>> 
/*
B001	JAVA의 정석
B002	ORACLE의 정석
B003	HTML5+CSS3의 정석
B004	SPRING의 정석
*/

--○ TBL_ROOM 데이터 입력

INSERT INTO TBL_ROOM(R_CODE, R_NAME, R_EXPLAIN)
VALUES('R001', 'A강의실', '2층, 정원 25명');
INSERT INTO TBL_ROOM(R_CODE, R_NAME, R_EXPLAIN)
VALUES('R002', 'B강의실', '2층, 정원 30명');
INSERT INTO TBL_ROOM(R_CODE, R_NAME, R_EXPLAIN)
VALUES('R003', 'F강의실', '4층, 정원 20명');
--==>> 1 행 이(가) 삽입되었습니다. *3

SELECT *
FROM TBL_ROOM;
--==>>
/*
R001	A강의실	2층, 정원 25명
R002	B강의실	2층, 정원 30명
R003	F강의실	4층, 정원 20명
*/


--○ TBL_SUBJECT 데이터 입력
INSERT INTO TBL_SUBJECT(SJ_CODE, SJ_NAME)
VALUES('S001', 'JAVA');
INSERT INTO TBL_SUBJECT(SJ_CODE, SJ_NAME)
VALUES('S002', 'ORACLE');
INSERT INTO TBL_SUBJECT(SJ_CODE, SJ_NAME)
VALUES('S003', 'HTML5');
INSERT INTO TBL_SUBJECT(SJ_CODE, SJ_NAME)
VALUES('S004', 'CSS3');
INSERT INTO TBL_SUBJECT(SJ_CODE, SJ_NAME)
VALUES('S005', 'SPRING');
INSERT INTO TBL_SUBJECT(SJ_CODE, SJ_NAME)
VALUES('S006', 'PYTHON');
INSERT INTO TBL_SUBJECT(SJ_CODE, SJ_NAME)
VALUES('S007', 'R');

SELECT *
FROM TBL_SUBJECT;
--==>>
/*
S001	JAVA
S002	ORACLE
S003	HTML5
S004	CSS3
S005	SPRING
S006	PYTHON
S007	R
*/


--○ TBL_COURSE 데이터 입력
INSERT INTO TBL_COURSE(C_CODE, C_NAME)
VALUES('C001', '풀스택 SW개발자과정(G)');  
/* 풀스택 과정 2021-02-01 ~ 2020-07-12
1.JAVA 2021-02-01 ~ 2021-02-28
2.ORACLE, 2021-03-01 ~ 2021-03-31 
3.HTML5,  2021-04-01 ~ 2021-04-30
4.CSS3 2021-05-01 ~ 2021-05-31
5.SPRING 2021-06-01 ~ 2021-07-12
*/
INSERT INTO TBL_COURSE(C_CODE, C_NAME)
VALUES('C002', '빅데이터 개발자과정(B)'); 
/* 빅데이터 개발자과정 2021-07-14 ~ 2021-12-21
1.JAVA, 2021-07-14 ~ 2021-08-31
2.ORACLE, 2021-09-01 ~ 2021-10-30
3.PYTHON  2021-11-01 ~ 2021-11-31
4.R 2021-12-01 ~ 2021-12-21
*/
--==>> 1 행 이(가) 삽입되었습니다. *2

SELECT *
FROM TBL_COURSE;
--==>>
/*
C001	풀스택 SW개발자과정(G)
C002	빅데이터 개발자과정(B)
*/

--○ TBL_ALLOT 데이터 입력
EXEC PRC_ALLOT_INSERT(20, 30, 50);  -- 풀스택 과정 배점
EXEC PRC_ALLOT_INSERT(30, 30, 40);  -- 빅데이터 과정 배점
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_ALLOT;
--==>>
/*
1001	20	30	50
1002	30	30	40
*/


--○ TBL_OP_COURSE 데이터 입력
EXEC PRC_OP_COURSE_INSERT('풀스택 SW개발자과정(G)', 'R001', '2021-02-01', '2021-07-12');
EXEC PRC_OP_COURSE_INSERT('빅데이터 개발자과정(B)', 'R002', '2021-07-14', '2021-12-21');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_OP_COURSE;
--==>> 
/*
1001	C001	R001	21/02/01	21/07/12
1002	C002	R002	21/07/14	21/12/21
*/

--○ TBL_OP_SUBJECT 데이터 입력

DELETE
FROM TBL_OP_SUBJECT;

DELETE
FROM TBL_SUGANG;

DELETE
FROM TBL_SCORE;

DROP SEQUENCE SEQ_OPS_CODE;

CREATE SEQUENCE SEQ_OPS_CODE
START WITH 1001
INCREMENT BY 1
MINVALUE 1001
MAXVALUE 9999
NOCACHE;

DROP SEQUENCE SEQ_SUGANG;

CREATE SEQUENCE SEQ_SUGANG
START WITH 1001
INCREMENT BY 1
MINVALUE 1001
MAXVALUE 9999
NOCACHE;

DROP SEQUENCE SEQ_OP_SUBJECT;

CREATE SEQUENCE SEQ_OP_SUBJECT
START WITH 1001
INCREMENT BY 1
MINVALUE 1001
MAXVALUE 9999
NOCACHE;

-- 1001 풀스택 과정 2021-02-01 ~ 2020-07-12 (JAVA/ORACLE/HTML5/CSS3/SPRING)
EXEC PRC_OP_SUBJECT_INSERT('S001', 1001, 'P10001', 'B001', 1001, '2021-02-01', '2021-02-28');
EXEC PRC_OP_SUBJECT_INSERT('S002', 1001, 'P10001', 'B002', 1001, '2021-03-01', '2021-03-31');
EXEC PRC_OP_SUBJECT_INSERT('S003', 1001, 'P10003', 'B003', 1001, '2021-04-01', '2021-04-30');
EXEC PRC_OP_SUBJECT_INSERT('S004', 1001, 'P10003', 'B003', 1001, '2021-05-01', '2021-05-31');
EXEC PRC_OP_SUBJECT_INSERT('S005', 1001, 'P10003', 'B004', 1001, '2021-06-01', '2021-07-12');

--○ 한 과정(풀스택) 내에서 P10001, P10003 다른 교수가 같은 기간에 과목을 개설하려는 경우 에러 확인
EXEC PRC_OP_SUBJECT_INSERT('S006', 1001, 'P10003', 'B004', 1001, '2021-03-01', '2021-03-12');
--==>> ORA-20010: 입력한 날짜가 기존 과목 날짜와 겹칩니다 다시 시도하세요

--○ 한 과정(풀스택)의 진행기간을 벗어나는 과목을 개설하려는 경우 에러 확인
EXEC PRC_OP_SUBJECT_INSERT('S006', 1001, 'P10003', 'B004', 1001, '2021-01-01', '2021-01-12');
--==>> ORA-20011: 입력한 날짜가 기존 개설강좌 날짜 안에 유효하지 않습니다.

-- 1002 빅데이터 개발자과정 2021-07-14 ~ 2021-12-21 (JAVA/ORACLE/PYTHON/R)
EXEC PRC_OP_SUBJECT_INSERT('S001', 1002, 'P10002', 'B001', 1002, '2021-07-14', '2021-08-31');
EXEC PRC_OP_SUBJECT_INSERT('S002', 1002, 'P10002', 'B002', 1002, '2021-09-01', '2021-10-30');
EXEC PRC_OP_SUBJECT_INSERT('S006', 1002, 'P10004', 'B005', 1002, '2021-11-01', '2021-11-30');
EXEC PRC_OP_SUBJECT_INSERT('S007', 1002, 'P10004', 'B006', 1002, '2021-12-01', '2021-12-21');

--○ PRC_OP_SUBJECT_UPDATE (과목 수정) 테스트 
-- 테스트용 과정 생성 
INSERT INTO TBL_COURSE(C_CODE, C_NAME)
VALUES('C003', 'AI 융합 개발자과정(C)');

-- 테스트용 개설과정 생성 
EXEC PRC_OP_COURSE_INSERT('AI 융합 개발자과정(C)', 'R003', '2021-08-02', '2022-01-11');

-- 생성 확인
SELECT *
FROM TBL_OP_COURSE;

-- 임의의 과목 생성 
EXEC PRC_OP_SUBJECT_INSERT('S007', 1003, 'P10004', 'B006', 1002, '2021-08-02', '2021-08-31');
--==>> 1011	S007	1003	P10004	B006	1002	21/08/02	21/08/31

-- UPDATE 쿼리 테스트 
EXEC PRC_OP_SUBJECT_UPDATE(1011, 'S002', 1003, 'P10003', 'B006', 1002, '2021-09-01', '2021-09-30');
--==>> 1011	S002	1003	P10003	B006	1002	21/09/01	21/09/30

-- DELETE 쿼리 테스트
EXEC PRC_OP_SUBJECT_DELETE(1011);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.

SELECT *
FROM TBL_OP_SUBJECT
ORDER BY OPS_CODE;
--==>>
/*
1001	S001	1001	P10001	B001	1001	21/02/01	21/02/28
1002	S002	1001	P10001	B002	1001	21/03/01	21/03/31
1003	S003	1001	P10003	B003	1001	21/04/01	21/04/30
1004	S004	1001	P10003	B003	1001	21/05/01	21/05/31
1005	S005	1001	P10003	B004	1001	21/06/01	21/07/12
1006	S001	1002	P10002	B001	1002	21/07/14	21/08/31
1007	S002	1002	P10002	B002	1002	21/09/01	21/10/30
1008	S006	1002	P10004	B005	1002	21/11/01	21/11/30
1009	S007	1002	P10004	B006	1002	21/12/01	21/12/21
*/



--○ TBL_SUGANG 데이터 입력
--1001 풀스택 과정 (S10001	박민지 S10002	심혜진 S10003	이하림   S10006 스윙스)
EXEC PRC_SUGANG_INSERT('S10001', 1001);
EXEC PRC_SUGANG_INSERT('S10002', 1001);
EXEC PRC_SUGANG_INSERT('S10003', 1001);
EXEC PRC_SUGANG_INSERT('S10006', 1001);

--1002 빅데이터 과정 (S10004	이희주   S10005  	전혜림)
EXEC PRC_SUGANG_INSERT('S10004', 1002);
EXEC PRC_SUGANG_INSERT('S10005', 1002);
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다. *6

SELECT *
FROM TBL_SUGANG;
--==>>
/*
1001	S10001	1001	21/04/16
1002	S10002	1001	21/04/16
1003	S10003	1001	21/04/16
1004	S10006	1001	21/04/16
1005	S10004	1002	21/04/16
1006	S10005	1002	21/04/16
*/


--○ TBL_SCORE 데이터 입력

-- 에러 확인 ( 배점 기준 20, 30, 50 )
--EXEC PRC_SCORE_INSERT(1001, 1001, 30, 20, 40); 

/*
SELECT *
FROM TBL_OP_SUBJECT
ORDER BY 1;

SELECT *
FROM TBL_SUGANG;
1001	S10001	1001	21/04/16 민지
1002	S10002	1001	21/04/16 혜진
1003	S10003	1001	21/04/16 하림
1004	S10004	1002	21/04/16 희주
1005	S10005	1002	21/04/16 혜림
1006	S10006	1001	21/04/17 스윙스
*/



-- 성적 입력
EXEC PRC_SCORE_INSERT(1001, 1001, 20, 20, 40); 
-- JAVA, 민지
EXEC PRC_SCORE_INSERT(1002, 1001, 20, 30, 40); 
-- JAVA, 혜진
EXEC PRC_SCORE_INSERT(1003, 1001, 20, 24, 45); 
-- JAVA, 하림
EXEC PRC_SCORE_INSERT(1004, 1001, 10, 15, 45); -- 수강코드 또는 개설과목코드를 잘못 입력하셨습니다. 다시 한 번 확인해주세요.
-- JAVA, 스윙스

EXEC PRC_SCORE_INSERT(1001, 1002, 15, 27, 25); 
-- ORACLE, 민지
EXEC PRC_SCORE_INSERT(1002, 1002, 20, 25, 30); 
-- ORACLE, 혜진
EXEC PRC_SCORE_INSERT(1003, 1002, 15, 30, 40); 
-- ORACLE, 하림
EXEC PRC_SCORE_INSERT(1004, 1002, 40, 20, 30); -- 수강코드 또는 개설과목코드를 잘못 입력하셨습니다. 다시 한 번 확인해주세요.
-- ORACLE, 스윙스 ----------------------------------->> 데이터 수정 필요 (SG_CODE가 1004 -> OPC_CODE가 1002 -> OPS_CODE 는 1006~1009 사이여야 함) 

-- 성적 입력시 배점 초과 에러 테스트 
EXEC PRC_SCORE_INSERT(1001, 1001, 30, 20, 40); 
EXEC PRC_SCORE_INSERT(1001, 1001, 20, 40, 40); 
EXEC PRC_SCORE_INSERT(1001, 1001, 20, 40, 60); 
--==>> ORA-20013: 점수는 배점을 초과할 수 없습니다. 
EXEC PRC_SCORE_INSERT(1003, 1002, 40, 30, 40); 
EXEC PRC_SCORE_INSERT(1003, 1002, 15, 40, 40); 
EXEC PRC_SCORE_INSERT(1003, 1002, 15, 30, 60); 
--==>> ORA-20013: 점수는 배점을 초과할 수 없습니다. 

DROP SEQUENCE SEQ_SCORE;

CREATE SEQUENCE SEQ_SCORE
START WITH 1001
INCREMENT BY 1
MINVALUE 1001
MAXVALUE 9999
NOCACHE;

DELETE
FROM TBL_SCORE;

SELECT *
FROM TBL_SCORE;
--==>>
/*
1001	1001	1001	20	20	40
1002	1002	1001	20	30	40
1003	1003	1001	20	24	45
1004	1004	1001	10	15	45
1005	1001	1002	15	27	25
1006	1002	1002	20	25	30
1007	1003	1002	15	30	40
1008	1004	1002	10	20	30
*/

SELECT *
FROM TBL_SUGANG;

--○ TBL_DROP 데이터 입력
----1.USER_DEFINE_ERROR 테스트 더미 데이타 
EXEC PRC_DROP_INSERT(1001, 1004, '성적미달', SYSDATE);
/*
명령의 140 행에서 시작하는 중 오류 발생 -
BEGIN PRC_DROP_INSERT(1007, '성적미달', SYSDATE); END;
오류 보고 -
ORA-20014: 중도탈락 대상이 아닙니다.
ORA-06512: at "HR.PRC_DROP_INSERT", line 78
ORA-06512: at line 1
*/

----2.USER_DEFINE_ERROR2 테스트 더미 데이타 
EXEC PRC_DROP_INSERT(1000, '출석률불충분', SYSDATE);
/*
명령의 159 행에서 시작하는 중 오류 발생 -
BEGIN PRC_DROP_INSERT(1000, '출석률불충분', SYSDATE); END;
오류 보고 -
ORA-20015: 과목수강 명단에 없습니다.
ORA-06512: at "HR.PRC_DROP_INSERT", line 86
ORA-06512: at line 1
*/

----3.USER_DEFINE_ERROR3 테스트 더미 데이타 
EXEC PRC_DROP_INSERT(1010, '성적미달', SYSDATE); 
--PL/SQL 프로시저가 성공적으로 완료되었습니다.
EXEC PRC_DROP_INSERT(1011, '성적미달', SYSDATE);
--PL/SQL 프로시저가 성공적으로 완료되었습니다.
EXEC PRC_DROP_INSERT(1012, '성적미달', SYSDATE);
--PL/SQL 프로시저가 성공적으로 완료되었습니다.

EXEC PRC_DROP_INSERT(1010, '성적미달', SYSDATE); 
/*
BEGIN PRC_DROP_INSERT(1010, '성적미달', SYSDATE); END;
오류 보고 -
ORA-20016: 이미 중도탈락된 학생입니다.
ORA-06512: at "HR.PRC_DROP_INSERT", line 82
ORA-06512: at line 1
*/


-------------------------- 프로시저 확인 ---------------------------------------

--○ 등록 학생 수정, 삭제

--EXEC PRC_STUDENT_UPDATE('S10001', '박민지', '960907-2345678', '01039315569', 'minji123', TO_DATE('2021-04-16'));
--EXEC PRC_STUDENT_DELETE('S10005');

--○ PRC_OP_COURSE_UPDATE 프로시저 테스트

--EXEC PRC_OP_COURSE_UPDATE('101', '풀스택 SW개발자과정(G)', 'R001', '2021-02-01', '2021-07-09');
--==>> ORA-20005: 과정코드를 잘못 입력하셨습니다.


--○ PRC_OP_COURSE_UPDATE 프로시저 테스트

--EXEC PRC_OP_COURSE_DELETE('101');
--==>> ORA-20005: 과정코드를 잘못 입력하셨습니다.


--○ 교수 로그인시 담당 과목 확인 프로시저 테스트
SET SERVEROUTPUT ON;

EXEC PRC_PROFESSOR_PRINT('01011112222');
--==>>
/*
김호진 , JAVA , 21/02/01 , 21/02/28 , JAVA의 정석
김호진 , JAVA , 21/07/14 , 21/08/31 , JAVA의 정석
김호진 , ORACLE , 21/03/01 , 21/03/31 , ORACLE의 정석
김호진 , ORACLE , 21/09/01 , 21/10/30 , ORACLE의 정석


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/



------------------------------ 뷰 확인 -----------------------------------------

--○ 관리자 계정에서 등록된 학생 출력 뷰(ADMIN_STUDENT_VIEW)
SELECT *
FROM ADMIN_STUDENT_VIEW
ORDER BY 1;
--==>>
/*
박민지	풀스택 SW개발자과정(G)	JAVA	80	 
박민지	풀스택 SW개발자과정(G)	ORACLE	67	 
심혜진	풀스택 SW개발자과정(G)	ORACLE	75	 
심혜진	풀스택 SW개발자과정(G)	JAVA	90	 
이하림	풀스택 SW개발자과정(G)	JAVA	89	 
이하림	풀스택 SW개발자과정(G)	ORACLE	85	 
*/


--○ 학생 계정에서 과목 출력(STUDENT_SUBJECT_VIEW)
-- 수강이 끝난 과목만 출력 가능
SELECT 학생명, 과목명
FROM STUDENT_SUBJECT_VIEW
WHERE 학생명 = '박민지';
--==>>
/*
박민지	ORACLE
박민지	JAVA
*/

SELECT *
FROM STUDENT_SUBJECT_VIEW
WHERE 과목명 = 'JAVA';
--==>>
/*
박민지	JAVA
심혜진	JAVA
이하림	JAVA
스윙스	JAVA
*/


-- 관리자 계정에서 개설된 과정 출력
--○ ADMIN_OP_COURSE_VIEW 뷰 테스트
SELECT *
FROM ADMIN_OP_COURSE_VIEW
ORDER BY 1 DESC;
--==>> 
/*
과정명	            강의실명	과목명	과목시작일	    과목종료일	    교재명	        교수자명
풀스택 SW개발자과정(G)	A강의실	CSS3	21/05/01	21/05/31	HTML5+CSS3의 정석	강창묵
풀스택 SW개발자과정(G)	A강의실	HTML5	21/04/01	21/04/30	HTML5+CSS3의 정석	강창묵
풀스택 SW개발자과정(G)	A강의실	JAVA	21/02/01	21/02/28	JAVA의 정석	    김호진
풀스택 SW개발자과정(G)	A강의실	ORACLE	21/03/01	21/03/31	ORACLE의 정석	    김호진
풀스택 SW개발자과정(G)	A강의실	SPRING	21/06/01	21/07/12	SPRING의 정석	    강창묵
빅데이터 개발자과정(B)	B강의실	ORACLE	21/09/01	21/10/30	ORACLE의 정석	    김동수
빅데이터 개발자과정(B)	B강의실	PYTHON	21/11/01	21/11/30	PYTHON의 정석	    김태형
빅데이터 개발자과정(B)	B강의실	R	    21/12/01	21/12/21	R의 정석	        김태형
빅데이터 개발자과정(B)	B강의실	JAVA	21/07/14	21/08/31	JAVA의 정석	    김동수
*/


-- 교수 계정에서 자신이 강의한 과목의 성적 출력
--○ PROF_SCORE_VIEW 뷰 테스트

SELECT *
FROM PROF_SCORE_VIEW
WHERE 교수명 = '김호진';
--==>>
/*
JAVA	21/02/01	21/02/28	JAVA의 정석	    심혜진	20	40	30	90	1
JAVA	21/02/01	21/02/28	JAVA의 정석	    이하림	20	45	24	89	2
ORACLE	21/03/01	21/03/31	ORACLE의 정석	    이하림	15	40	30	85	3
JAVA	21/02/01	21/02/28	JAVA의 정석	    박민지	20	40	20	80	4
ORACLE	21/03/01	21/03/31	ORACLE의 정석	    심혜진	20	30	25	75	5
ORACLE	21/03/01	21/03/31	ORACLE의 정석	    박민지	15	25	27	67	6
*/

SELECT *
FROM TBL_SUGANG;

SELECT *
FROM TBL_SCORE;

--○ 교수 계정에서 담당과목 조회

SELECT 과목명, 과목시작일, 과목종료일
FROM PROF_SUBJECT_VIEW
WHERE 교수이름='김호진';


