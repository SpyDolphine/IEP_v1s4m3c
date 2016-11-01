DROP TABLE ITOS;

----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE ITOS ( -- It Table Old Sell ���̺�
  io_no       NUMBER(7)     NOT NULL PRIMARY KEY, -- �� ��ȣ
  io_title       VARCHAR2(120)  NOT NULL, -- ����
  io_content  VARCHAR2(4000) NOT NULL, -- ����
  io_good  NUMBER(7)  DEFAULT 0 NOT NULL,--��õ��
  io_file1  VARCHAR2(100)        NULL ,--Thumb ����
  io_file2  VARCHAR2(500)        NULL ,--����2
  io_size2  NUMBER(9)        DEFAULT 0       NULL ,--����2ũ��
  io_cnt        NUMBER(7)        DEFAULT 0       NOT NULL,--��ȸ��
  io_replycnt  NUMBER(7)        DEFAULT 0       NOT NULL,--��ۼ�
  io_date     DATE          NOT NULL,        -- ��Ͻð�   
  io_cost     VARCHAR2(200) NOT NULL,-- �ݾ�
  io_grpno    NUMBER(2)       DEFAULT 0       NOT NULL,--�亯�׷�?����
  io_indent   NUMBER(2)        DEFAULT 0       NOT NULL,--�亯����
  io_ansnum NUMBER(5)        DEFAULT 0       NOT NULL--�亯����
);

  FOREIGN KEY (boardno) REFERENCES board(boardno),     -- ����Խ��� �⺻���� ����
  FOREIGN KEY (divisionno) REFERENCES division(divisionno) ,-- ī�װ� ��ȣ
  FOREIGN KEY (me_no) REFERENCES IEP_MEMBER(me_no)         -- ȸ����ȣ

1) ���  

INSERT INTO ITOS(io_no, io_title, io_content, io_good, io_file1, io_file2, io_size2,
                         io_cnt, io_replycnt, io_date, io_cost, io_grpno, io_indent, io_ansnum)
VALUES((SELECT NVL(MAX(io_no), 0)+1 as io_no FROM ITOS),
         '�ٺ�������', '�����̴� �Ϳ���', 0, 'fall_m.jpg',  'fall.jpg', 0, 0, 0, sysdate, '�ݾ�', 0, 0, 0);
        
2) ��ȸ
select * from ITOS;
 
3) ��ü ���(��� ����)
SELECT io_no,
           io_title, io_good, io_file1, io_file2, io_size2, io_cnt, io_replycnt, io_date, io_cost, 
           io_grpno, io_indent, io_ansnum
FROM ITOS
ORDER BY io_no desc;

4) ��ȸ
SELECT io_no,
           io_title, io_content, io_good, io_file1, io_file2, io_size2, io_cnt, io_replycnt, io_date,
           io_cost, io_indent, io_ansnum
FROM ITOS
WHERE io_no=1; 

5) ����
UPDATE ITOS
SET io_title='������', io_content='�ٺ�������', io_file1='fall_m.jpg', io_file2='fall.jpg', io_size2=1500
WHERE io_no=1;

6) ����
DELETE FROM ITOS
WHERE io_no=1;

7) ���ο� �亯�� �ֽ����� ����ϱ����� ���� �亯�� �ڷ� �̷�ϴ�.
UPDATE ITOS
SET io_ansnum = io_ansnum + 1
WHERE io_no=1  AND io_grpno=1  AND io_ansnum > 1;

8) �亯 ���
INSERT INTO ITOS(io_no,
                          io_title, io_content, io_good, io_file1, io_file2, io_size2, io_cnt, io_replycnt, io_date, 
                          io_cost, io_grpno, io_indent, io_ansnum)  
VALUES((SELECT NVL(MAX(io_no), 0)+1 as io_no FROM ITOS),
            '����', '����', 0, 'summer_m.jpg', 'summer.jpg', 0, 0, 0, sysdate,
            '�ݾ�', 1, 1, 1);
   
9) �亯�� ���� ���� ���� ���� 
SELECT io_no, io_title, io_content, io_good, 
           io_file1, io_file2, io_size2, io_cnt, io_replycnt, io_date, io_cost, io_grpno, io_indent, io_ansnum, r
FROM(
         SELECT io_no, io_title, io_content, io_good,
                    io_file1, io_file2, io_size2, io_cnt, io_replycnt, io_date, io_cost, io_indent, io_grpno, io_ansnum, rownum as r
         FROM(
                  SELECT io_no, io_title, io_content, io_good,
                             io_file1, io_file2, io_size2, io_cnt, io_replycnt, io_date, io_cost, io_grpno , io_indent, io_ansnum
                  FROM ITOS
                  WHERE io_no=1
                  ORDER BY io_grpno DESC, io_ansnum ASC
         )
)
WHERE r >=1 AND r <= 3;

----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE APP  ( -- It Table Application
  ap_no       NUMBER(7)     NOT NULL PRIMARY KEY, -- �� ��ȣ
  ap_title    VARCHAR2(120)  NOT NULL, -- ����
  ap_content  VARCHAR2(4000) NOT NULL, -- ����
  ap_good  NUMBER(7)  DEFAULT 0 NOT NULL,--��õ��
  ap_file1  VARCHAR2(100)        NULL ,--Thumb ����
  ap_file2  VARCHAR2(500)        NULL ,--����2
  ap_size2  NUMBER(9)        DEFAULT 0       NULL ,--����2ũ��
  ap_cnt        NUMBER(7)        DEFAULT 0       NOT NULL,--��ȸ��
  ap_replycnt  NUMBER(7)        DEFAULT 0       NOT NULL,--��ۼ�
  ap_date     DATE          NOT NULL,        -- ��Ͻð�  
  ap_grpno    NUMBER(2)       DEFAULT 0       NOT NULL,--�亯�׷�?�����ȥ��?
  ap_indent  NUMBER(2)        DEFAULT 0       NOT NULL,--�亯����
  ap_ansnum NUMBER(5)        DEFAULT 0       NOT NULL--�亯����
);

drop table app
1) ���  
INSERT INTO APP(ap_no, ap_title, ap_content, ap_good, ap_file1, ap_file2, ap_size2,
                         ap_cnt, ap_replycnt, ap_date, ap_grpno, ap_indent, ap_ansnum)
VALUES((SELECT NVL(MAX(ap_no), 0)+1 as ap_no FROM APP),
         '�ٺ�������', '�����̴� �Ϳ���', 0, 'fall_m.jpg',  'fall.jpg', 0, 0, 0, sysdate, 0, 0, 0);


2) ��ȸ
select * from APP;

3) ��ü ���(��� ����)
SELECT ap_no,
          ap_title, ap_content, ap_good, ap_file1, ap_file2, ap_size2, ap_cnt, ap_replycnt, ap_date, 
          ap_grpno, ap_indent, ap_ansnum
FROM APP
ORDER BY ap_no asc;

4) ��ȸ
SELECT ap_no,
          ap_title, ap_content, ap_good, ap_file1, ap_file2, ap_size2, ap_cnt, ap_replycnt, ap_date,
          ap_grpno, ap_indent, ap_ansnum
FROM APP
WHERE ap_no=1; 

5) ����
UPDATE APP
SET ap_title='������', ap_content='�ٺ�������', ap_file1='fall_m.jpg', ap_file2='fall.jpg', ap_size2=1500
WHERE ap_no=1;

6) ����
DELETE FROM APP
WHERE ap_no=1;

7) ���ο� �亯�� �ֽ����� ����ϱ����� ���� �亯�� �ڷ� �̷�ϴ�.
UPDATE APP
SET ap_ansnum = ap_ansnum + 1
WHERE ap_no=1  AND ap_grpno=1  AND ap_ansnum > 1;

8) �亯 ���
INSERT INTO APP(ap_no,
                          ap_title, ap_content, ap_good, ap_file1, ap_file2, ap_size2, ap_cnt, ap_replycnt, ap_date, 
                          ap_grpno, ap_indent, ap_ansnum)  
VALUES((SELECT NVL(MAX(ap_no), 0)+1 as ap_no FROM APP),
            '����', '����', 0, 'summer_m.jpg', 'summer.jpg', 0, 0, 0, sysdate,
            1, 1, 1);
   
9) �亯�� ���� ���� ���� ���� 
SELECT ap_no, ap_title, ap_content, ap_good, 
           ap_file1, ap_file2, ap_size2, ap_cnt, ap_replycnt, ap_date, ap_grpno, ap_indent, ap_ansnum, r
FROM(
         SELECT ap_no, ap_title, ap_content, ap_good,
                    ap_file1, ap_file2, ap_size2, ap_cnt, ap_replycnt, ap_date, ap_indent, ap_grpno, ap_ansnum, rownum as r
         FROM(
                  SELECT ap_no, ap_title, ap_content, ap_good,
                             ap_file1, ap_file2, ap_size2, ap_cnt, ap_replycnt, ap_date, ap_grpno , ap_indent, ap_ansnum
                  FROM APP
                  WHERE ap_no=1
                  ORDER BY ap_grpno DESC, ap_ansnum ASC
         )
)
WHERE r >=1 AND r <= 3;
----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE WEB  ( --It Table Web
  wb_no       NUMBER(7)     NOT NULL PRIMARY KEY, -- �� ��ȣ
  wb_title    VARCHAR2(120)  NOT NULL, -- ����
  wb_content  VARCHAR2(4000) NOT NULL, -- ����
  wb_good  NUMBER(7)  DEFAULT 0 NOT NULL,--��õ��
  wb_file1  VARCHAR2(100)        NULL ,--Thumb ����
  wb_file2  VARCHAR2(500)        NULL ,--����2
  wb_size2  NUMBER(9)        DEFAULT 0       NULL ,--����2ũ��
  wb_cnt        NUMBER(7)        DEFAULT 0       NOT NULL,--��ȸ��
  wb_replycnt  NUMBER(7)        DEFAULT 0       NOT NULL,--��ۼ�
  wb_date     DATE          NOT NULL,        -- ��Ͻð�   
  wb_grpno    NUMBER(2)       DEFAULT 0       NOT NULL,--�亯�׷�?�����ȥ��?
  wb_indent  NUMBER(2)        DEFAULT 0       NOT NULL,--�亯����
  wb_ansnum NUMBER(5)        DEFAULT 0       NOT NULL--�亯���� 
);
drop table WEB;
1) ���  
INSERT INTO WEB(wb_no, wb_title, wb_content, wb_good, wb_file1, wb_file2, wb_size2,
                         wb_cnt, wb_replycnt, wb_date, wb_grpno, wb_indent, wb_ansnum)
VALUES((SELECT NVL(MAX(wb_no), 0)+1 as wb_no FROM WEB),
         '�ٺ�������', '�����̴� �Ϳ���', 0, 'fall_m.jpg',  'fall.jpg', 0, 0, 0, sysdate, 0, 0, 0);
       
2) ��ȸ
select * from WEB;

3) ��ü ���(��� ����)
SELECT wb_no,
          wb_title, wb_content, wb_good, wb_file1, wb_file2, wb_size2, wb_cnt, wb_replycnt, wb_date, 
          wb_grpno, wb_indent, wb_ansnum
FROM WEB
ORDER BY wb_no asc;

4) ��ȸ
SELECT wb_no,
          wb_title, wb_content, wb_good, wb_file1, wb_file2, wb_size2, wb_cnt, wb_replycnt, wb_date,
          wb_grpno, wb_indent, wb_ansnum
FROM WEB
WHERE wb_no=1; 

5) ����
UPDATE WEB
SET wb_title='������', wb_content='�ٺ�������', wb_file1='fall_m.jpg', wb_file2='fall.jpg', wb_size2=1500
WHERE wb_no=1;

6) ���� 
DELETE FROM WEB
WHERE wb_no=1;


7) ���ο� �亯�� �ֽ����� ����ϱ����� ���� �亯�� �ڷ� �̷�ϴ�.
UPDATE WEB
SET wb_ansnum = wb_ansnum + 1
WHERE wb_no=1  AND wb_grpno=1  AND wb_ansnum > 1;

8) �亯 ���
INSERT INTO WEB(wb_no,
                          wb_title, wb_content, wb_good, wb_file1, wb_file2, wb_size2, wb_cnt, wb_replycnt, wb_date, 
                          wb_grpno, wb_indent, wb_ansnum)  
VALUES((SELECT NVL(MAX(wb_no), 0)+1 as wb_no FROM WEB),
            '����', '����', 0, 'summer_m.jpg', 'summer.jpg', 0, 0, 0, sysdate,
            1, 1, 1);
   
9) �亯�� ���� ���� ���� ���� 
SELECT wb_no, wb_title, wb_content, wb_good, 
           wb_file1, wb_file2, wb_size2, wb_cnt, wb_replycnt, wb_date, wb_grpno, wb_indent, wb_ansnum, r
FROM(
         SELECT wb_no, wb_title, wb_content, wb_good,
                    wb_file1, wb_file2, wb_size2, wb_cnt, wb_replycnt, wb_date, wb_indent, wb_grpno, wb_ansnum, rownum as r
         FROM(
                  SELECT wb_no, wb_title, wb_content, wb_good,
                             wb_file1, wb_file2, wb_size2, wb_cnt, wb_replycnt, wb_date, wb_grpno , wb_indent, wb_ansnum
                  FROM WEB
                  WHERE wb_no=1
                  ORDER BY wb_grpno DESC, wb_ansnum ASC
         )
)
WHERE r >=1 AND r <= 3;
----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE TQNA  ( --Table Q&A
  qa_no       NUMBER(7)     NOT NULL PRIMARY KEY, -- �� ��ȣ
  qa_title    VARCHAR2(120)  NOT NULL, -- ����
  qa_content  VARCHAR2(4000) NOT NULL, -- ����
  qa_good  NUMBER(7)  DEFAULT 0 NOT NULL,--��õ��
  qa_file1  VARCHAR2(100)        NULL ,--Thumb ����
  qa_file2  VARCHAR2(500)        NULL ,--����2
  qa_size2  NUMBER(9)        DEFAULT 0       NULL ,--����2ũ��
  qa_cnt        NUMBER(7)        DEFAULT 0       NOT NULL,--��ȸ��
  qa_replycnt  NUMBER(7)        DEFAULT 0       NOT NULL,--��ۼ�
  qa_date     DATE          NOT NULL,        -- ��Ͻð�   
  qa_grpno    NUMBER(2)       DEFAULT 0       NOT NULL,--�亯�׷�?�����ȥ��?
  qa_indent  NUMBER(2)        DEFAULT 0       NOT NULL,--�亯����
  qa_ansnum NUMBER(5)        DEFAULT 0       NOT NULL--�亯���� 
);
drop table TQNA;

1) ���  
INSERT INTO TQNA(qa_no, qa_title, qa_content, qa_good, qa_file1, qa_file2, qa_size2,
                          qa_cnt, qa_replycnt, qa_date, qa_grpno, qa_indent, qa_ansnum)
VALUES((SELECT NVL(MAX(qa_no), 0)+1 as qa_no FROM TQNA),
         '�ٺ�������', '�����̴� �Ϳ���', 0, 'fall_m.jpg',  'fall.jpg', 0, 0, 0, sysdate, 0, 0, 0);
        
2) ��ȸ
select * from TQNA;

3) ��ü ���(��� ����)
SELECT qa_no,
          qa_title, qa_content, qa_good, qa_file1, qa_file2, qa_size2, qa_cnt, qa_replycnt, qa_date, 
          qa_grpno, qa_indent, qa_ansnum
FROM TQNA
ORDER BY qa_no asc;

4) ��ȸ
SELECT qa_no,
          qa_title, qa_content, qa_good, qa_file1, qa_file2, qa_size2, qa_cnt, qa_replycnt, qa_date,
          qa_grpno, qa_indent, qa_ansnum
FROM TQNA
WHERE qa_no=1; 

5) ����
UPDATE TQNA
SET qa_title='������', qa_content='�ٺ�������', qa_file1='fall_m.jpg', qa_file2='fall.jpg', qa_size2=1500
WHERE qa_no=1;

6) ���� 
DELETE FROM TQNA
WHERE qa_no=1;


7) ���ο� �亯�� �ֽ����� ����ϱ����� ���� �亯�� �ڷ� �̷�ϴ�.
UPDATE TQNA
SET qa_ansnum = qa_ansnum + 1
WHERE qa_no=1  AND qa_grpno=1  AND qa_ansnum > 1;

8) �亯 ���
INSERT INTO TQNA(qa_no,
                          qa_title, qa_content, qa_good, qa_file1, qa_file2, qa_size2, qa_cnt, qa_replycnt, qa_date, 
                          qa_grpno, qa_indent, qa_ansnum)  
VALUES((SELECT NVL(MAX(qa_no), 0)+1 as qa_no FROM TQNA),
            '����', '����', 0, 'summer_m.jpg', 'summer.jpg', 0, 0, 0, sysdate,
            1, 1, 1);
   
9) �亯�� ���� ���� ���� ���� 
SELECT qa_no, qa_title, qa_content, qa_good, 
           qa_file1, qa_file2, qa_size2, qa_cnt, qa_replycnt, qa_date, qa_grpno, qa_indent, qa_ansnum, r
FROM(
         SELECT qa_no, qa_title, qa_content, qa_good,
                    qa_file1, qa_file2, qa_size2, qa_cnt, qa_replycnt, qa_date, qa_indent, qa_grpno, qa_ansnum, rownum as r
         FROM(
                  SELECT qa_no, qa_title, qa_content, qa_good,
                             qa_file1, qa_file2, qa_size2, qa_cnt, qa_replycnt, qa_date, qa_grpno , qa_indent, qa_ansnum
                  FROM TQNA
                  WHERE qa_no=1
                  ORDER BY qa_grpno DESC, qa_ansnum ASC
         )
)
WHERE r >=1 AND r <= 3;

----------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE license  ( --It Table Web
  lc_no       NUMBER(7)     NOT NULL PRIMARY KEY, -- �� ��ȣ
  lc_title    VARCHAR2(120)  NOT NULL, -- ����
  lc_content  VARCHAR2(4000) NOT NULL, -- ����
  lc_good  NUMBER(7)  DEFAULT 0 NOT NULL,--��õ��
  lc_file1  VARCHAR2(100)        NULL ,--Thumb ����
  lc_file2  VARCHAR2(500)        NULL ,--����2
  lc_size2  NUMBER(9)        DEFAULT 0       NULL ,--����2ũ��
  lc_cnt        NUMBER(7)        DEFAULT 0       NOT NULL,--��ȸ��
  lc_replycnt  NUMBER(7)        DEFAULT 0       NOT NULL,--��ۼ�
  lc_date     DATE          NOT NULL,        -- ��Ͻð�
  lc_grpno    NUMBER(2)       DEFAULT 0       NOT NULL,--�亯�׷�?����   
  lc_indent  NUMBER(2)        DEFAULT 0       NOT NULL,--�亯����
  lc_ansnum NUMBER(5)        DEFAULT 0       NOT NULL--�亯���� 
);
drop table license;

1) ���  
INSERT INTO license(lc_no, lc_title, lc_content, lc_good, lc_file1, lc_file2, lc_size2,
                         lc_cnt, lc_replycnt, lc_date, lc_grpno, lc_indent, lc_ansnum)
VALUES((SELECT NVL(MAX(lc_no), 0)+1 as lc_no FROM license),
         '�ٺ�������', '�����̴� �Ϳ���', 0, 'fall_m.jpg',  'fall.jpg', 0, 0, 0, sysdate, 0, 0, 0);
        
2) ��ȸ
select * from license;

3) ��ü ���(��� ����)
SELECT lc_no,
          lc_title, lc_content, lc_good, lc_file1, lc_file2, lc_size2, lc_cnt, lc_replycnt, lc_date, 
          lc_grpno, lc_indent, lc_ansnum
FROM license
ORDER BY lc_no asc;

4) ��ȸ
SELECT lc_no,
          lc_title, lc_content, lc_good, lc_file1, lc_file2, lc_size2, lc_cnt, lc_replycnt, lc_date,
          lc_grpno, lc_indent, lc_ansnum
FROM license
WHERE lc_no=1; 

5) ����
UPDATE license
SET lc_title='������', lc_content='�ٺ�������', lc_file1='fall_m.jpg', lc_file2='fall.jpg', lc_size2=1500
WHERE lc_no=1;

6) ���� 
DELETE FROM license
WHERE lc_no=1;


7) ���ο� �亯�� �ֽ����� ����ϱ����� ���� �亯�� �ڷ� �̷�ϴ�.
UPDATE license
SET lc_ansnum = lc_ansnum + 1
WHERE lc_no=1  AND lc_grpno=1  AND lc_ansnum > 1;

8) �亯 ���
INSERT INTO license(lc_no,
                          lc_title, lc_content, lc_good, lc_file1, lc_file2, lc_size2, lc_cnt, lc_replycnt, lc_date, 
                          lc_grpno, lc_indent, lc_ansnum)  
VALUES((SELECT NVL(MAX(lc_no), 0)+1 as lc_no FROM license),
            '����', '����', 0, 'summer_m.jpg', 'summer.jpg', 0, 0, 0, sysdate,
            1, 1, 1);
   
9) �亯�� ���� ���� ���� ���� 
SELECT lc_no, lc_title, lc_content, lc_good, 
           lc_file1, lc_file2, lc_size2, lc_cnt, lc_replycnt, lc_date, lc_grpno, lc_indent, lc_ansnum, r
FROM(
         SELECT lc_no, lc_title, lc_content, lc_good,
                    lc_file1, lc_file2, lc_size2, lc_cnt, lc_replycnt, lc_date, lc_indent, lc_grpno, lc_ansnum, rownum as r
         FROM(
                  SELECT lc_no, lc_title, lc_content, lc_good,
                             lc_file1, lc_file2, lc_size2, lc_cnt, lc_replycnt, lc_date, lc_grpno , lc_indent, lc_ansnum
                  FROM license
                  WHERE lc_no=1
                  ORDER BY lc_grpno DESC, lc_ansnum ASC
         )
)
WHERE r >=1 AND r <= 3;
