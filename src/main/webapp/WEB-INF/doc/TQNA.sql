CREATE TABLE TQNA  ( --Table Q&A
  qa_no       NUMBER(7)     NOT NULL PRIMARY KEY, -- �� ��ȣ
  qa_title    VARCHAR2(120)  NOT NULL, -- ����
  qa_content  VARCHAR2(4000) NOT NULL, -- ����
  qa_good  NUMBER(7)  DEFAULT 0 NOT NULL,--��õ��
  qa_cnt        NUMBER(7)        DEFAULT 0       NOT NULL,--��ȸ��
  qa_date     DATE          NOT NULL       -- ��Ͻð�
);
drop table TQNA;

1) ���  
INSERT INTO TQNA(qa_no, qa_title, qa_content, qa_good,
                          qa_cnt, qa_date)
VALUES((SELECT NVL(MAX(qa_no), 0)+1 as qa_no FROM TQNA),
         '�ٺ�������', '�����̴� �Ϳ���', 0, 0, sysdate);
        
2) ��ȸ
select * from TQNA;

3) ��ü ���(��� ����)
SELECT qa_no,
          qa_title, qa_content, qa_good, qa_cnt, qa_date
FROM TQNA
ORDER BY qa_no DESC;

4) ��ȸ
SELECT qa_no,
          qa_title, qa_content, qa_good, qa_cnt, qa_date
FROM TQNA
WHERE qa_no=1; 

5) ����
UPDATE TQNA
SET qa_title='������', qa_content='�ٺ�������'
WHERE qa_no=1;

6) ���� 
DELETE FROM TQNA
WHERE qa_no=1;
