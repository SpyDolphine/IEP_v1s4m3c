<Ŀ�´�Ƽ> 
�����Խ���     ����������       ���͵������      ��� / ������


-- �����Խ���(�ǽð� ������Ʈ) : Ŀ�´�Ƽ ���� ������
create table commu_free (
 cm_no        NUMBER(7)        not null,    -- �� ��ȣ
 cm_nick      varchar2(30)     not null,    -- �г���
 cm_title     varchar2(120)    not null,    -- �Խñ� ����
 cm_content   varchar2(4000)   not null,    -- �� ����
 cm_likeit    NUMBER(7)        default 0,   -- ���ƿ���                        
 cm_rdate     DATE             not null,    -- ��ϳ�¥
 PRIMARY KEY(cm_no)
);

1. ���߰�
INSERT INTO commu_free(cm_no, cm_nick, cm_title, cm_content, cm_likeit, cm_rdate)
VALUES((SELECT NVL(MAX(cm_no), 0)+1 as cm_no FROM commu_free), '�г���', '����','����', 0, sysdate);

2. ���
SELECT cm_no, cm_nick, cm_title, cm_content, cm_likeit, cm_rdate
FROM commu_free
ORDER BY cm_no ASC;

drop table commu_free;
delete from commu_free;


----------------------------------------------------------------------------------------------------------------------



-- ����������(����/����/������(�����) ������)
create table commu_info (
 cm_id        varchar2(100)     not null,              -- �̸���
 cm_nick      varchar2(30)     not null,               -- �г���
 cm_title     varchar2(120)     not null,              -- �Խñ� ����
 cm_content   varchar2(4000)    not null,              -- �� ����
 cm_likeit    NUMBER(7)         default 0,             -- ���ƿ���
 cm_map       varchar2(1024)    null,                  -- ����
 cm_url       varchar2(500)     null,                  -- ��ó  
 cm_cnt       NUMBER(7)         default 0,             -- ��ȸ��
 cm_rdate     DATE              not null,              -- ��ϳ�¥
 PRIMARY KEY(cm_no),
 FOREIGN KEY (divisionno) REFERENCES division (divisionno), -- ī�װ���ȣ
 FOREIGN KEY (me_no) REFERENCES IEP_MEMBER (me_no)          --ȸ����ȣ  
);

1. ���߰�
INSERT INTO commu_info(cm_no, cm_id, cm_nick, cm_title, cm_content, cm_map, cm_url, cm_rdate)
VALUES((SELECT NVL(MAX(cm_no), 0)+1 as cm_no FROM commu_info), 'cm_id','cm_nick', 'cm_title','cm_content', 'cm_map', 'cm_url', sysdate);

2. ���
SELECT cm_no, cm_nick, cm_title, cm_content, cm_likeit, cm_map, cm_url, cm_rdate
FROM commu_info
ORDER BY cm_no ASC;

----------------------------------------------------------------------------------------------------------------------

drop table commu_study
-- ���͵� �����(����/����/������(�����) ������)
create table commu_meet (
 cm_no        NUMBER(7)        not null,                         -- �� ��ȣ
 cm_nick      varchar2(30)     not null,                         -- �г���
 cm_title     varchar2(120)    not null,                         -- �Խñ� ����
 cm_content   varchar2(4000)   not null,                         -- �� ����
 cm_file1     VARCHAR2(100)    NULL ,
 cm_file2     VARCHAR2(50)     NULL ,
 cm_size2     NUMBER(9)        DEFAULT 0 ,
 cm_likeit    NUMBER(7)        default 0,                        -- ���ƿ���
 cm_map       varchar2(1024)   null,                             -- ����
 cm_url       varchar2(500)    null,                             -- ��ó  
 cm_cnt       NUMBER(7)        default 0,                        -- ��ȸ��
 cm_date      DATE             not null,                         -- ��ϳ�¥
 replycnt     NUMBER(7)        DEFAULT 0       NOT NULL, 
 grpno        NUMBER(7)        NOT NULL,
 indent       NUMBER(2)        DEFAULT 0       NOT NULL,
 ansnum       NUMBER(5)        DEFAULT 0       NOT NULL, 
 PRIMARY KEY(cm_no)
);

1. ���߰�
INSERT INTO commu_meet(cm_no, cm_nick, cm_title, cm_content, cm_file1, cm_file2, cm_size2, cm_likeit, cm_map, cm_url, 
                        cm_cnt, cm_date, replycnt, grpno, indent, ansnum)
VALUES((SELECT NVL(MAX(cm_no), 0)+1 as cm_no FROM commu_meet),'nick', '1title','content', 'ummer_m.jpg', 'summer.jpg',
        0, 0, 'map', 'url', 0, sysdate, 0 ,0, 0, 0);

2. ���

SELECT cm_no, cm_nick, cm_title, cm_content, cm_file1, cm_file2, cm_size2, cm_likeit, cm_map, cm_url, cm_cnt, cm_date,
       replycnt, grpno, indent, ansnum, r
FROM(
         SELECT cm_no, cm_nick, cm_title, cm_content, cm_file1, cm_file2, cm_size2, cm_likeit, cm_map, cm_url, cm_cnt, cm_date,
                replycnt, grpno, indent, ansnum, rownum as r
         FROM(
                  SELECT cm_no, cm_nick, cm_title, cm_content, cm_file1, cm_file2, cm_size2, cm_likeit, cm_map, cm_url, cm_cnt, cm_date,
                         replycnt, grpno, indent, ansnum
                  FROM commu_meet
                  ORDER BY grpno DESC, ansnum ASC
         )
)
WHERE r >=1 AND r <= 3;


3. ���ο� �亯�� �ֽ����� ����ϱ����� ���� �亯�� �ڷ� �̷�ϴ�.

UPDATE commu_meet
SET ansnum = ansnum + 1
WHERE grpno = 1 AND ansnum > 1;
----------------------------------------------------------------------------------------------------------------------

-- ���/������(����/����/������(�����) ������)
create table commu_info (
 cm_no        NUMBER(7)         not null,                         -- �� ��ȣ
 cm_id        varchar2(100)     not null,                         -- �̸���
 cm_nick      varchar2(30)      not null,                         -- �г���
 cm_title     varchar2(200)     not null,                         -- �Խñ� ����
 cm_content   varchar2(4000)    not null,                         -- �� ����
 cm_likeit    NUMBER(7)         default 0,                        -- ���ƿ���
 cm_url       varchar2(500)     null,                             -- ��ó  
 cm_cnt       NUMBER(7)         default 0,                        -- ��ȸ��
 cm_rdate     DATE              not null,                         -- ��ϳ�¥
 PRIMARY KEY(cm_no),
 FOREIGN KEY (divisionno) REFERENCES division (divisionno), -- ī�װ���ȣ
 FOREIGN KEY (me_no) REFERENCES IEP_MEMBER (me_no)          --ȸ����ȣ 
);

1. ���߰�
INSERT INTO commu_info(cm_no, cm_id, cm_nick, cm_title, cm_content, cm_url, cm_rdate)
VALUES((SELECT NVL(MAX(cm_no), 0)+1 as cm_no FROM commu_study), 'cm_id','cm_nick', 'cm_title','cm_content', 'cm_url', sysdate);

2. ���
SELECT cm_no, cm_nick, cm_title, cm_content, cm_likeit, cm_url, cm_rdate
FROM commu_info
ORDER BY cm_no ASC;

----------------------------------------------------------------------------------------------------------------------



-- ���
create table commu_comment (
 cm_no        NUMBER(7)       not null,                       -- �� ��ȣ
 cm_id        varchar2(100)   not null,                       -- �̸���
 cm_nick      varchar2(30)    not null,                       -- �г���
 cm_content   varchar2(4000)  not null,                       -- �� ����
 cm_likeit    NUMBER(7)       default 0,                      -- ���ƿ���
 cm_rdate     DATE            not null,                       -- ��ϳ�¥
 PRIMARY KEY(cm_no)
);
