CREATE TABLE calender(
    cl_no                             NUMBER(7)    NOT NULL    PRIMARY KEY,
    me_no                             NUMBER(7)     NULL ,
    me_id                             VARCHAR2(100)    NOT NULL,
    cl_title                          VARCHAR2(120)    NOT NULL,
    cl_content                        VARCHAR2(100)    NOT NULL,
    startdate                          varchar2(30)   NULL,
    enddate                          varchar2(30)   NULL,
    cl_date                           DATE     NOT NULL,
    boardno                             NUMBER(7)    NULL ,
    sp_no                             NUMBER(7)    NULL ,
  FOREIGN KEY (me_no) REFERENCES iep_member (me_no),
  FOREIGN KEY (boardno) REFERENCES board (boardno),
  FOREIGN KEY (sp_no) REFERENCES scrap (sp_no)
);

COMMENT ON TABLE calender is '����';
COMMENT ON COLUMN calender.cl_no is '������ȣ';
COMMENT ON COLUMN calender.cl_id is '�����̸���';
COMMENT ON COLUMN calender.cl_title is '���� ����';
COMMENT ON COLUMN calender.cl_content is '��������';
COMMENT ON COLUMN calender.cl_start is '����������';
COMMENT ON COLUMN calender.cl_end is '����������';
COMMENT ON COLUMN calender.cl_date is '��� �ð�';
COMMENT ON COLUMN calender.me_no is 'ȸ����ȣ';
COMMENT ON COLUMN calender.ex_no is '�� ��ȣ';
COMMENT ON COLUMN calender.lc_no is '�� ��ȣ';
COMMENT ON COLUMN calender.cn_no is '�� ��ȣ';
drop table calender
-- ���
insert into calender(cl_no, cl_id, cl_title, cl_content, cl_start, cl_end, cl_date, me_no, ex_no, lc_no, cn_no  )
values((SELECT NVL(MAX(cl_no), 0)+1 as cl_no FROM calender),
'user', '����ó�����', '����ó����� ����', 2016-03-12, 2016-03-15, 2016-10-17, 1, 1, 1, 1 );

-- ���
select cl_no, cl_id, cl_title, cl_start, cl_end, cl_date 
from calender

-- ��ȸ
select cl_no, cl_id, cl_title,cl_content, cl_start, cl_end, cl_date 
from calender
where cl_no = 1;

-- ����
delete from calender
where cl_no=1;

drop table scrap


  SELECT
    me_no, me_id, me_nick, me_name, me_tel, me_zipcode, me_addr1, me_addr2, me_date
    FROM
    iep_member
    WHERE me_no = 1

CREATE TABLE scrap(
    sp_no                             NUMBER(7)    NOT NULL    PRIMARY KEY,
    me_no                             NUMBER(7)     NULL ,
    me_id                             VARCHAR2(100)    NOT NULL,
    me_nick                             VARCHAR2(100)    NOT NULL,
    sp_title                          VARCHAR2(120)    NOT NULL,
    sp_content                        VARCHAR2(100)    NOT NULL,
    sp_date                           DATE     NOT NULL,
    ct_no                             NUMBER(7)    NULL ,
    FOREIGN KEY (me_no) REFERENCES iep_member (me_no),
    FOREIGN KEY (ct_no) REFERENCES iep_contest (ct_no)
);

COMMENT ON TABLE scrap is '��ũ��';
COMMENT ON COLUMN scrap.sp_no is '��ũ����ȣ';
COMMENT ON COLUMN scrap.sp_id is '��ũ�����̵�';
COMMENT ON COLUMN scrap.sp_title is '��ũ�� ����';
COMMENT ON COLUMN scrap.sp_content is '��ũ������';
COMMENT ON COLUMN scrap.sp_date is '��� �ð�';
COMMENT ON COLUMN scrap.me_no is 'ȸ����ȣ';
COMMENT ON COLUMN scrap.ex_no is '�� ��ȣ';
COMMENT ON COLUMN scrap.lc_no is '�� ��ȣ';
COMMENT ON COLUMN scrap.cn_no is '�� ��ȣ';

 sp_no                             NUMBER(7)    NOT NULL    PRIMARY KEY,
    me_no                             NUMBER(7)     NULL ,
    me_id                             VARCHAR2(100)    NOT NULL,
    me_nick                             VARCHAR2(100)    NOT NULL,
    ct_startdate   varchar2(50)              null,
    ct_enddate   varchar2(50)              null,
    ct_statedate        varchar2(50)      null,  
    sp_title                          VARCHAR2(120)    NOT NULL,
    sp_content                        VARCHAR2(100)    NOT NULL,
    sp_date                           DATE     NOT NULL,
    ct_no                             NUMBER(7)    NULL ,
-- ���
insert into scrap(sp_no, me_no, me_id,  me_nick, sp_title, sp_content, sp_date, ct_no)
values((SELECT NVL(MAX(sp_no), 0)+1 as sp_no FROM scrap),
 1, 'admin', '�ְ� ������', '������', 'http://safdaf.com', sysdate, 2);

-- ���
select sp_title, sp_date
from scrap
where me_no=3;

-- ��ȸ
select sp_no, me_nick, sp_title, sp_content, sp_date
from scrap
where sp_no = 1;

-- ����
delete from scrap
where sp_no=1;