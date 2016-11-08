CREATE TABLE LICENSE  ( --It Table Web
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
drop table LICENSE;

1) ���  
INSERT INTO LICENSE(lc_no, lc_title, lc_content, lc_good, lc_file1, lc_file2, lc_size2,
                         lc_cnt, lc_replycnt, lc_date, lc_grpno, lc_indent, lc_ansnum)
VALUES((SELECT NVL(MAX(lc_no), 0)+1 as lc_no FROM LICENSE),
         '�ٺ�������', '�����̴� �Ϳ���', 0, 'fall_m.jpg',  'fall.jpg', 0, 0, 0, sysdate, 0, 0, 0);
        
2) ��ȸ
select * from LICENSE;

3) ��ü ���(��� ����)
SELECT lc_no,
          lc_title, lc_content, lc_good, lc_file1, lc_file2, lc_size2, lc_cnt, lc_replycnt, lc_date, 
          lc_grpno, lc_indent, lc_ansnum
FROM LICENSE
ORDER BY lc_no asc;

4) ��ȸ
SELECT lc_no,
          lc_title, lc_content, lc_good, lc_file1, lc_file2, lc_size2, lc_cnt, lc_replycnt, lc_date,
          lc_grpno, lc_indent, lc_ansnum
FROM LICENSE
WHERE lc_no=1; 

5) ����
UPDATE LICENSE
SET lc_title='������', lc_content='�ٺ�������', lc_file1='fall_m.jpg', lc_file2='fall.jpg', lc_size2=1500
WHERE lc_no=1;

6) ���� 
DELETE FROM LICENSE
WHERE lc_no=1;


7) ���ο� �亯�� �ֽ����� ����ϱ����� ���� �亯�� �ڷ� �̷�ϴ�.
UPDATE LICENSE
SET lc_ansnum = lc_ansnum + 1
WHERE lc_no=1  AND lc_grpno=1  AND lc_ansnum > 1;

8) �亯 ���
INSERT INTO LICENSE(lc_no,
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
                  FROM LICENSE
                  WHERE lc_no=1
                  ORDER BY lc_grpno DESC, lc_ansnum ASC
         )
)
WHERE r >=1 AND r <= 3;
