/**********************************/
/* Table Name: ä������ */
/**********************************/



DROP TABLE blogcategory;
DROP TABLE code; 

DROP TABLE board;
DROP TABLE division;
DROP TABLE category;
DROP TABLE IEP_MEMBER;
DROP TABLE employment_info;

CREATE TABLE employment_info(
    -- boardno                        NUMBER(7)        NOT NULL      PRIMARY KEY,      -- �Խ��� ��ȣ
    -- boardno                           NUMBER(7)        NOT NULL,                       -- �Խ��� ��ȣ
    -- divisionno                        NUMBER(7)        NOT NULL,                       -- ī�װ���ȣ
    -- ei_no                          NUMBER(7)        NOT NULL       PRIMARY KEY,     -- ������� ��ȣ
    -- ei_no                             NUMBER(7)        NOT NULL,                       -- ������� ��ȣ
    -- em_no                          NUMBER(7)        NOT NULL       PRIMARY KEY,     -- ä������ ��ȣ
    em_no                             NUMBER(7)        NOT NULL,                       -- ä������ ��ȣ   
    em_title                          VARCHAR2(120)    NOT NULL,                       -- ä�� ����
    -- em_content                        VARCHAR2(4000)   NOT NULL,                       -- ä�� ����                 
    -- em_mainbusiness                   VARCHAR2(1000)   NOT NULL,                       -- �ֿ� ����
    em_cof                            VARCHAR2(1000)   NOT NULL,                       -- �ڰ� ��� (�ٻ� ���� ����)
    em_pi                             VARCHAR2(1000)   NOT NULL,                       -- �ڰ� ��� (������)
    em_rp                             VARCHAR2(1000)   NOT NULL,                       -- ä������
    em_howtoapply                     VARCHAR2(1000)   NOT NULL,                       -- ä������ (�������)
    em_occupations                    VARCHAR2(30)     NOT NULL,                       -- ������(����)
    em_et                             VARCHAR2(30)     NOT NULL,                       -- ������(�������)
    em_lastschool                     VARCHAR2(30)     NOT NULL,                       -- ������(�����з�)
    em_salary                         VARCHAR2(30)     NOT NULL,                       -- ������(�޿�)
    em_rank                           VARCHAR2(30)     NOT NULL,                       -- ������(����)
    em_position                       VARCHAR2(30)     NOT NULL,                       -- ������(��å)
    em_url                            VARCHAR2(500)        NULL,                       -- ��Ÿ (Ȩ������ ä�� URL)
    em_workplace                      VARCHAR2(1000)   NOT NULL,                       -- ��Ÿ (�ٹ���)
    em_startdate                      VARCHAR2(16)         NULL,                       -- ä�� ���� ������
    -- em_deadline                       VARCHAR2(1000)   NOT NULL,                    -- ä�� ���� ������                   
    em_enddate                        VARCHAR2(16)         NULL,                       -- ä�� ���� ������
    em_statedate                      VARCHAR2(16)         NULL,                       -- ä�� ���� ��ǥ��
    em_interviewdate                  VARCHAR2(16)         NULL,                       -- ä�� ���� ����
    em_supportformfile1               VARCHAR2(100)        NULL,                       -- ������� ���ϸ� 1
    em_supportformsize1               NUMBER(8)        DEFAULT 0     NULL,             -- ������� ũ�� 1
    em_cnt                            NUMBER(7)        DEFAULT 0     NOT NULL,         -- ��ȸ��
    em_date                           DATE             NOT NULL,                       -- ��ϳ�¥
    -- me_no                             NUMBER(7)        NOT NULL,                       -- ȸ�� ��ȣ
    ei_no                             NUMBER(7)        NOT NULL,                       -- ������� ��ȣ
    PRIMARY KEY (em_no),                                                                -- ä������ ��ȣ PRIMARY KEY
--   FOREIGN KEY (boardno)    REFERENCES board (boardno),                              -- �����ȣ, �⺻�Խ��� ����
    -- FOREIGN KEY (divisionno) REFERENCES division (divisionno),                         -- ī�װ���ȣ
    FOREIGN KEY (ei_no)      REFERENCES enterprise_info (ei_no)                       -- ������� FOREIGN KEY
    -- FOREIGN KEY (me_no)      REFERENCES IEP_MEMBER (me_no)                             -- ȸ������ FOREIGN KEY
);


-- ä������ ���

INSERT INTO employment_info (em_no, ei_no, em_title, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, em_et, 
                             em_lastschool, em_salary, em_rank, em_position, em_url, em_workplace, em_startdate, em_enddate, 
                             em_statedate, em_interviewdate, em_supportformfile1, em_supportformsize1, em_cnt, em_date)
VALUES((SELECT NVL(MAX(em_no), 0)+1 as em_no FROM employment_info), 1, '��������(JSP) ä�����(����/���)',  
        '- 4���� ��ǻ��/����/����/���� �迭 �������� ����(����)�� - C, C++ ���� ������ - �ؿܿ��࿡ ��ݻ����� ���� ��', 
        '- Linux, Mobile Platform, iOS, Android, Windows ���α׷� ���� ���� - ������/�ȵ���̵� Ŀ�� ����̹� ���� ������ 
         - �ܱ��� ������ ��� - �������� ����� �� ������� ���� ���ɿ� �ǰ� ���', '- �����ɻ� > ��,�����˻�/�ʱ����� > �������� > 
        �հ��� ��ǥ ** ���������� �ʱ����� �ǽ�', 'ä����� �� �����ϱ⸦ ���� ä��Ȩ������ �̵� �� �Ի� ����', '����Ʈ������Ͼ�', 
        '������',  '���б����� (4��) ����', 'ȸ�系�Կ� ����', '���-����', '����', 'www.selvashealthcare.com', 
        '���������� ������ ������ 174 (042-864-4460(213)', '2016-05-17 09:30', '2016-11-17 18:30', '2016-11-17 18:30', 
        '2016-11-17 18:30', 'recruit.doc', '10000', 0, sysdate);




INSERT INTO employment_info (em_no, ei_no, em_title, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, em_et, 
                             em_lastschool, em_salary, em_rank, em_position, em_url, em_workplace, em_startdate, em_enddate, 
                             em_statedate, em_interviewdate, em_supportformfile1, em_supportformsize1, em_cnt, em_date)
VALUES((SELECT NVL(MAX(em_no), 0)+1 as em_no FROM employment_info), 1, '��������(JSP) ä�����(����/���)',  
        '- 4���� ��ǻ��/����/����/���� �迭 �������� ����(����)�� - C, C++ ���� ������ - �ؿܿ��࿡ ��ݻ����� ���� ��', 
        '- Linux, Mobile Platform, iOS, Android, Windows ���α׷� ���� ���� - ������/�ȵ���̵� Ŀ�� ����̹� ���� ������ 
         - �ܱ��� ������ ��� - �������� ����� �� ������� ���� ���ɿ� �ǰ� ���', '- �����ɻ� > ��,�����˻�/�ʱ����� > �������� > 
        �հ��� ��ǥ ** ���������� �ʱ����� �ǽ�', 'ä����� �� �����ϱ⸦ ���� ä��Ȩ������ �̵� �� �Ի� ����', '����Ʈ������Ͼ�', 
        '������',  '���б����� (4��) ����', 'ȸ�系�Կ� ����', '���-����', '����', 'www.selvashealthcare.com', 
        '���������� ������ ������ 174 (042-864-4460(213)', '2016-05-17 09:30', '2016-11-17 18:30', '2016-11-17 18:30', 
        '2016-11-17 18:30', 'recruit.doc', '10000', 0, sysdate);
        

INSERT INTO employment_info (em_no, me_no, ei_no, em_title, em_mainbusiness, em_cof, em_pi, em_rp, em_howtoapply, 
                             em_occupations, em_et, em_lastschool, em_salary, em_rank, em_position, em_url, em_workplace, 
                             em_startdate, em_enddate, em_statedate, em_interviewdate, em_supportformfile1, 
                             em_supportformsize1, em_cnt, em_date)
VALUES((SELECT NVL(MAX(em_no), 0)+1 as em_no FROM employment_info), 1, 1, '��������(JSP) ä�����(����/���)', 
        '�ｺ�ɾ���ǰ(�������б��, �Ƿ����ܱ��)SW ���� �� ����', 
        '- 4���� ��ǻ��/����/����/���� �迭 �������� ����(����)�� - C, C++ ���� ������ - �ؿܿ��࿡ ��ݻ����� ���� ��', 
        '- Linux, Mobile Platform, iOS, Android, Windows ���α׷� ���� ���� - ������/�ȵ���̵� Ŀ�� ����̹� ���� ������ 
         - �ܱ��� ������ ��� - �������� ����� �� ������� ���� ���ɿ� �ǰ� ���', '- �����ɻ� > ��,�����˻�/�ʱ����� > �������� > 
        �հ��� ��ǥ ** ���������� �ʱ����� �ǽ�', 'ä����� �� �����ϱ⸦ ���� ä��Ȩ������ �̵� �� �Ի� ����', '����Ʈ������Ͼ�', 
        '������',  '���б����� (4��) ����', 'ȸ�系�Կ� ����', '���-����', '����', 'www.selvashealthcare.com', 
        '���������� ������ ������ 174 (042-864-4460(213)', '2016-05-17 09:30', '2016-11-17 18:30', '2016-11-17 18:30', 
        '2016-11-17 18:30', 'recruit.doc', '10000', 0, sysdate);


INSERT INTO employment_info (em_no, me_no, ei_no, em_mainbusiness, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, 
                             em_et, em_lastschool, em_salary, em_rank, em_position, em_url, em_workplace, em_startdate, 
                             em_enddate, em_statedate, em_interviewdate, em_supportformfile1, em_supportformsize1, 
                             em_cnt, em_date)
VALUES((SELECT NVL(MAX(em_no), 0)+1 as em_no FROM employment_info), 1, 1, '�ｺ�ɾ���ǰ(�������б��, �Ƿ����ܱ��)SW ���� �� ����', 
        '- 4���� ��ǻ��/����/����/���� �迭 �������� ����(����)�� - C, C++ ���� ������ - �ؿܿ��࿡ ��ݻ����� ���� ��', 
        '- Linux, Mobile Platform, iOS, Android, Windows ���α׷� ���� ���� - ������/�ȵ���̵� Ŀ�� ����̹� ���� ������ 
         - �ܱ��� ������ ��� - �������� ����� �� ������� ���� ���ɿ� �ǰ� ���', '- �����ɻ� > ��,�����˻�/�ʱ����� > �������� > 
        �հ��� ��ǥ ** ���������� �ʱ����� �ǽ�', 'ä����� �� �����ϱ⸦ ���� ä��Ȩ������ �̵� �� �Ի� ����', '����Ʈ������Ͼ�', 
        '������',  '���б����� (4��) ����', 'ȸ�系�Կ� ����', '���-����', '����', 'www.selvashealthcare.com', 
        '���������� ������ ������ 174 (042-864-4460(213)', '2016.10.31 09:00', '2016.11.13 24:00', 'recruit.doc', '10000', 0, sysdate);


INSERT INTO employment_info (em_no, me_no, ei_no, em_mainbusiness, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, 
                             em_et, em_lastschool, em_salary, em_rank, em_position, 
                             em_url, em_workplace, em_startdate, em_deadline, em_supportformfile1, em_supportformsize1, 
                             em_cnt, em_date)
VALUES((SELECT NVL(MAX(em_no), 0)+1 as em_no FROM employment_info), 1, 1, '�ｺ�ɾ���ǰ(�������б��, �Ƿ����ܱ��)SW ���� �� ����', 
        '- 4���� ��ǻ��/����/����/���� �迭 �������� ����(����)�� - C, C++ ���� ������ - �ؿܿ��࿡ ��ݻ����� ���� ��', 
        '- Linux, Mobile Platform, iOS, Android, Windows ���α׷� ���� ���� - ������/�ȵ���̵� Ŀ�� ����̹� ���� ������ 
         - �ܱ��� ������ ��� - �������� ����� �� ������� ���� ���ɿ� �ǰ� ���', '- �����ɻ� > ��,�����˻�/�ʱ����� > �������� > 
        �հ��� ��ǥ ** ���������� �ʱ����� �ǽ�', 'ä����� �� �����ϱ⸦ ���� ä��Ȩ������ �̵� �� �Ի� ����', '����Ʈ������Ͼ�', 
        '������',  '���б����� (4��) ����', 'ȸ�系�Կ� ����', '���-����', '����', 'www.selvashealthcare.com', 
        '���������� ������ ������ 174 (042-864-4460(213)', '2016.10.31 09:00', '2016.11.13 24:00', 'recruit.doc', '10000', 0, sysdate);
        
        

INSERT INTO employment_info (em_no, me_no, ei_no, em_mainbusiness, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, 
                             em_et, em_lastschool, em_salary, em_rank, em_position, 
                             em_url, em_workplace, em_startdate, em_deadline, em_supportformfile1, em_supportformsize1, em_cnt, 
                             em_date)
VALUES((SELECT NVL(MAX(em_no), 0)+1 as em_no FROM employment_info), 1, 1, '�ｺ�ɾ���ǰ(�������б��, �Ƿ����ܱ��)SW ���� �� ����', 
        '- 4���� ��ǻ��/����/����/���� �迭 �������� ����(����)�� - C, C++ ���� ������ - �ؿܿ��࿡ ��ݻ����� ���� ��', 
        '- Linux, Mobile Platform, iOS, Android, Windows ���α׷� ���� ���� - ������/�ȵ���̵� Ŀ�� ����̹� ���� ������ 
         - �ܱ��� ������ ��� - �������� ����� �� ������� ���� ���ɿ� �ǰ� ���', '- �����ɻ� > ��,�����˻�/�ʱ����� > �������� > 
        �հ��� ��ǥ ** ���������� �ʱ����� �ǽ� ', 'ä����� �� '�����ϱ�'�� ���� ä��Ȩ������ �̵� �� �Ի� ����', '����Ʈ������Ͼ�', 
        '������',  '���б����� (4��) ����', 'ȸ�系�Կ� ����', '���-����', '����', 'www.selvashealthcare.com', 
        '���������� ������ ������ 174 (042-864-4460(213)', '2016.10.31 09:00', '2016.11.13 24:00', 'recruit.doc', '10000', 0, sysdate);
        
        
INSERT INTO employment_info (em_no, me_no, ei_no, em_mainbusiness, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, 
                             em_et, em_lastschool, em_salary, em_rank, em_position, 
                             em_url, em_workplace, em_startdate, em_deadline, em_supportformfile1, em_supportformfile2, 
                             em_supportformsize2, em_cnt, em_date)
VALUES((SELECT NVL(MAX(em_no), 0)+1 as em_no FROM employment_info), 1, 1, 'a', 'b', 'c', 'd', 'e', 'f', 'g', 
        '���б����� (4��) ����', 'ȸ�系�Կ� ����', '���-����', '����', 'www.selvashealthcare.com', 
        '���������� ������ ������ 174 (042-864-4460(213)', '2016.10.31 09:00', '2016.11.13 24:00', 'recruit.doc', 
        'recruit.doc', '10000', 0, sysdate);






INSERT INTO employment_info (boardno, divisionno, me_no, ei_no, em_no, em_id, em_password, em_email, em_title,
                             em_content, em_mainbusiness, em_cof, em_pi, em_startdate, em_deadline, em_rp, 
                             em_other, em_occupations, em_et, em_lastschool, em_salary, em_rank, em_position, 
                             em_url, em_file1, em_size1, em_cnt, em_date)
VALUES(1, 1, 1, 1, (SELECT NVL(MAX(em_no), 0)+1 as em_no FROM employment_info), '', '1234', '02-6901-7061', 
       'iep@iep.com', '�߼ұ��', '101-86-50485', 'IEP', '������', '����Ư���� ���α� ����12��', 
       '15 (��ö�� 13-13)', '03190', sysdate);

       
SELECT COUNT(ei.ei_id) as ei.ei_id
FROM enterprise_info ei, member m;
WHERE ei.ei_id = m.ei_id;
  


       
-- ä������ ��ü ��ȸ

SELECT em_no, ei_no, em_title, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, em_et, 
       em_lastschool, em_salary, em_rank, em_position, em_url, em_workplace, em_startdate, em_enddate, em_statedate, 
       em_interviewdate, em_supportformfile1, em_supportformsize1, em_cnt, em_date
FROM employment_info
ORDER BY em_no ASC;


SELECT em_no, me_no, ei_no, em_title, em_mainbusiness, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, em_et, 
       em_lastschool, em_salary, em_rank, em_position, em_url, em_workplace, em_startdate, em_enddate, em_statedate, 
       em_interviewdate, em_supportformfile1, em_supportformsize1, em_cnt, em_date
FROM employment_info
ORDER BY em_no ASC;




SELECT em_no, me_no, ei_no, em_mainbusiness, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, em_et, em_lastschool, 
       em_salary, em_rank, em_position, em_url, em_workplace, em_startdate, em_deadline, em_supportformfile1, 
       em_supportformsize1, em_cnt, em_date
FROM employment_info
ORDER BY em_no ASC;


-- ä������ ��ȸ
SELECT em_no, ei_no, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, em_et, em_lastschool, 
       em_salary, em_rank, em_position, em_url, em_workplace, em_startdate, em_enddate, em_statedate, em_interviewdate, 
       em_supportformfile1, em_supportformsize1, em_cnt, em_date
FROM employment_info
WHERE ei_no = 1;





SELECT em_no, me_no, ei_no, em_mainbusiness, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, em_et, em_lastschool, 
       em_salary, em_rank, em_position, em_url, em_workplace, em_startdate, em_enddate, em_statedate, em_interviewdate, 
       em_supportformfile1, em_supportformsize1, em_cnt, em_date
FROM employment_info
WHERE ei_no = 1;



SELECT em_no, me_no, ei_no, em_mainbusiness, em_cof, em_pi, em_rp, em_howtoapply, em_occupations, em_et, em_lastschool, 
       em_salary, em_rank, em_position, em_url, em_workplace, em_startdate, em_deadline, em_supportformfile1, 
       em_supportformsize1, em_cnt, em_date
FROM employment_info
WHERE ei_no = 1;




-- ä������ ����
UPDATE employment_info
SET em_cof='- 4���� ��ǻ��/����/����/���� �迭 �������� ����(����)��- C, C++ ���� ������ - �ؿܿ��࿡ ��ݻ����� ���� ��', 
    em_pi='- Linux, Mobile Platform, iOS, Android, Windows ���α׷� ���� ���� - ������/�ȵ���̵� Ŀ�� ����̹� ���� ������ 
    - �ܱ��� ������ ��� - �������� ����� �� ������� ���� ���ɿ� �ǰ� ���', em_rp='- �����ɻ� > ��,�����˻�/�ʱ����� > �������� > 
    �հ��� ��ǥ ** ���������� �ʱ����� �ǽ�', em_howtoapply='ä����� �� �����ϱ⸦ ���� ä��Ȩ������ �̵� �� �Ի� ����', 
    em_occupations='����Ʈ������Ͼ�', em_et='������', em_lastschool='���б����� (4��) ����', em_salary='ȸ�系�Կ� ����', 
    em_rank='���-����', em_position='����', em_url='www.selvashealthcare.com', em_workplace='���������� ������ ������ 174 
    (042-864-4460(213)', em_startdate='2016.05.17 09:30', em_enddate='2016.11.17 18:30', em_statedate='2016.11.17 18:30', 
    em_interviewdate='2016.11.17 18:30', em_supportformfile1='recruit.doc', em_supportformsize1=10000, em_cnt=0
WHERE ei_no = 1;


UPDATE employment_info
SET em_mainbusiness='�ｺ�ɾ���ǰ(�������б��, �Ƿ����ܱ��)SW ���� �� ����', 
    em_cof='- 4���� ��ǻ��/����/����/���� �迭 �������� ����(����)��- C, C++ ���� ������ - �ؿܿ��࿡ ��ݻ����� ���� ��', 
    em_pi='- Linux, Mobile Platform, iOS, Android, Windows ���α׷� ���� ���� - ������/�ȵ���̵� Ŀ�� ����̹� ���� ������ 
    - �ܱ��� ������ ��� - �������� ����� �� ������� ���� ���ɿ� �ǰ� ���', em_rp='- �����ɻ� > ��,�����˻�/�ʱ����� > �������� > 
    �հ��� ��ǥ ** ���������� �ʱ����� �ǽ�', em_howtoapply='ä����� �� �����ϱ⸦ ���� ä��Ȩ������ �̵� �� �Ի� ����', 
    em_occupations='����Ʈ������Ͼ�', em_et='������', em_lastschool='���б����� (4��) ����', em_salary='ȸ�系�Կ� ����', 
    em_rank='���-����', em_position='����', em_url='www.selvashealthcare.com', em_workplace='���������� ������ ������ 174 
    (042-864-4460(213)', em_startdate='2016.05.17 09:30', em_enddate='2016.11.17 18:30', em_statedate='2016.11.17 18:30', 
    em_interviewdate='2016.11.17 18:30', em_supportformfile1='recruit.doc', em_supportformsize1=10000, em_cnt=0
WHERE ei_no = 1;
       
-- ä������ ����
DELETE FROM enterprise_info
WHERE ei_no=1;      



--------------------------------------------------------------------------------------------------------------------------
