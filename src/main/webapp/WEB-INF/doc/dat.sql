/*
create table reply(
 rno          NUMBER(7)       not null,                   -- �� ��ȣ
 cm_no        NUMBER(7)       not null,                   -- �� ��ȣ
 rnick        varchar2(30)    not null,                   -- �г���
 rcontent     varchar2(4000)  not null,                   -- �� ����
 likeup       NUMBER(7)       default 0,                  -- ��õ
 likedown     NUMBER(7)       default 0,                  -- ����õ
 grpno        NUMBER(7)       NOT NULL,
 indent       NUMBER(2)       DEFAULT 0,
 ansnum       NUMBER(5)       DEFAULT 0,  
 rdate        DATE            not null,                   -- ��ϳ�¥
 PRIMARY KEY(rno), 
 FOREIGN KEY (cm_no) REFERENCES commu_free(cm_no)
 
)
 */

drop table dat
drop table reply
CREATE TABLE dat(
    dno                               NUMBER(7)      NOT NULL PRIMARY KEY,    -- ��� ��ȣ
    gu_no                             NUMBER(7)      NOT NULL,                -- ���� �� ��ȣ
    d_name                            VARCHAR2(100)  NOT NULL,                -- �г���
    d_cont                            VARCHAR2(4000) NOT NULL,                -- ����
    d_date                            DATE           NOT NULL,                -- ��¥
    likeup                            NUMBER(7)       default 0,                  -- ��õ
    likedown                          NUMBER(7)       default 0,                  -- ����õ
    grpno                             NUMBER(7)       NOT NULL,
    indent                            NUMBER(2)       DEFAULT 0,
    ansnum                            NUMBER(5)       DEFAULT 0,  
   FOREIGN KEY (gu_no) REFERENCES gurume(gu_no) on delete cascade
 );
);