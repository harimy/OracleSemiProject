--○ 프로시저 테스트(dummy data)
ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';

SELECT *
FROM TBL_STUDENT;

EXEC PRC_STUDENT_INSERT('박민지', '960907-2345678', '01039315569');
EXEC PRC_STUDENT_INSERT('심혜진', '940708-2345678', '01071019504');
EXEC PRC_STUDENT_INSERT('이하림', '971022-2345678', '01040331022');
EXEC PRC_STUDENT_INSERT('이희주', '950107-2345678', '01082695439');
EXEC PRC_STUDENT_INSERT('전혜림', '950630-2345678', '01080019506');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다. * 5

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
*/

EXEC PRC_STUDENT_UPDATE('S10001', '박민지', '960907-2345678', '01039315569', 'minji123', TO_DATE('2021-04-16'));
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.
--==>> S10001	박민지	960907-2345678	01039315569	minji123	2021-04-16

EXEC PRC_STUDENT_DELETE('S10005');
--==>> PL/SQL 프로시저가 성공적으로 완료되었습니다.


--○ 관리자 계정에서 등록된 모든 학생 출력(ADMIN_STUDENT_VIEW) -> 수강이 끝나지 않은 과목도 모두 출력 될 수 있게
-- 출력 정보 : 학생 이름, 과정명, 수강과목, 수강과목 총점
-- 과정을 중도탈락하여 명단에서 제외된 학생의 경우, 중도탈락 사실을 화면에서 확인할 수 있어야 한다.
CREATE OR REPLACE VIEW ADMIN_STUDENT_VIEW
AS
SELECT S.S_NAME "학생이름"
     , NVL(C.C_NAME, '수강미등록') "과정명"
     , NVL(SJ.SJ_NAME, '개설예정') "수강과목"
     , (SC.A_SCORE + SC.P_SCORE + SC.W_SCORE) "수강과목 총점"
     , CASE WHEN D.D_CODE IS NOT NULL 
            THEN CONCAT('중도탈락 - ',TO_CHAR(D.D_CODE))
            ELSE NULL
       END "중도탈락여부"
FROM TBL_STUDENT S, TBL_SUGANG SG, TBL_SCORE SC, TBL_DROP D, TBL_OP_SUBJECT OPS, TBL_SUBJECT SJ
   , TBL_OP_COURSE OPC, TBL_COURSE C
WHERE S.S_CODE = SG.S_CODE(+)
  AND SG.SG_CODE = D.SG_CODE(+)
  AND SC.SG_CODE(+) = SG.SG_CODE
  AND OPS.SJ_CODE = SJ.SJ_CODE(+)
  AND OPS.OPS_CODE(+) = SC.OPS_CODE
  AND OPC.C_CODE = C.C_CODE(+)
  AND SG.OPC_CODE = OPC.OPC_CODE(+);
--==>> View ADMIN_STUDENT_VIEW이(가) 생성되었습니다.

SELECT *
FROM ADMIN_STUDENT_VIEW;
--==>>
/*
학생이름	과정명	            수강과목	수강과목 총점	중도탈락여부
이하림	풀스택 SW개발자과정(G)	JAVA	89	
박민지	풀스택 SW개발자과정(G)	JAVA	80	        중도탈락 - 1001
심혜진	풀스택 SW개발자과정(G)	JAVA	90	
박민지	풀스택 SW개발자과정(G)	ORACLE	67	        중도탈락 - 1001
심혜진	풀스택 SW개발자과정(G)	ORACLE	75	
이하림	풀스택 SW개발자과정(G)	ORACLE	85	
스윙스	풀스택 SW개발자과정(G)	개설예정		
전혜림	빅데이터 개발자과정(B)	개설예정		
이희주	빅데이터 개발자과정(B)	개설예정		
*/

  
--○ 학생 계정에서 과목 출력(STUDENT_SUBJECT_VIEW)
-- 수강이 끝난 과목만 출력 가능
CREATE OR REPLACE VIEW STUDENT_SUBJECT_VIEW
AS
SELECT S.S_NAME "학생명", SJ.SJ_NAME "과목명"
FROM TBL_STUDENT S, TBL_SUGANG SG, TBL_OP_COURSE OPC, TBL_SUBJECT SJ, TBL_OP_SUBJECT OPS
WHERE S.S_CODE = SG.S_CODE(+)
  AND SG.OPC_CODE = OPC.OPC_CODE(+)
  AND OPS.OPC_CODE(+) = OPC.OPC_CODE
  AND OPS.SJ_CODE = SJ.SJ_CODE(+);
--==>> View STUDENT_SUBJECT_VIEW이(가) 생성되었습니다.

SELECT *
FROM STUDENT_SUBJECT_VIEW
WHERE 학생명 = '박민지';
--==>> 박민지	자바

SELECT *
FROM STUDENT_SUBJECT_VIEW
WHERE 과목명 = '자바';
--==>> 박민지	자바


--○ 학생 계정에서 성적 출력(STUDENT_SCORE_VIEW)
-- 수강이 끝난 과목 성적 확인 가능 
-- 특정 과목 선택 시, 그 과목의 점수만 보여줄 수 있게.
-- 출력 정보 : 학생이름, 과정명, 과목명, 교육기간(시작 연월일, 끝연월일), 교재명, 출결, 실기, 필기, 총점, 등수 
CREATE OR REPLACE VIEW STUDENT_SCORE_VIEW
AS
SELECT S.S_NAME "학생이름"
     , C.C_NAME "과정명"
     , SJ.SJ_NAME "과목명"
     , OPS.START_DATE "교육시작일"
     , OPS.END_DATE "교육마지막일"
FROM TBL_STUDENT S, TBL_SUGANG SG, TBL_COURSE C, TBL_OP_COURSE OPC, TBL_SUBJECT SJ, TBL_OP_SUBJECT OPS, TBL_SCORE SC
WHERE S.S_CODE = SG.S_CODE(+)
  AND SG.OPC_CODE = OPC.OPC_CODE(+)
  AND OPC.OPC_CODE = OPS.OPC_CODE(+)
  AND OPC.C_CODE = C.C_CODE(+)
  AND OPS.SJ_CODE = SJ.SJ_CODE(+)
  AND SC.SG_CODE(+) = SG.SG_CODE;
--==>> View STUDENT_SCORE_VIEW이(가) 생성되었습니다.

SELECT *
FROM STUDENT_SCORE_VIEW;
--==>>
/*
학생이름	과정명	            과목명	교육시작일	    교육마지막일
박민지	자바 개발자 양성과정	    자바	    2021-02-01	2021-03-30
심혜진				
이하림				
이희주				
전혜림							
*/

SELECT *
FROM TBL_STUDENT;


--○ 뷰 테스트(dummy data)
-- 필요한 데이터 : (학생), 교수, 책, 과정, 과목, 강의실, 과정개설, 중도탈락, 과목개설, 성적, 수강

-- 교수
INSERT INTO TBL_PROFESSOR(P_CODE, P_NAME, P_SSN, P_ID, P_PW)
VALUES('P10001', '홍길동', '751211-1123456', '01012341234', '1123456');
--==>> 1 행 이(가) 삽입되었습니다.

SELECT *
FROM TBL_PROFESSOR;
--==>> P10001	홍길동	751211-1123456	01012341234	1123456	2021-04-16


-- 책
INSERT INTO TBL_BOOK(B_CODE, B_NAME) VALUES('B101' , 'JAVA의정석');
INSERT INTO TBL_BOOK(B_CODE, B_NAME) VALUES('B102' , '웹표준의정석');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_BOOK;
--==>>
/*
B101	JAVA의정석
B102	웹표준의정석
*/


-- 과정
INSERT INTO TBL_COURSE(C_CODE, C_NAME)
VALUES ('C101', '자바 개발자 양성과정');
INSERT INTO TBL_COURSE(C_CODE, C_NAME)
VALUES ('C102', '빅데이터 개발자 양성');
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_COURSE;
--==>> 
/*
C102	빅데이터 개발자 양성
C101	자바 개발자 양성과정
*/


-- 과목
INSERT INTO TBL_SUBJECT(SJ_CODE, SJ_NAME)
VALUES ('J101', '자바');
INSERT INTO TBL_SUBJECT(SJ_CODE, SJ_NAME)
VALUES ('J102', '오라클');
INSERT INTO TBL_SUBJECT(SJ_CODE, SJ_NAME)
VALUES ('J103', 'HTML');
--==>> 1 행 이(가) 삽입되었습니다. * 3

SELECT *
FROM TBL_SUBJECT;
--==>>
/*
J103	HTML
J102	오라클
J101	자바
*/


-- 강의실
INSERT INTO TBL_ROOM(R_CODE, R_NAME, EXPALIN)
VALUES ('R101', 'A강의장', '30명 수용가능'); 
INSERT INTO TBL_ROOM(R_CODE, R_NAME, EXPALIN)
VALUES ('R102', 'B강의장', '20명 수용가능'); 
--==>> 1 행 이(가) 삽입되었습니다. * 2

SELECT *
FROM TBL_ROOM;
--==>> 
/*
R101	A강의장	30명 수용가능
R102	B강의장	20명 수용가능
*/


-- 과정개설
INSERT INTO TBL_OP_COURSE(OPC_CODE, C_CODE, R_CODE, START_DATE, END_DATE)
VALUES(1001, 'C101', 'R101', TO_DATE('2021-02-01'), TO_DATE('2021-07-02'));
--==>> 1 행 이(가) 삽입되었습니다.


-- 배점
INSERT INTO TBL_ALLOT(AL_CODE, A_ALLOT, W_ALLOT, P_ALLOT)
VALUES(1001, 20, 50, 30);
--==>> 1 행 이(가) 삽입되었습니다.


-- 수강
INSERT INTO TBL_SUGANG(SG_CODE, S_CODE, OPC_CODE, SG_DATE)
VALUES(1001, 'S10001', 1001, SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.


-- 중도탈락
INSERT INTO TBL_DROP(D_CODE, SG_CODE, REASON, DR_DATE)
VALUES(1001, 1001, '출석미달', SYSDATE);
--==>> 1 행 이(가) 삽입되었습니다.


-- 과목개설
INSERT INTO TBL_OP_SUBJECT(OPS_CODE, SJ_CODE, OPC_CODE, P_CODE, B_CODE, AL_CODE, START_DATE, END_DATE)
VALUES(1001, 'J101', 1001, 'P10001', 'B101', 1001, TO_DATE('2021-02-01'), TO_DATE('2021-03-30'));
--==>> 1 행 이(가) 삽입되었습니다.


-- 성적
INSERT INTO TBL_SCORE (SC_CODE, SG_CODE, OPS_CODE, A_SCORE, W_SCORE, P_SCORE)
VALUES(1001, 1001, 1001, 90, 80, 70);
--==>> 1 행 이(가) 삽입되었습니다.


