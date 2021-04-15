--○ 테스트(dummy data)
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


--○ 관리자 계정에서 등록된 학생 출력(ADMIN_STUDENT_VIEW)
CREATE OR REPLACE VIEW ADMIN_STUDENT_VIEW
AS
SELECT S.S_NAME "학생이름"
     , C.C_NAME "과정명"
     , SJ.SJ_NAME "수강과목"
     , (SC.A_SCORE + SC.W_SCORE + SC.P_SCORE) "수강과목총점"
FROM TBL_STUDENT S, TBL_SUGANG SG, TBL_COURSE C, TBL_OP_COURSE OPC, TBL_SUBJECT SJ, TBL_OP_SUBJECT OPS, TBL_SCORE SC
WHERE S.S_CODE = SG.S_CODE
  AND SG.OPC_CODE = OPC.OPC_CODE
  AND OPC.OPC_CODE = OPS.OPC_CODE
  AND OPC.C_CODE = C.C_CODE
  AND OPS.SJ_CODE = SJ.SJ_CODE
  AND SG.SG_CODE = SC.SG_CODE
  AND SC.OPS_CODE = OPS.OPS_CODE;
--==>> View ADMIN_STUDENT_VIEW이(가) 생성되었습니다.


