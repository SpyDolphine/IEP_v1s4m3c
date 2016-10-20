<��� �����ı�>
- ���� : �͸�Խ���
- Į�� : ��������迭, ���� �� ����, �ٹ�����, �з� �� ���, ����, ���� ����, �亯, ä����, ��ǥ�ñ�, �������(�����غ� �� ��������)
         ���� ���̵�(1~5), ���� ����(������, ������, ����), ������(�¶�������, ��õ, ����ä��, �����������, �������, ��Ÿ)
         
drop table interview_fail
delete from interview_fail where if_no=1;
         
create table interview_fail (
   if_no       NUMBER(7)      not null,                     -- �۹�ȣ
   if_title    VARCHAR2(200)  NOT NULL,                     -- ������
   if_id       varchar2(100)  not null,                     -- �̸���
   if_nick     varchar2(30)   not null,                     -- �г���
   if_gender   varchar2(10)   not null,                     -- ����(radio)
   if_company  varchar2(100)  not null,                     -- ��������迭
   if_position varchar2(300)  not null,                     -- ���� �� ����
   if_region   varchar2(20)   not null,                     -- �ٹ�����
   if_content  varchar2(3000) not null,                     -- �������(�����غ�/���� �� ��������)
   if_q        varchar2(3000) not null,                     -- ���� ����
   if_a        varchar2(3000) not null,                     -- ���� �亯
   if_level    varchar2(30)   not null,                     -- ���� ���̵� (radio)
   if_exper    varchar2(20)   not null,                     -- ���� ���� (radio)
   if_where    varchar2(100)  not null,                     -- ������(radio)
   if_how      varchar2(200)  not null,                     -- ä����
   if_when     varchar2(50)   null,                         -- ��ǥ�ñ�
   if_likeit   number(7)      default 0,                    -- ���ƿ�(��õ�մϴ�)
   if_date     date           not null,                     -- ��¥
   PRIMARY KEY(if_no)
);

1. ���
-- INSERT
INSERT INTO interview_fail(if_no,if_title,if_id,if_nick,if_gender,if_company,if_position,if_region,if_content,if_q,if_a,if_level,if_exper,if_where,if_how,if_when,if_date)
VALUES((SELECT NVL(MAX(if_no), 0)+1 as if_no FROM interview_fail),'1','1','1','����','1','1',
'1','1','1','1','1','1','1','1','1',sysdate)
 ...);
 
 
2. �˻�
  SELECT if_no, if_title, if_id, if_nick, if_gender, if_company, if_position, if_region, if_content, if_q, if_a,
         if_level, if_exper, if_where, if_how, if_when, if_date
  FROM interview_fail
  ORDER BY if_no ASC;
  
3. �б�
	SELECT if_no, if_title, if_id, if_nick, if_gender, if_company, if_position, if_region, if_content, if_q, if_a,
	       if_level, if_exper, if_where, if_how, if_when, if_date
	FROM interview_fail
	WHERE if_no= 1;

