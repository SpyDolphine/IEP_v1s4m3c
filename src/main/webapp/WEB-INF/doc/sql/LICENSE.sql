CREATE TABLE LICENSE  ( --LICENSE
  lc_no       NUMBER(7)     NOT NULL PRIMARY KEY, -- �� ��ȣ
  lc_title    VARCHAR2(120)  NOT NULL, -- ����
  lc_content  VARCHAR2(4000) NOT NULL, -- ����
  lc_file1    VARCHAR2(100)        NULL ,--Thumb ����
  lc_file2    VARCHAR2(500)        NULL ,--����2
  lc_size2    NUMBER(9) DEFAULT 0       NULL ,--����2ũ��
  lc_date     DATE          NOT NULL,        -- ��Ͻð�
  lc_date1    VARCHAR2(30)  NULL,        -- ������
  lc_date2    VARCHAR2(30)  NULL,        -- ������
  lc_date3    VARCHAR2(30)  NULL,        -- ���賯
  lc_date4    VARCHAR2(30)  NULL         -- ��ǥ��
);
drop table LICENSE;

1) ���  
INSERT INTO LICENSE(lc_no, lc_title, lc_content, lc_file1, lc_file2, lc_size2,
                    lc_date, lc_date1, lc_date2, lc_date3, lc_date4)
VALUES((SELECT NVL(MAX(lc_no), 0)+1 as lc_no FROM LICENSE),
         '�ڰ���', '�ڰ��� ����', 'fall_m.jpg',  'fall.jpg', 0, sysdate, '2016-11-10', '2016-11-15', '2016-11-17', '2016-11-18');
        
2) ��ȸ
select * from LICENSE;

3) ��ü ���
SELECT lc_no,
          lc_title, lc_file1, lc_file2, lc_date,
          lc_date1, lc_date2, lc_date3, lc_date4      
FROM LICENSE
ORDER BY lc_no DESC;

4) ��ȸ
SELECT lc_no,
          lc_title, lc_content, lc_file1, lc_file2, lc_size2, lc_date,
          lc_date1, lc_date2, lc_date3, lc_date4
FROM LICENSE
WHERE lc_no=1; 

5) ����
UPDATE LICENSE
SET lc_title='����ó�����', lc_content='����ó����� �ʱ� �Ǳ� ���', lc_file1='fall_m.jpg', lc_file2='fall.jpg', lc_size2=1500,
    lc_date1='2016-1-1', lc_date2='2016-1-1', lc_date3='2016-1-1', lc_date4='2016-1-1'
WHERE lc_no=1;

6) ���� 
DELETE FROM LICENSE
WHERE lc_no=1;
