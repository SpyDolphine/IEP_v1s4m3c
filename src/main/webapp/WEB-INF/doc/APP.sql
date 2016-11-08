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