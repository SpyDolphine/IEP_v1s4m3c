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

drop table sdat
CREATE TABLE sdat(
    sd_no                               NUMBER(7)      NOT NULL PRIMARY KEY,    -- ��� ��ȣ
    sc_no                             NUMBER(7)      NOT NULL,                -- ���� �� ��ȣ
    sd_name                            VARCHAR2(100)  NOT NULL,                -- �г���
    sd_cont                            VARCHAR2(4000) NOT NULL,                -- ����
    sd_date                            DATE           NOT NULL,                -- ��¥
    likeup                            NUMBER(7)       default 0,                  -- ��õ
    likedown                          NUMBER(7)       default 0,                  -- ����õ
    grpno                             NUMBER(7)       NOT NULL,
    indent                            NUMBER(2)       DEFAULT 0,
    ansnum                            NUMBER(5)       DEFAULT 0,  
   FOREIGN KEY (sc_no) REFERENCES seico(sc_no) on delete cascade
 );
);