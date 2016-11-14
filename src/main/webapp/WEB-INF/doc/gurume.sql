1. ���̺� ����

drop table gurume

2. ���̺� ����

--gurume)����
CREATE TABLE gurume(
    gu_no                             NUMBER(7)      NOT NULL    PRIMARY KEY, -- �� ��ȣ
    gu_area                           VARCHAR2(40)   NOT NULL,                -- ����
    gu_menu                           VARCHAR2(40)   NOT NULL,                -- �޴� ����
    gu_title                          VARCHAR2(200)  NOT NULL,                -- ������&����
    gu_name                           VARCHAR2(100)  NOT NULL,
    gu_price                          VARCHAR2(100)  NOT NULL,                --���ݴ�
   -- me_no                             NUMBER(7)    NOT NULL ,               -- ȸ��
   --boardno                           NUMBER(7)     NOT NULL    PRIMARY KEY, -- �Խ��� ��ȣ
   --divisionno                        NUMBER(7)     NOT NULL ,               -- ī�װ���ȣ
    gu_cont                           VARCHAR2(4000) NOT NULL,                -- ����
    gu_cnt                            NUMBER(7)      DEFAULT 0,               -- ��ȸ��
    gu_stars                          NUMBER(7)      NOT NULL,                -- ����
    gu_date                           DATE           NOT NULL,                -- ��¥
    file1                             VARCHAR2(100)      NULL ,               -- Thumb ����
    file2                             VARCHAR2(50)       NULL ,               -- ���� 2
    size2                             NUMBER(9)          NULL DEFAULT 0,      -- ���� 2 ũ��
    gu_map                            VARCHAR2(4000)     NULL                 -- ����
    );
  --FOREIGN KEY (divisionno) REFERENCES division (divisionno), -- ī�װ���ȣ
  FOREIGN KEY (me_no) REFERENCES IEP_MEMBER (me_no)          --ȸ����ȣ

);

INSERT INTO gurume(gu_no, gu_area, gu_menu,gu_price, gu_title, gu_name, gu_cont, gu_cnt, gu_stars, gu_date, file1, file2,
size2, gu_map)  
VALUES((SELECT NVL(MAX(gu_no), 0) + 1 as gu_no FROM gurume),
            '����', '�ѽ�', '5000~10000��', '�������', '�վ���', '�ܸ�', 0, '��', sysdate, 'fall_m.jpg', 'fall.jpg',  0, 'map');

SELECT gu_no, gu_area, gu_menu, gu_title, gu_name, gu_cont, gu_cnt, gu_stars, gu_date , file1,file2,size2, gu_cnt
FROM gurume
ORDER BY gu_no ASC;
            
INSERT INTO gurume(gu_no, gu_area, gu_menu, gu_title, gu_name, gu_cont, gu_cnt, gu_stars, gu_date, file1,file2,
                   size2, gu_map)  
VALUES((SELECT NVL(MAX(gu_no), 0) + 1 as gu_no FROM gurume),
            '����', '�з�', '����', '�̸�,��', '����', 0, '��',sysdate, null,null ,null , null)            
            
INSERT INTO gurume(gu_no, 
       gu_area, gu_menu, gu_price, gu_title, gu_name, gu_cont, gu_stars, gu_date, file1, file2,
size2, gu_map)  
VALUES((SELECT NVL(MAX(gu_no), 0) + 1 as gu_no FROM gurume),
            '����', '�з�', '����', '�̸�,��', '����', 0, '��',sysdate, null,null ,null , null)            
            
select * from gurume

SELECT gu_no, gu_area, gu_menu, gu_title, gu_name, gu_stars, gu_cnt, gu_date, file1, file2, size2, r
    FROM(
       SELECT gu_no, gu_area, gu_menu, gu_title, gu_name, gu_stars, gu_cnt, file1, file2, size2, gu_date, rownum as r
       FROM(
            SELECT gu_no, gu_area, gu_menu, gu_title, gu_name, gu_stars, gu_cnt, file1, file2, size2, gu_date
            FROM gurume


                 WHERE gu_title LIKE '%' || '������' || '%' 

            ORDER BY gu_no DESC
       )
    )