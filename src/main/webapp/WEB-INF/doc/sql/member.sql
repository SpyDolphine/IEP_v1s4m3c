CREATE TABLE IEP_MEMBER(
    me_no              NUMBER(7)    NOT NULL ,  -- ȸ�� ��ȣ
    me_id               VARCHAR2(100)   unique  NOT NULL,-- ȸ�� ���̵�(�̸��Ϸ�)
    me_pw              VARCHAR2(50)     NOT NULL,-- ȸ�� ��й�ȣ
    me_nick            VARCHAR2(40)     NOT NULL,-- ȸ�� �г���
    me_name          VARCHAR2(40)     NOT NULL,-- ȸ�� �̸�
    me_grade          CHAR(1)    DEFAULT 'M',-- ȸ�� ��� 'M' �Ϲ�,'C'���, 'A' ������, 
    me_zipcode       VARCHAR2(10)     NOT NULL,-- ȸ�� �����ȣ
    me_addr1          VARCHAR2(100)    NOT NULL,-- ȸ�� �ּ�
    me_addr2          VARCHAR2(100)    NOT NULL,-- ȸ�� ���ּ�
    me_tel               varchar2(20)     NOT NULL,    -- ȸ�� ��ȭ��ȣ
    me_date            DATE     NOT NULL,              -- ȸ�� �����
    me_vis              char(1)        default 'y',           --  ȸ�� Ż�𿩺� 'y'ȸ��, 'n'Ż��
    primary key(me_no)
);

select * from IEP_MEMBER

update iep_member
set me_grade = 'A'
where me_no = 3

alter table iep_member add(me_vis char(1))
alter table iep_member MODIFY( me_pw VARCHAR2(100))
CREATE TABLE uriLog(
   urilogno NUMBER(7)                   NOT NULL, -- �Ϸ� ��ȣ
   id          VARCHAR(10) DEFAULT 'guest' NOT NULL, -- ���̵�
   ip          VARCHAR(15)                 NOT NULL, -- 123.456.789.012
   uri         VARCHAR(50)                 NOT NULL, -- URI �ּ�
   uridate    VARCHAR(19)                 NOT NULL, -- ���� ��¥
   PRIMARY KEY(urilogno)
);
select * from URILOG;
update iep_member
set me_confirm = 'Y'
where me_id = 'shiningray12@admin.com' and auth='axd00000011111111';

update iep_member
set me_grade = 'A'
where me_no = 2

select * from IEP_MEMBER

update IEP_MEMBER

drop table iep_member;

delet * from IEP_MEMBER;

  update iep_member
  set me_vis = 'y'
  where me_no=1