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
   -- me_no                             NUMBER(7)    NOT NULL ,            -- ȸ��
   --boardno                           NUMBER(7)     NOT NULL        PRIMARY KEY, -- �Խ��� ��ȣ
   --divisionno                        NUMBER(7)     NOT NULL ,           -- ī�װ���ȣ
    gu_cont                           VARCHAR2(4000) NOT NULL,               -- ����
    gu_cnt                            NUMBER(7)      DEFAULT 0,              -- ��ȸ��
    gu_stars                          VARCHAR2(200)  NOT NULL,                         -- ����
    gu_date                           DATE           NOT NULL,               -- ��¥
    file1                             VARCHAR2(100)      NULL ,                       -- Thumb ����
    file2                             VARCHAR2(50)       NULL ,                       -- ���� 2
    size2                             NUMBER(9)       DEFAULT 0 NULL ,       -- ���� 2 ũ��
    gu_map                            VARCHAR2(500)      NULL                     -- ����
    );
  FOREIGN KEY (divisionno) REFERENCES division (divisionno), -- ī�װ���ȣ
  FOREIGN KEY (me_no) REFERENCES IEP_MEMBER (me_no)          --ȸ����ȣ

);

INSERT INTO gurume(gu_no, gu_area, gu_menu, gu_title, gu_name, gu_cont, gu_cnt, gu_stars, gu_date, file1, file2,
size2, gu_map)  
VALUES((SELECT NVL(MAX(gu_no), 0) + 1 as gu_no FROM gurume),
            '����', '�ѽ�', '�������', '�վ���', '�ܸ�', 0, '��', sysdate, 'fall_m.jpg', 'fall.jpg',  0, 'map');
INSERT INTO gurume(gu_no, gu_area, gu_menu, gu_title, gu_name, gu_cont, gu_cnt, gu_stars, gu_date, file1, file2,
size2, gu_map)  
VALUES((SELECT NVL(MAX(gu_no), 0) + 1 as gu_no FROM gurume),
            '����', '�ѽ�', '���� �������', '�վ���', '�ܸ�', 0, '��', sysdate, 'fall_m.jpg', 'fall.jpg',  0, 'map');
INSERT INTO gurume(gu_no, gu_area, gu_menu, gu_title, gu_name, gu_cont, gu_cnt, gu_stars, gu_date, file1, file2,
size2, gu_map)  
VALUES((SELECT NVL(MAX(gu_no), 0) + 1 as gu_no FROM gurume),
            '����', '�ѽ�', '���� �������', '�վ���', '�ܸ�', 0, '��', sysdate, 'fall_m.jpg', 'fall.jpg',  0, 'map');
INSERT INTO gurume(gu_no, gu_area, gu_menu, gu_title, gu_name, gu_cont, gu_cnt, gu_stars, gu_date, file1, file2,
size2, gu_map)  
VALUES((SELECT NVL(MAX(gu_no), 0) + 1 as gu_no FROM gurume),
            '����', '�ѽ�', '���� �������', '�վ���', '�ܸ�', 0, '��', sysdate, 'fall_m.jpg', 'fall.jpg',  0, 'map');
INSERT INTO gurume(gu_no, gu_area, gu_menu, gu_title, gu_name, gu_cont, gu_cnt, gu_stars, gu_date, file1, file2,
size2, gu_map)  
VALUES((SELECT NVL(MAX(gu_no), 0) + 1 as gu_no FROM gurume),
            '����', '�ѽ�', '���� �������', '�վ���', '�ܸ�', 0, '��', sysdate, 'fall_m.jpg', 'fall.jpg',  0, 'map');
            
SELECT gu_no, gu_area, gu_menu, gu_title, gu_name, gu_cont, gu_cnt, gu_stars, gu_date , gu_file1, gu_file2, gu_size2, gu_cnt
FROM gurume
ORDER BY gu_no ASC;
            
INSERT INTO gurume(gu_no, gu_area, gu_menu, gu_title, gu_name, gu_cont, gu_cnt, gu_stars, gu_date, file1,file2,
                   size2, gu_map)  
VALUES((SELECT NVL(MAX(gu_no), 0) + 1 as gu_no FROM gurume),
            '����', '�з�', '����', '�̸�,��', '����', 0, '��',sysdate, null,null ,null , null)            
            
drop table seico
--2)��� ���� �ı�
CREATE TABLE seico(
    sc_no                             NUMBER(7)        NOT NULL    PRIMARY KEY, --�� ��ȣ
    sc_area                            VARCHAR2(40)     NOT NULL,                --����
    sc_jobs                            VARCHAR2(40)     NOT NULL,                --����
    sc_title                           VARCHAR2(200)    NOT NULL,                --����
    sc_cont                            VARCHAR2(4000)   NOT NULL,                --����
    sc_cnt                             NUMBER(7)        DEFAULT 0    NOT NULL ,     --��ȸ��
    sc_like                            NUMBER(7)        DEFAULT 0     NULL ,     --���ƿ�
    --sc_heat                            NUMBER(7)            NULL,              --���ƿ� 100�� �̻� heat
    sc_date                            DATE             NOT NULL,                --��¥
    sc_file                            VARCHAR2(100)        NULL,                --����
    sc_size                            NUMBER(7)        DEFAULT 0                --���� ũ��
    );
  FOREIGN KEY (divisionno) REFERENCES division (divisionno), -- ī�װ���ȣ
  FOREIGN KEY (me_no) REFERENCES IEP_MEMBER (me_no)          --ȸ����ȣ
    
);
INSERT INTO seico(sc_no, sc_area, sc_jobs, sc_title, sc_name, sc_cont, sc_cnt, sc_like, sc_date, sc_file, sc_size )  
VALUES((SELECT NVL(MAX(sc_no), 0) + 1 as sc_no FROM seico),
            '����', 'SE', '�հ��ߴٴ�', '�ո���', '�ƽ�', 0, 0, sysdate, 'fall.jpg', 0 );