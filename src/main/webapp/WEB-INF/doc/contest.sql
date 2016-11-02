create table iep_contest (
ct_no              number(7) primary key,   --������ ��ȣ
me_no             number(7) not null,        -- ȸ����ȣ
ct_title              varchar2(300) not null,     -- ������ ����
ct_host             varchar2(100) null,            -- ������ ����
ct_supervision    varchar2(100) null,           -- ������ �ְ�
ct_entry              varchar2(50) null,            -- ������ �����ڰ�
ct_enter              varchar2(50) null,           -- �������
ct_award            varchar2(50) null,            -- �û��ڰ�
ct_startdate        varchar2(50) null,            -- ���� ������
ct_enddate        varchar2(50) null,             -- ���� ������
ct_statedate       varchar2(50) null,            -- ��ǥ ��
ct_url                varchar2(100)  null,           -- ������ ���� Ȩ������
ct_content          varchar2(4000)  not null,     -- ������ �󼼳���
ct_file1               VARCHAR2(100)        NULL ,  -- ����
ct_file2               VARCHAR2(50)         NULL ,  -- ���� 2
ct_size2               NUMBER(9)        DEFAULT 0       NULL ,  -- ���� ������
ct_rdate              date  not null,                             -- ������ �����
ct_cnt                number(7)  DEFAULT 0   not null,                       --��ȸ��
FOREIGN KEY (Me_NO) REFERENCES iep_MEMBER (Me_NO)
);
drop table iep_contest;

1. ���
insert into iep_contest (ct_no, me_no, ct_title, ct_host, ct_supervision, ct_entry, ct_enter, ct_award, ct_startdate, ct_enddate, ct_statedate, ct_url, ct_content, ct_file1, ct_file2, ct_size2, ct_rdate, ct_cnt)
values ((select nvl(max(ct_no), 0)+1 as ct_no from iep_contest), 1, '������ ����', '������ ����', '������ �ְ�', '������ �����ڰ�', '�������', '�û�����', '2016-10-25', '2016-11-11', '2016-12-12', 'www.naver.com', '�׷� �׷�', 'file1.jpg', 'file2.jpg', 0, sysdate, 0);

2. ��ü ���
select ct_no, ct_title, ct_host, ct_startdate, ct_enddate, ct_cnt  from iep_contest order by ct_no DESC;

select ct_no, ct_title, ct_host, ct_startdate, ct_enddate, ct_cnt  
from iep_contest 
order by ct_no DESC

3. ��ȸ
select ct_title, ct_host, ct_supervision, ct_entry, ct_enter, ct_award, ct_startdate, ct_enddate, ct_statedate, ct_url, ct_content, ct_file1, ct_file2, ct_size2, ct_rdate, ct_cnt from iep_contest where ct_no=1;

4. ����
UPDATE iep_contest
SET ct_title='���� ������', ct_host = '���� ������', ct_supervision='�ְ� ������', ct_entry = '�����ڰ� ������', ct_enter='������� ������', ct_award='�û����� ������', ct_startdate = '2016-10-28', ct_enddate='2016-12-12' , ct_statedate = '2016-12-25', ct_url = 'www.google.com', ct_content = '123', ct_file1 = 'file1_2.jps', ct_file2 = 'file2_1.jpg', ct_size2= 0
WHERE ct_no=1;

update iep_member
set me_grade = 'A'
where me_no = 3;

5. ����
DELETE FROM iep_contest
WHERE ct_no=1;
 


    SELECT me_no, me_nick, me_name, me_grade
    FROM IEP_MEMBER
    where me_id=#{me_id}