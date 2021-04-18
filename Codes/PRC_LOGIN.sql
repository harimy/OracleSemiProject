--○ 결과 출력을 위한 SERVEROUTPUT 설정
SET SERVEROUTPUT ON;

--○ PRC_LOGIN 프로시저 생성 
CREATE OR REPLACE PROCEDURE PRC_LOGIN
(V_DIV   IN VARCHAR2
 ,V_ID   IN TBL_ADMIN.A_ID%TYPE
 ,V_PW   IN TBL_ADMIN.A_PW%TYPE
)
IS
    -- 출력용 이름 담을 변수
    V_NAME  TBL_ADMIN.A_NAME%TYPE;

    --EXCEPTION에 사용될 변수와 값
    RESULTCODE_USERID        NUMBER(1);
    RESULTCODE_USERPW_MATCH NUMBER(1);
    USER_DEFINE_ERROR_ID EXCEPTION;
    USER_DEFINE_ERROR_PW EXCEPTION;
    
    --STUDENT_SUBJECT_VIEW 위한 변수 추가 변수 선언
    V_S_VIEW_NAME       TBL_STUDENT.S_NAME%TYPE;
    V_S_VIEW_SUBJECT    TBL_SUBJECT.SJ_NAME%TYPE;

    --STUDENT_SUBJECT_VIEW 위한 커서 선언
    CURSOR CUR_STUDENT_SELECT 
    IS
        SELECT 학생명, 과목명
        FROM STUDENT_SUBJECT_VIEW
        WHERE 학생명 = (SELECT S_NAME
                        FROM TBL_STUDENT
                        WHERE S_ID=V_ID);
   
BEGIN          
    --사용자의 ID가 존재 유무 확인
    
    IF V_DIV = '관리자'
        THEN SELECT COUNT(*) INTO RESULTCODE_USERID 
            FROM TBL_ADMIN 
            WHERE A_ID = V_ID;
    END IF;    
    
    
    IF V_DIV = '학생'
        THEN SELECT COUNT(*) INTO RESULTCODE_USERID 
            FROM TBL_STUDENT
            WHERE S_ID = V_ID;
    END IF;
    
  
    IF V_DIV = '교수자'
        THEN SELECT COUNT(*) INTO RESULTCODE_USERID 
            FROM TBL_PROFESSOR 
            WHERE P_ID = V_ID;
    END IF;
    
    --DBMS_OUTPUT.PUT_LINE('RESULTCODE_USERID: '||RESULTCODE_USERID);

    
    IF RESULTCODE_USERID  =  0
        THEN  RAISE USER_DEFINE_ERROR_ID;
    END IF;
    
    --사용자의 ID와 PW 일치 유무 확인
    
    IF V_DIV = '관리자'
        THEN SELECT COUNT(*) INTO RESULTCODE_USERPW_MATCH
            FROM TBL_ADMIN 
            WHERE A_ID = V_ID AND A_PW = V_PW;   
    END IF;    
    
    
    IF V_DIV = '학생'
        THEN SELECT COUNT(*) INTO RESULTCODE_USERPW_MATCH
            FROM TBL_STUDENT
            WHERE S_ID = V_ID AND S_PW=V_PW;         
    END IF;
    
  
    IF V_DIV = '교수자'
        THEN SELECT COUNT(*) INTO RESULTCODE_USERPW_MATCH
             FROM TBL_PROFESSOR 
             WHERE P_ID = V_ID AND P_PW=V_PW;     
    END IF;
    
    --DBMS_OUTPUT.PUT_LINE('RESULTCODE_USERPW_MATCH: '||RESULTCODE_USERPW_MATCH);    
    
    IF RESULTCODE_USERPW_MATCH  =  0
        THEN RAISE USER_DEFINE_ERROR_PW;
    END IF;
    
    --사용자의 ID 존재 확인 및 ID와 PW 일치 확인 모두 끝난 후 학생, 교수자 로그인 첫화면 출력
    
    IF V_DIV = '학생'
        THEN SELECT S_NAME INTO V_NAME
             FROM TBL_STUDENT 
             WHERE S_ID = V_ID AND S_PW = V_PW;
             
             DBMS_OUTPUT.PUT_LINE('[로그인 성공] 학생 ' || V_NAME ||'님 환영합니다.');
             
             OPEN CUR_STUDENT_SELECT;
             LOOP
                 FETCH CUR_STUDENT_SELECT INTO V_S_VIEW_NAME, V_S_VIEW_SUBJECT;
                 EXIT WHEN CUR_STUDENT_SELECT%NOTFOUND;
                 --출력
                 DBMS_OUTPUT.PUT_LINE(V_S_VIEW_NAME||' , '|| V_S_VIEW_SUBJECT);
            END LOOP;
            CLOSE CUR_STUDENT_SELECT;       
    END IF;
    
    IF V_DIV = '교수자'
        THEN SELECT P_NAME INTO V_NAME
             FROM TBL_PROFESSOR 
             WHERE P_ID = V_ID AND P_PW = V_PW; 
             
             DBMS_OUTPUT.PUT_LINE('[로그인 성공] 교수자 ' || V_NAME ||'님 환영합니다.');
             
             PRC_PROFESSOR_PRINT(V_ID);
    END IF;
    
    IF V_DIV = '관리자'
        THEN SELECT A_NAME INTO V_NAME
             FROM TBL_ADMIN 
             WHERE A_ID = V_ID AND A_PW = V_PW;
             DBMS_OUTPUT.PUT_LINE('[로그인 성공] 관리자 ' || V_NAME ||'님 환영합니다.');    
    END IF;
    
    EXCEPTION 
    WHEN USER_DEFINE_ERROR_ID
        THEN RAISE_APPLICATION_ERROR(-20001, 'ID가 존재하지 않습니다.');
            ROLLBACK;
    WHEN USER_DEFINE_ERROR_PW
        THEN RAISE_APPLICATION_ERROR(-20002, 'PW를 확인해주세요.');
            ROLLBACK;
    WHEN OTHERS
        THEN  ROLLBACK;

END;
--==>> Procedure PRC_LOGIN이(가) 컴파일되었습니다.



--○ PRC_LOGIN 프로시저 테스트
SET SERVEROUTPUT ON;

-- 관리자 로그인 테스트 
EXEC PRC_LOGIN('관리자','admin1','admin1234');
--==>> 
/*
[로그인 성공] 관리자 관리자1님 환영합니다.


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/


-- 학생 로그인 테스트
EXEC PRC_LOGIN('학생','01071019504','2345678');
--==>>
/*
[로그인 성공] 학생 심혜진님 환영합니다.
심혜진 , JAVA
심혜진 , ORACLE


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/

-- 교수자 로그인 테스트
EXEC PRC_LOGIN('교수자','01011112222','1234567');
--==>>
/*
[로그인 성공] 교수자 김호진님 환영합니다.
김호진 , JAVA , 21/07/14 , 21/08/31 , JAVA의 정석
김호진 , JAVA , 21/02/01 , 21/02/28 , JAVA의 정석
김호진 , ORACLE , 21/09/01 , 21/10/30 , ORACLE의 정석
김호진 , ORACLE , 21/03/01 , 21/03/31 , ORACLE의 정석


PL/SQL 프로시저가 성공적으로 완료되었습니다.
*/

-- 로그인 예외처리 테스트 ① → 잘못된 패스워드 입력
EXEC PRC_LOGIN('학생','01071019504','2012346');
--==>> 에러 발생 
/*
ORA-20002: PW를 확인해주세요.
*/

-- 로그인 예외처리 테스트 ② → 존재하지 않는 아이디 입력
EXEC PRC_LOGIN('학생','01','2012346');
--==>> 에러 발생
/*
ORA-20001: ID가 존재하지 않습니다.
*/

EXEC PRC_LOGIN('교수자','01071019504','2012346'); 
--==>> 에러 발생
/*
ORA-20001: ID가 존재하지 않습니다.
*/
--> 교수자로 로그인 하면서 학생 아이디를 입력했으므로 아이디가 존재하지 않는다는 에러 발생



