SELECT USER
FROM DUAL;
--==>> HR

--■■■ 관리자 계정 - 학생 관리 기능 구현 ■■■--
-- PRC_STUDENT_INSERT → 입력 정보는 학생 이름, 주민 뒷자리가 기본(주민 뒷자리는 학생 로그인시 패스워드로 사용되도록)
-- PRC_STUDNET_UPDATE
-- PRC_STUDENT_DELETE 
-- ADMIN_STUDENT_VIEW
-- (중도탈락 프로시저) → 나중에 함께 구현 

--○ PRC_STUDENT_INSERT
CREATE OR REPLACE PROCEDURE PRC_STUDENT_INSERT
( V_NAME    IN TBL_STUDENT.S_NAME%TYPE
, V_SSN     IN TBL_STUDENT.S_SSN%TYPE
, V_ID      IN TBL_STUDENT.S_ID%TYPE
)
IS
    V_CODE  TBL_STUDENT.S_CODE%TYPE;
    V_PW    TBL_STUDENT.S_PW%TYPE;
    
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- V_CODE 자동입력
    SELECT CONCAT('S', NVL(MAX(TO_NUMBER(SUBSTR(S_CODE, 2, 5))), 10000) + 1) INTO V_CODE
    FROM TBL_STUDENT;
    
    -- V_PW
    V_PW := SUBSTR(V_SSN, 8);
    
    -- 예외 발생(SSN 잘못 입력시)
    IF(V_SSN NOT LIKE '______-_______')
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    -- INSERT 쿼리문
    INSERT INTO TBL_STUDENT(S_CODE, S_NAME, S_SSN, S_ID, S_PW)
    VALUES (V_CODE, V_NAME, V_SSN, V_ID, V_PW);
    
    -- 커밋 
    COMMIT;
    
    -- 예외 처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '주민번호를 하이픈(-) 포함 14자리로 입력해주세요');    
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;
END;
--==>> Procedure PRC_STUDENT_INSERT이(가) 컴파일되었습니다.


--○ PRC_STUDENT_UPDATE
CREATE OR REPLACE PROCEDURE PRC_STUDENT_UPDATE
( V_CODE        IN TBL_STUDENT.S_CODE%TYPE
, V_NAME        IN TBL_STUDENT.S_NAME%TYPE
, V_SSN         IN TBL_STUDENT.S_SSN%TYPE
, V_ID          IN TBL_STUDENT.S_ID%TYPE
, V_PW          IN TBL_STUDENT.S_PW%TYPE
, V_REG_DATE    IN TBL_STUDENT.S_REG_DATE%TYPE
)
IS  
    USER_DEFINE_ERROR   EXCEPTION;
BEGIN
    -- 예외 발생(SSN 잘못 입력시)
    IF(V_SSN NOT LIKE '______-_______')
        THEN RAISE USER_DEFINE_ERROR;
    END IF;

    -- UPDATE 쿼리문
    UPDATE TBL_STUDENT
    SET S_NAME = V_NAME
      , S_SSN = V_SSN
      , S_ID = V_ID
      , S_PW = V_PW
      , S_REG_DATE = V_REG_DATE
    WHERE S_CODE = V_CODE;
    
    -- 커밋
    COMMIT;
    
    -- 예외 처리
    EXCEPTION
        WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20003, '주민번호를 하이픈(-) 포함 14자리로 입력해주세요.');     --> 주민번호가 잘못된 형식이라고 세부적으로 알려줘야 하지 않을까?
                ROLLBACK;
        WHEN OTHERS
            THEN ROLLBACK;

END;
--==>> Procedure PRC_STUDENT_UPDATE이(가) 컴파일되었습니다.


--○ PRC_STUDENT_DELETE
CREATE OR REPLACE PROCEDURE PRC_STUDENT_DELETE
( V_CODE    IN TBL_STUDENT.S_CODE%TYPE
)
IS
BEGIN
    -- DELETE 쿼리문 작성 
    DELETE
    FROM TBL_STUDENT
    WHERE S_CODE = V_CODE;
    
    -- 커밋 
    COMMIT; 
END;
--==>> Procedure PRC_STUDENT_DELETE이(가) 컴파일되었습니다.


