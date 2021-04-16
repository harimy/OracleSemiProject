SELECT *
FROM TBL_OP_SUBJECT;

CREATE OR REPLACE PROCEDURE PRC_OP_SUBJECT_INSERT
( V_SJ_CODE           IN TBL_SUBJECT.SJ_CODE%TYPE
, V_OPC_CODE          IN TBL_OP_COURSE.OPC_CODE%TYPE
, V_P_CODE            IN TBL_PROFESSOR.P_CODE%TYPE
, V_B_CODE            IN TBL_BOOK.B_CODE%TYPE
, V_AL_CODE           IN TBL_ALLOT.AL_CODE%TYPE
, V_START_DATE        IN TBL_OP_SUBJECT.START_DATE%TYPE
, V_END_DATE          IN TBL_OP_SUBJECT.END_DATE%TYPE

)
IS
    OPC_STARTDATE       TBL_OP_COURSE.START_DATE%TYPE;
    OPC_ENDDATE         TBL_OP_COURSE.END_DATE%TYPE;
    V_CHECK_SJ_CODE     TBL_PROFESSOR.P_CODE%TYPE;

    V_S_DATE    TBL_OP_SUBJECT.START_DATE%TYPE;
    V_E_DATE    TBL_OP_SUBJECT.END_DATE%TYPE;
    V_OPS_CODE   NUMBER(5) := 1001; -- 루프변수
    V_OPS_MAX    NUMBER(5);         -- OPS_CODE 의 최대값 변수, LOOP의 EXIT에서 사용 
    
    USER_DEFINE_ERROR    EXCEPTION;
    USER_DEFINE_ERROR2   EXCEPTION; 
    USER_DEFINE_ERROR3   EXCEPTION;
    
BEGIN
    -- 과정기간안에 날짜가 포함되지 않을 시 예외 발생
    SELECT START_DATE, END_DATE INTO OPC_STARTDATE, OPC_ENDDATE       
    FROM TBL_OP_COURSE
    WHERE OPC_CODE = V_OPC_CODE;
    
    IF (V_START_DATE < OPC_STARTDATE OR V_END_DATE > OPC_ENDDATE)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    
    SELECT NVL(MAX(OPS_CODE), 0) INTO V_OPS_MAX
    FROM TBL_OP_SUBJECT;
    
    -- 여러 컬럼을 가져오려면 커서가 필요한데 
    -- 한 컬럼만 여러 행을 가져올 때는 커서보다는 반복문이 나을 것 같음
    
    -- 입력하려는 과목의 시작날짜가 같은 과정, 다른 과목의 시작~종료 날짜 사이에 있거나 
    -- 입력하려는 과목의 종료날짜가 같은 과정, 다른 과목의 시작~종료 날짜 사이에 있으면 에러 발생
    LOOP
        SELECT START_DATE, END_DATE INTO V_S_DATE, V_E_DATE
        FROM TBL_OP_SUBJECT
        WHERE OPC_CODE = V_OPC_CODE AND OPS_CODE = V_OPS_CODE;
        
        IF((V_START_DATE BETWEEN V_S_DATE AND V_E_DATE) OR (V_END_DATE BETWEEN V_S_DATE AND V_E_DATE))
            THEN RAISE USER_DEFINE_ERROR;
        END IF;
        
        V_OPS_CODE := V_OPS_CODE + 1;
        
        EXIT WHEN V_OPS_CODE >= V_OPS_MAX;
        
    END LOOP;

    
    INSERT INTO TBL_OP_SUBJECT(OPS_CODE, SJ_CODE, OPC_CODE, P_CODE, B_CODE, AL_CODE, START_DATE, END_DATE)
    VALUES (SEQ_OPS_CODE.NEXTVAL, V_SJ_CODE, V_OPC_CODE, V_P_CODE, V_B_CODE,V_AL_CODE,V_START_DATE, V_END_DATE);
    
    -- 예외처리
    EXCEPTION
            WHEN USER_DEFINE_ERROR
                THEN RAISE_APPLICATION_ERROR(-20010,'입력한 날짜가 기존 과목 날짜와 겹칩니다 다시 시도하세요');    -- RAISE_APPLICATION_ERROR(-에러번호,'구문' )는 함수!
                     ROLLBACK;
            WHEN USER_DEFINE_ERROR2   
                THEN RAISE_APPLICATION_ERROR(-20011,'입력한 날짜가 기존 개설강좌 날짜 안에 유효하지 않습니다.');
                     ROLLBACK;
            WHEN OTHERS   --- IF ELSIF ELSE 구문에서 ELSE 느낌~ 
                THEN ROLLBACK;
     COMMIT;
END;
--==>> Procedure PRC_OP_SUBJECT_INSERT이(가) 컴파일되었습니다.
