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

----------------------------------------------------------------------------------------------------------------------
-- ���͵� �����(����/����/������(�����) ������)
drop table commu_meet;
delete table commu_meet; 
select * from commu_meet

create table commu_meet (
 cm_no        NUMBER(7)        not null,                         -- �� ��ȣ
 cm_nick      varchar2(30)     not null,                         -- �г���
 cm_title     varchar2(120)    not null,                         -- �Խñ� ����
 cm_content   varchar2(4000)   not null,                         -- �� ����
 file1     VARCHAR2(100)    NULL ,
 file2     VARCHAR2(50)     NULL ,
 size2     NUMBER(9)        DEFAULT 0 ,
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

-- �۳ѹ� �ִ밪
SELECT NVL(MAX(cm_no), 0) as cm_no 
FROM commu_meet
where indent = 0

-- �۳ѹ� �ּҰ�
SELECT NVL(MIN(cm_no), 0) as cm_no 
FROM commu_meet
where indent = 0



1. ���߰�
INSERT INTO commu_meet(cm_no, cm_nick, cm_title, cm_content, cm_file1, cm_file2, cm_size2, cm_likeit, cm_map, cm_url, 
                        cm_cnt, cm_date, replycnt, grpno, indent, ansnum)
VALUES((SELECT NVL(MAX(cm_no), 0)+1 as cm_no FROM commu_meet),'nick', '1title','content', 'ummer_m.jpg', 'summer.jpg',
        0, 0, 'map', 'url', 0, sysdate, 0 ,0, 0, 0);
        

-�亯

INSERT INTO commu_meet(cm_no, cm_nick, cm_title, cm_content, file1, file2, size2, cm_likeit, cm_map, cm_url, 
                        cm_cnt, cm_date, replycnt, grpno, indent, ansnum)
VALUES((SELECT NVL(MAX(cm_no), 0)+1 as cm_no FROM commu_meet),'nick', '1title','content', 'ummer_m.jpg', 'summer.jpg',
        0, 0, 'map', 'url', 0, sysdate, 0 ,1, 0, 0);

2. ���

         SELECT cm_no, cm_nick, cm_title, cm_content, file1, file2, size2, cm_likeit, cm_map, cm_url, cm_cnt, cm_date,
                replycnt, grpno, indent, ansnum, rownum
         FROM(
                  SELECT cm_no, cm_nick, cm_title, cm_content, file1, file2, size2, cm_likeit, cm_map, cm_url, cm_cnt, cm_date,
                         replycnt, grpno, indent, ansnum, rownum
                  FROM commu_meet
                  ORDER BY grpno DESC, ansnum ASC
         )
         WHERE rownum >=1;
         
SELECT cm_no, cm_nick, cm_title, cm_content, file1, file2, size2, cm_likeit, cm_map, cm_url, cm_cnt, cm_date,
        replycnt, grpno, indent, ansnum, rownum
FROM(         
          select cm_no, cm_nick, cm_title, cm_content, file1, file2, size2, cm_likeit, cm_map, cm_url, cm_cnt, cm_date,
                          replycnt, grpno, indent, ansnum, rownum
          from commu_meet
    where ansnum = 0
    order by cm_no
)

  SELECT cm_no, cm_title, cm_date, grpno, rownum
  FROM(         
            SELECT cm_no, cm_title, cm_date, grpno, rownum
            from commu_meet
      where ansnum = 0
      order by cm_no
  )
  
3. ���ο� �亯�� �ֽ����� ����ϱ����� ���� �亯�� �ڷ� �̷�ϴ�.

UPDATE commu_meet
SET ansnum = ansnum + 1
WHERE grpno = 1 AND ansnum > 1;

4. ��ȸ�� ����
update commu_meet
set cm_cnt = cm_cnt + 1
where cm_no = 7
----------------------------------------------------------------------------------------------------------------------

-- ���/������(����/����/������(�����) ������)

----------------------------------------------------------------------------------------------------------------------

