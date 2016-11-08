CREATE TABLE TQNA  ( --Table Q&A
  qa_no       NUMBER(7)     NOT NULL PRIMARY KEY, -- �� ��ȣ
  qa_title    VARCHAR2(120)  NOT NULL, -- ����
  qa_content  VARCHAR2(4000) NOT NULL, -- ����
  qa_good  NUMBER(7)  DEFAULT 0 NOT NULL,--��õ��
  qa_cnt        NUMBER(7)        DEFAULT 0       NOT NULL,--��ȸ��
  qa_replycnt  NUMBER(7)        DEFAULT 0       NOT NULL,--��ۼ�
  qa_date     DATE          NOT NULL,        -- ��Ͻð�
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