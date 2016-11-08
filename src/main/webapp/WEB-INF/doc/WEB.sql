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