CREATE TABLE IEP_MEMBER(
    me_no              NUMBER(7)    NOT NULL ,  -- ȸ�� ��ȣ
    me_id               VARCHAR2(100)   unique  NOT NULL,-- ȸ�� ���̵�(�̸��Ϸ�)
    me_pw              VARCHAR2(20)     NOT NULL,-- ȸ�� ��й�ȣ
    me_nick            VARCHAR2(40)     NOT NULL,-- ȸ�� �г���
    me_name          VARCHAR2(40)     NOT NULL,-- ȸ�� �̸�
    me_grade          CHAR(1)    DEFAULT 'M',-- ȸ�� ���
    me_zipcode       VARCHAR2(10)     NOT NULL,-- ȸ�� �����ȣ
    me_addr1          VARCHAR2(100)    NOT NULL,-- ȸ�� �ּ�
    me_addr2          VARCHAR2(100)    NOT NULL,-- ȸ�� ���ּ�
    me_tel               varchar2(20)     NOT NULL,-- ȸ�� ��ȭ��ȣ
    me_date            DATE     NOT NULL,-- ȸ�� �����
    me_vis          char(1)       default 'y'   not null, --  ȸ�� Ż�𿩺�
    primary key(me_no)
);

select * from IEP_MEMBER

update IEP_MEMBER


  update iep_member
  set me_vis = 'y'
  where me_no=1