CREATE TABLE STUDY  ( --It Table Web
  sy_no    NUMBER(7)                 NOT NULL PRIMARY KEY, -- �� ��ȣ
  title       VARCHAR2(120)          NOT NULL, -- ����
  content  VARCHAR2(4000)         NOT NULL, -- ����
  file1      VARCHAR2(100)                 NULL ,--Thumb ����
  file2       VARCHAR2(500)                NULL ,--����2
  size2      NUMBER(9)  DEFAULT 0      NULL ,--����2ũ��
  cnt        NUMBER(7)  DEFAULT 0 NOT NULL,--��ȸ��
  sy_date    DATE                        NOT NULL,-- �Խù� ��Ͻð�   
  gate       VARCHAR2(10)           NOT NULL-- APP(AC,AP,AJ),WEB(WJ,WC,WH)
);
drop table STUDY;
1) ���  
INSERT INTO STUDY(sy_no, title, content, file1, file2, size2,
                            cnt, sy_date, gate)
VALUES((SELECT NVL(MAX(sy_no), 0)+1 as sy_no FROM STUDY),
         '����', '������ �غ��ƿ�', 'fall_m.jpg', 'fall.jpg', 0, 0, sysdate, 'WJ');
       
2) ��ȸ()
select * from STUDY;

3) ��ü ���(list)
  SELECT sy_no, title, gate, sy_date, cnt 
  FROM STUDY 
  WHERE gate = gate;

4) ��ȸ(read)
SELECT sy_no,
          title, content, file1, file2, size2, cnt, sy_date, gate
FROM STUDY
WHERE sy_no=1; 

5) ����
UPDATE STUDY
SET title='JAVA', content='JAVA ù����', file1='fall_m.jpg', file2='fall.jpg', size2=1500
WHERE sy_no=1;

6) ���� 
DELETE FROM STUDY
WHERE sy_no=1;

     SELECT sy_no, title, content, sy_date, gate , r
  FROM (
            SELECT sy_no, title, content, sy_date, gate , rownum as r
            FROM (
                      SELECT sy_no, title, content, sy_date, gate
                      FROM STUDY
                      ORDER BY sy_no DESC
                      )
  )
  WHERE r =1 AND r<= 3 AND gate='WJ'
  
