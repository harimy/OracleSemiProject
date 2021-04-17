CREATE OR REPLACE PROCEDURE PRC_SCORE_INSERT
( V_SG_CODE             IN TBL_SUGANG.SG_CODE%TYPE
, V_OPS_CODE            IN TBL_OP_SUBJECT.OPS_CODE%TYPE
, V_A_SCORE             IN TBL_SCORE.A_SCORE%TYPE
, V_W_SCORE             IN TBL_SCORE.W_SCORE%TYPE
, V_P_SCORE             IN TBL_SCORE.P_SCORE%TYPE
)
IS
    V_A_ALLOT            TBL_ALLOT.A_ALLOT%TYPE;
    V_W_ALLOT            TBL_ALLOT.W_ALLOT%TYPE;
    V_P_ALLOT            TBL_ALLOT.P_ALLOT%TYPE;

    V_OPC_CODE           TBL_OP_COURSE.OPC_CODE%TYPE;
    V_AL_CODE            TBL_ALLOT.AL_CODE%TYPE;
    V_D_CODE             TBL_DROP.D_CODE%TYPE;
    
    -- 사용자 정의 예외에 대한 변수 선언
    USER_DEFINE_ERROR   EXCEPTION;
    USER_DEFINE_ERROR2  EXCEPTION;
BEGIN
    
    -- 수강코드와 개설과목 코드를 이용하여 배점 코드 및 각 배점들 뽑아냄
    SELECT A.AL_CODE, A.A_ALLOT, A.W_ALLOT, A.P_ALLOT INTO V_AL_CODE, V_A_ALLOT, V_W_ALLOT, V_P_ALLOT
    FROM TBL_SUGANG SG, TBL_OP_COURSE OPC, TBL_OP_SUBJECT OPS, TBL_ALLOT A
    WHERE SG.SG_CODE = V_SG_CODE
      AND OPS.OPS_CODE = V_OPS_CODE
      AND SG.OPC_CODE = OPC.OPC_CODE(+)
      AND OPC.OPC_CODE = OPS.OPC_CODE(+)
      AND OPS.AL_CODE = A.AL_CODE(+);
      
    -- 성적이 배점보다 크면 예외 발생
    IF ( V_A_SCORE > V_A_ALLOT OR V_W_SCORE > V_W_ALLOT OR V_P_SCORE > V_P_ALLOT )
        THEN RAISE USER_DEFINE_ERROR;
    END IF;
    
    /*
    -- 중도 탈락 여부 확인
    SELECT NVL(D_CODE, 0) INTO V_D_CODE
    FROM TBL_DROP
    WHERE SG_CODE = V_SG_CODE;
    
    -- 중도 탈락 코드가 있으면(0이 아니면) 성적 입력 할 수 없도록 예외 발생
    IF(V_D_CODE != 0)
        THEN RAISE USER_DEFINE_ERROR2;
    END IF;
    */
    --> 중도탈락 입력 -> 성적이 필요해요 
    --> 성적 입력할 때 -> 중도탈락여부 확인... 

    -- 데이터 입력
    INSERT INTO TBL_SCORE(SC_CODE, SG_CODE, OPS_CODE, A_SCORE, W_SCORE, P_SCORE)
    VALUES(SEQ_SCORE.NEXTVAL, V_SG_CODE, V_OPS_CODE, V_A_SCORE, V_W_SCORE, V_P_SCORE);

    -- 커밋
    COMMIT;
    
    -- 예외처리
    EXCEPTION
       WHEN USER_DEFINE_ERROR
            THEN RAISE_APPLICATION_ERROR(-20013, '점수는 배점을 초과할 수 없습니다. ');
                 ROLLBACK;
       --WHEN USER_DEFINE_ERROR2
       --     THEN RAISE_APPLICATION_ERROR(-20016, '이미 중도탈락된 학생입니다.');
       WHEN no_data_found
            THEN DBMS_OUTPUT.PUT_LINE('수강코드 또는 개설과목코드를 잘못 입력하셨습니다. 다시 한 번 확인해주세요.');
                 ROLLBACK;
       WHEN OTHERS
            THEN DBMS_OUTPUT.PUT_LINE('예외처리 되지 않은 에러 발생');
                 ROLLBACK;
END;
--==>> Procedure PRC_SCORE_INSERT이(가) 컴파일되었습니다.