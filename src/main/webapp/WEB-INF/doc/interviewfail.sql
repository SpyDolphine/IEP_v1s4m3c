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
   if_cnt      NUMBER(7)      default 0,                    -- ��ȸ��
   PRIMARY KEY(if_no)
);
select * from interview_fail
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

4. ��ȸ�� ����
update interview_fail
set if_cnt = if_cnt + 1
where if_no = 7

5. ���̺��� ����
select if_cnt, if_no, if_title, if_date
from interview_fail
order by if_cnt desc


	-------------------------------------------------------------------------------------------------------------------------
-- ���
select * from failReply
drop table failReply
delete from failReply

create table failReply(
 rno          NUMBER(7)       not null,                   -- �� ��ȣ
 if_no        NUMBER(7)       not null,                   -- �� ��ȣ
 rnick        varchar2(30)    not null,                   -- �г���
 rcontent     varchar2(4000)  not null,                   -- �� ����
 likeup       NUMBER(7)       default 0,                  -- ��õ
 likedown     NUMBER(7)       default 0,                  -- ����õ
 grpno        NUMBER(7)       NOT NULL,
 indent       NUMBER(2)       DEFAULT 0,
 ansnum       NUMBER(5)       DEFAULT 0,  
 rdate        DATE            not null,                   -- ��ϳ�¥
 FOREIGN KEY (if_no) REFERENCES interview_fail(if_no) on delete cascade,
 PRIMARY KEY(rno)
)

    SELECT rno, if_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum
    FROM failReply
    WHERE cm_no = 7

1. ��ȸ
   SELECT rno, if_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum, r
   FROM(
           SELECT rno, if_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum, rownum as r
           FROM(
                    SELECT rno, if_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum
                    FROM failReply
                    ORDER BY grpno DESC, ansnum ASC
             )
    )
 WHERE rownum >=1;
 
2. ���ۼ�
INSERT INTO failReply(rno, if_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum)
VALUES((SELECT NVL(MAX(rno), 0)+1 as rno FROM failReply), 3, 'nick2', 'content', 0, 0, sysdate, 
       (SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM failReply), 0, 0);  

3. ���ο� �亯�� �ֽ����� ����ϱ����� ���� �亯�� �ڷ� �̷�ϴ�.
UPDATE failReply
SET ansnum = ansnum + 1
WHERE if_no=3 and grpno = 1 AND ansnum > 1;

4. ��� �� ��ȸ
select count(*)rno
from failReply
where if_no = 3

5. ��� �б�
SELECT rno, if_no, rnick, rcontent, likeup, likedown, rdate, grpno, indent, ansnum
FROM failReply
WHERE rno = 21	

6. ��õ���� ��� ����
select likeup, if_no, rcontent, rdate
from failReply
order by likeup desc