/**********************************/
/* Table Name: ������� */
/**********************************/ 


DROP TABLE enterprise_info;



CREATE TABLE enterprise_info(
    ei_no                             NUMBER(7)            NOT NULL,                        -- ������� ��ȣ
    ei_corporationname                VARCHAR2(50)         NOT NULL,                        -- ȸ�� �̸�
    ei_slotname                       VARCHAR2(50)         NOT NULL,                        -- ��ǥ�� �̸�
    ei_crn                            VARCHAR2(50)         NOT NULL,                        -- ����ڵ�� ��ȣ
    ei_employees                      NUMBER(17)           DEFAULT 0     NULL,              -- �����
    ei_established                    VARCHAR2(15)             NULL,                        -- ������
    ei_business                       VARCHAR2(50)         NOT NULL,                        -- ������ (����)
    ei_url                            VARCHAR2(500)            NULL,                        -- ȸ�� URL
    ei_ci                             VARCHAR2(1000)       NOT NULL,                        -- ��� �Ұ� (Company Introduction)
    ei_majorbusiness                  VARCHAR2(1000)       NOT NULL,                        -- �ֿ� ����
    ei_logofile1                      VARCHAR2(100)            NULL ,                       -- �ΰ����ϸ� 1
    ei_logofile2                      VARCHAR2(100)            NULL,                        -- �ΰ����ϸ� 2
    ei_logosize2                      NUMBER(8)            DEFAULT 0     NULL,              -- �ΰ�ũ�� 2
    ei_map                            VARCHAR2(1024)           NULL,                        -- ȸ������
    ei_tpic                           VARCHAR2(30)         NOT NULL,                        -- ä������
    ei_date                           DATE                 NOT NULL,                        -- ��ϳ�¥
    me_no                             NUMBER(7)            NOT NULL,                        -- ȸ�� ��ȣ
    PRIMARY KEY (ei_no),                                                                    -- ������� ��ȣ PRIMARY KEY
    -- FOREIGN KEY (me_no)      REFERENCES IEP_MEMBER (me_no)                                  -- ȸ����ȣ FOREIGN KEY
);


SELECT * FROM enterprise_info;


-- ������� ���


INSERT INTO enterprise_info (ei_no, me_no, ei_corporationname, ei_slotname, ei_crn, ei_employees, ei_established, 
                             ei_business, ei_url, ei_ci, ei_majorbusiness, ei_logofile1, ei_logofile2, ei_logosize2, 
                             ei_map, ei_tpic, ei_date)
VALUES((SELECT NVL(MAX(ei_no), 0)+1 as ei_no FROM enterprise_info), 1, 'IEP', 'iep', '101-86-50485', 9500, '2009-10-01', 
        'IT���������', 'http://www.soldesk.net/', '���������� ����ȭ�� ����Ʈ���� ������� ���� IT������ ���� ����Դϴ�. 
        �۷ι� ���� 70% �̻��� ������ ���� ��ǥ ��ǰ Polaris Office�� ����Ʈ�� �� �º�PC�� �⺻ ž��Ǿ� �ֽ��ϴ�. 
        ���� ����� �ַ�ǿ� �̾� Ŭ���� ��� ���ǽ� ���񽺸� 2014�� 4�� ��Ī �Ͽ�����, ��Ī 1�� �� ���� �۷ι� 3õ�� ������
        �� Ȯ���Ͽ����ϴ�. Ư�� 3õ�� ������ �� �ؿ� ������� ������ 92%�� �е������� ����. �̱�, �Ϻ�, ����, ���� ���� ������ 
        45% �̻����� ��ǥ���� IT ���������� ���� ��� ������ �ŵθ� �۷ι� ���񽺷μ��� ���ɼ��� �����ް� �ֽ��ϴ�. 
        �迭��� �����, ��������� ��ũ���, ���ٽ�, �ڿ��޵�Į ���� �ֽ��ϴ�.', '���ڻ�ŷ��ַ�� �� ����Ʈ����', 
        'logo.gif', 'logo.gif', 171379, '����', 'ä��', sysdate);
        
     
        
        
        
-- ������� ��ü ��ȸ

        
SELECT ei_no, me_no, ei_corporationname, ei_slotname, ei_crn, ei_employees, ei_established, ei_business, ei_url, ei_ci, 
       ei_majorbusiness, ei_logofile1, ei_logofile2, ei_logosize2, ei_map, ei_tpic, ei_date
FROM enterprise_info
ORDER BY ei_no ASC;




-- ������� �˻� ��ȸ


SELECT ei_no, me_no, ei_corporationname, ei_slotname, ei_crn, ei_employees, ei_established, ei_business, ei_url, 
       ei_ci,  ei_majorbusiness, ei_logofile1, ei_logofile2, ei_logosize2, ei_map, ei_tpic, ei_date
FROM enterprise_info
WHERE ei_no = 1;



-- ������� ����¡ ����

-- step 3         
SELECT ei_no, me_no, ei_corporationname, ei_slotname, ei_crn, ei_established, ei_business, ei_url, ei_logofile1, 
       ei_logosize1, ei_map, ei_tpic, ei_date, r
FROM(
         SELECT ei_no, me_no, ei_corporationname, ei_slotname, ei_crn, ei_established, ei_business, ei_url, ei_logofile1, 
                ei_logosize1, ei_map, ei_tpic, ei_date, rownum as r 
         FROM(
                  SELECT ei_no, me_no, ei_corporationname, ei_slotname, ei_crn, ei_established, ei_business, ei_url, ei_logofile1, 
                         ei_logosize1, ei_map, ei_tpic, ei_date
                  FROM enterprise_info
                  WHERE me_no=1
                  -- WHERE ei_no=1
                  ORDER BY me_no DESC
         )
)
WHERE r >=1 AND r <= 3;


UPDATE enterprise_info
SET ei_corporationname='IEP', ei_slotname='iep', ei_crn='101-86-50485', ei_employees=9500, ei_established='2009-10-01', 
    ei_business='IT���������', ei_url='http://www.soldesk.net/', ei_ci='���������� ����ȭ�� ����Ʈ���� ������� 
    ���� IT������ ���� ����Դϴ�. �۷ι� ���� 70% �̻��� ������ ���� ��ǥ ��ǰ Polaris Office�� ����Ʈ�� �� �º�PC�� 
    �⺻ ž��Ǿ� �ֽ��ϴ�. ���� ����� �ַ�ǿ� �̾� Ŭ���� ��� ���ǽ� ���񽺸� 2014�� 4�� ��Ī �Ͽ�����, ��Ī 1�� �ݸ��� 
    �۷ι� 3õ�� �����ڸ� Ȯ���Ͽ����ϴ�. Ư�� 3õ�� ������ �� �ؿ� ������� ������ 92%�� �е������� ����. 
    �̱�, �Ϻ�, ����, ���� ���� ������ 45% �̻����� ��ǥ���� IT ���������� ���� ��� ������ �ŵθ� �۷ι� 
    ���񽺷μ��� ���ɼ��� �����ް� �ֽ��ϴ�. �迭��� �����, ��������� ��ũ���, ���ٽ�, �ڿ��޵�Į ���� �ֽ��ϴ�.', 
    ei_majorbusiness='���ڻ�ŷ��ַ�� �� ����Ʈ����', ei_logofile1='logo.gif', ei_logofile2='logo.gif', ei_logosize2=171379, 
    ei_map='����', ei_tpic='ä��'    
WHERE ei_no = 1


       
-- ������� ����
DELETE FROM enterprise_info
WHERE ei_no=1;