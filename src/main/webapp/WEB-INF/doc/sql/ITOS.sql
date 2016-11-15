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
                  ORDER BY io_grpno DESC, io_ansnum ASC
         )
)
WHERE r >=1 AND r <= 3;
