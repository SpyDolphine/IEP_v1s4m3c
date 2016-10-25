-- ȸ������ ���̺� ���� 
drop table IEP_MEMBER;

-- ȸ������ ���̺� ����
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
    me_visible          number(1) default 1,
    primary key(me_no)
);

COMMENT ON TABLE member is 'ȸ������';
COMMENT ON COLUMN member.me_no is 'ȸ����ȣ';
COMMENT ON COLUMN member.me_id is 'ȸ�����̵�';
COMMENT ON COLUMN member.me_pw is 'ȸ����й�ȣ';
COMMENT ON COLUMN member.me_nick is 'ȸ���г���';
COMMENT ON COLUMN member.me_name is 'ȸ�����̵�';
COMMENT ON COLUMN member.me_grade is 'ȸ�����';
COMMENT ON COLUMN member.me_zip is '�����ȣ';
COMMENT ON COLUMN member.me_addr1 is '�ּ�';
COMMENT ON COLUMN member.me_addr2 is '���ּ�';
COMMENT ON COLUMN member.me_tel is '��ȭ��ȣ';
COMMENT ON COLUMN member.me_date is '�����';

-- ȸ������ insert
INSERT INTO IEP_MEMBER(me_no, me_id, me_pw, me_nick, me_name, me_grade, me_zipcode, me_addr1, me_addr2, me_tel, me_date, me_visible)
VALUES ((SELECT NVL(MAX(me_no), 0)+1 as me_no FROM IEP_MEMBER),
'admin', '1234', '�躴��', '��ǻ��õ��', 'A', '12345', '��õ ������ ', '���ƾ� 9-1109', '010-8784-8591', sysdate, 1);

-- ��� (������ ���ѿ�����Ȯ��)
select me_no, me_id, me_nick, me_addr1, me_tel, me_date, me_grade
from IEP_MEMBER;

select * from IEP_MEMBER 

-- ���̵� �ߺ�Ȯ�� 
SELECT COUNT(me_id) as cnt
FROM iep_member
WHERE me_id='user1';

-- �г��� �ߺ�Ȯ��
SELECT COUNT(me_nick) as cnt
FROM iep_member
WHERE me_nick='�޷���';

-- ȸ������ ����
UPDATE iep_member 
SET me_zipcode = '12345', me_addr1='����Ư���� ���α� ��ö��' , me_addr2='123-123', me_tel='010-0000-0000'
WHERE me_no=1;

-- �н����� �˻�
SELECT COUNT(me_no) as cnt
FROM iep_member
WHERE me_no=1 AND me_pw='1234';
 
-- �н����� ����
UPDATE iep_member
SET me_pw='0000'
WHERE me_no=1;

-- ȸ�� Ż��(����)
DELETE FROM iep_member
WHERE me_no=1;

-- �α���
SELECT me_no, me_nick, me_grade, count(me_no) as cnt
FROM iep_member
WHERE me_id='shiningray12@naver.com' AND me_pw='dragon12'
group by me_no, me_nick, me_grade;

SELECT COUNT(me_no) as cnt
FROM iep_member
where me_id='shiningray12@naver.com' AND me_pw='dragon12'

  SELECT me_no, me_id, me_pw, me_nick, me_name, me_grade
  FROM IEP_MEMBER
  where me_no = #{me_no}; 



-- ȸ������ ���

INSERT INTO IEP_MEMBER(me_no, me_id, me_pw, me_nick, me_name, me_zipcode, me_addr1, me_addr2, me_tel, me_date)
VALUES ((SELECT NVL(MAX(me_no), 0)+1 as me_no FROM IEP_MEMBER),
'user1', '1234', '�մ���', '�躴��',  '12345', '��õ ������ ������ ����2��', '�ŵ��ƾ���Ʈ 9�� 1109ȣ', '010-8591-8784', sysdate);



select * from IEP_MEMBER;
-- ���̵� �ߺ�üũ 
SELECT COUNT(me_id) as cnt
FROM IEP_MEMBER
WHERE me_id='user1';
-- �г��� �ߺ� üũ
SELECT COUNT(me_nick) as cnt
FROM IEP_MEMBER
WHERE me_nick='�մ���';

delete from IEP_MEMBER;

select * from  iep_member;



CREATE TABLE IEP_MEMBER(
    me_no                         NUMBER(7)    NOT NULL  primary key,
    me_id                             VARCHAR2(100)    NOT NULL,
    me_pw                             VARCHAR2(20)     NOT NULL,
    me_nick                           VARCHAR2(40)     NOT NULL,
    me_name                           VARCHAR2(40)     NOT NULL,
    me_grade                          CHAR(1)    DEFAULT 'M'     NOT NULL,
    me_zipcode                        VARCHAR2(10)     NOT NULL,
    me_addr1                          VARCHAR2(100)    NOT NULL,
    me_addr2                          VARCHAR2(100)    NOT NULL,
    me_tel                            varchar2(20)     NOT NULL,
    me_date                           DATE     NOT NULL
);

SELECT COUNT(me_id) as cnt
FROM IEP_MEMBER
WHERE me_id='user1';
