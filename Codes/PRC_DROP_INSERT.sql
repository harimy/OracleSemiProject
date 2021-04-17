
SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE PRC_DROP_INSERT
( V_SG_CODE        IN TBL_DROP.SG_CODE%TYPE
, V_REASON         IN TBL_DROP.REASON%TYPE 
, V_DR_DATE        IN TBL_DROP.DR_DATE%TYPE
)
IS  
    
    V_D_CODE         TBL_DROP.D_CODE%TYPE;
    
    --중도탈락 INSERT로 입력된 SG_CODE에 해당하는 학생 성적 총합  
    V_TOT            NUMBER(3) := 0;      
    --중도탈락 유무 확인 변수 
    V_DROP_CHECK    NUMBER(1);
    --수강코드 유무 확인 변수 
    V_SG_CODE_CHECK    NUMBER(1);
    --중도탈락 명단 유무 확인 변수
    V_D_SG_CODE_CHECK    NUMBER(1);    
    --예외 처리 변수
    USER_DEFINE_ERROR  EXCEPTION;
    USER_DEFINE_ERROR2 EXCEPTION;
    USER_DEFINE_ERROR3 EXCEPTION;
    
BEGIN
        SELECT NVL(MAX(D_CODE), 1000) +1 INTO V_D_CODE
        FROM TBL_DROP;

        SELECT COUNT(*) INTO V_SG_CODE_CHECK  
        FROM TBL_SUGANG
        WHERE SG_CODE=V_SG_CODE;
        
        --DBMS_OUTPUT.PUT_LINE('수강코드 존재 확인값: '||V_SG_CODE_CHECK);        
        --예외 처리 (SUGANG테이블에 수강코드 존재 유무 확인)
        IF (V_SG_CODE_CHECK = 0)
            THEN RAISE USER_DEFINE_ERROR2;
        END IF;
        
        --중도 탈락 대상 학생의 총점 확인
        SELECT A_SCORE+W_SCORE+P_SCORE INTO V_TOT
        FROM TBL_SCORE
        WHERE SG_CODE=V_SG_CODE;
 
        SELECT COUNT(*) INTO V_D_SG_CODE_CHECK  
        FROM TBL_DROP
        WHERE SG_CODE=V_SG_CODE;
        --DBMS_OUTPUT.PUT_LINE('중도탈락테이블존재하는 값: '||V_D_SG_CODE_CHECK );
         
        --예외 처리 (DROP테이블에 이미 존재하는 학생인지 유무 확인)
        IF (V_D_SG_CODE_CHECK = 1)
            THEN RAISE USER_DEFINE_ERROR3;
        END IF;
        
        --예외 처리 (DROP테이블에 없고 SUGANG테이블에 있는 학생중 중도탈락 유무 확인)
        IF (V_TOT >= 80)
           THEN V_DROP_CHECK := 0;
        ELSE
            V_DROP_CHECK := 1;
        END IF;
        
        IF (V_TOT >= 80)
           THEN V_DROP_CHECK := 0;
        ELSE
            V_DROP_CHECK := 1;
        END IF;
        
        IF (V_DROP_CHECK = 0)
            THEN RAISE USER_DEFINE_ERROR;
        END IF;
    
        --○ 입력          
        
        UPDATE TBL_SUGANG
        SET SG_DATE = TO_DATE('9999-09-09', 'YYYY-MM-DD')
        WHERE SG_CODE=V_SG_CODE;
        
        INSERT INTO TBL_DROP(D_CODE,SG_CODE,REASON,DR_DATE)
        VALUES(V_D_CODE,V_SG_CODE,V_REASON,SYSDATE); 
        
        COMMIT;
        
        --EXCEPTION
        EXCEPTION 
        WHEN USER_DEFINE_ERROR3
            THEN RAISE_APPLICATION_ERROR(-20016, '이미 중도탈락된 학생입니다.');
                ROLLBACK;
        WHEN USER_DEFINE_ERROR2
            THEN RAISE_APPLICATION_ERROR(-20015, '과목수강 명단에 없습니다.');
                ROLLBACK;
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20014, '중도탈락 대상이 아닙니다.');
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;   
END;

----1.USER_DEFINE_ERROR 테스트 더미 데이타 
EXEC PRC_DROP_INSERT(1001, '성적미달', SYSDATE);
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

        


    

