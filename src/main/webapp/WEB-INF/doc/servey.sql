CREATE TABLE serveyboard( -- 게시판
  sb_no        NUMBER(7)        NOT NULL, -- 게시판 번호
  title        VARCHAR2(200)    NOT NULL,                    -- 게시판 이름
  content      VARCHAR2(4000)   NOT NULL,                    -- 게시판 내용
  rdate        DATE             NOT NULL,                    -- 등록일
  PRIMARY KEY(sb_no) 
);

CREATE TABLE servey( -- 설문조사
  serveyno    NUMBER(7)     NOT NULL,    --설문조사 번호
  sb_no       NUMBER(7)     NOT NULL,    --게시판 번호
  item        VARCHAR2(200) NOT NULL,    --설문조사 항목
  cnt         NUMBER(7)     DEFAULT 0,   --설문조사 카운트
  aver        NUMBER(3)     DEFAULT 0,   --평균수치
  FOREIGN KEY (sb_no) REFERENCES serveyboard (sb_no) ON DELETE CASCADE, -- 보드 넘버
  PRIMARY KEY(serveyno)
);

select * from servey
ALTER TABLE servey ADD
(
    CONSTRAINT sb_no
    FOREIGN KEY ( serveyno )
        REFERENCES 댓글TABLE ( NUM )
    ON DELETE CASCADE
);




DELETE FROM serveyboard WHERE sb_no=1
DELETE serveyboard WHERE sb_no=1 [CASCADE]

drop table servey;
drop table serveyboard;
select * from servey
select * from serveyboard

INSERT INTO serveyboard(sb_no, title, content, rdate) 
  VALUES ((SELECT NVL(MAX(sb_no), 0) + 1 as sb_no FROM serveyboard), '설문조사1', '내용', sysdate);
  
INSERT INTO servey(serveyno, sb_no, item) 
  VALUES ((SELECT NVL(MAX(serveyno), 0) + 1 as serveyno FROM servey), 1, '설문조사 항목 1');
  
INSERT INTO servey(serveyno, sb_no, item)  
  VALUES ((SELECT NVL(MAX(serveyno), 0) + 1 as serveyno FROM servey), 1, '설문조사 항목 2');
  
INSERT INTO servey(serveyno, sb_no, item) 
  VALUES ((SELECT NVL(MAX(serveyno), 0) + 1 as serveyno FROM servey), 1, '설문조사 항목 3');
  
UPDATE servey
SET aver
WHERE serveyno=1 AND sb_no = 1;

    UPDATE serveyboard 
    SET title='제목이라요', content='내용이라요'
    WHERE sb_no=1

-- 전체 합
select sum(cnt) from servey where sb_no = 3

-- 백분율 계산
select item, cnt,  
  round((ratio_to_report(cnt) over () * 100.00), 2) as avg 
FROM servey
where sb_no = 3 









