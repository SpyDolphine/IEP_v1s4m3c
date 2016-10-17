CREATE TABLE category( --��з�
  categoryno  NUMBER(7)     NOT NULL PRIMARY KEY,  -- ��з� ��ȣ
  sort        VARCHAR2(50)  NOT NULL,              -- ��з�
  seqno       NUMBER(7)     DEFAULT 0 NOT NULL     -- ��� ����
);

1) ���
INSERT INTO category(categoryno, sort, seqno)
  VALUES((SELECT NVL(MAX(categoryno), 0)+1 as categoryno FROM category),   
  '��������', 1)
  
2) ��ȸ
SELECT categoryno, sort, seqno
FROM category
ORDER BY categoryno ASC

CREATE TABLE division( -- �ߺз�
  divisionno    NUMBER(7)                          NOT NULL, -- ī�װ� ��ȣ
  categoryno    NUMBER(10)                         NOT NULL, -- ��з� ��ȣ
  title         VARCHAR2(50)                       NOT NULL, -- ī�װ� �̸�
  seqno         NUMBER(3)       DEFAULT 1          NOT NULL, -- ī�װ� ��� ����
  visible       CHAR(1)         DEFAULT 'Y'        NOT NULL, -- ��� ���
  ids           CHAR(1)         DEFAULT 'M'    NOT NULL, -- ���� ����
  cnt           NUMBER(6)       DEFAULT 0          NOT NULL, -- ��ϵ� �� ��
  PRIMARY KEY(divisionno),
  FOREIGN KEY (categoryno) REFERENCES category (categoryno), -- ��з� ��ȣ
  FOREIGN KEY (me_no) REFERENCES IEP_MEMBER (me_no)          -- ȸ����ȣ
);

1) ���
INSERT INTO division(divisionno, categoryno, title, seqno, visible, ids)
VALUES((SELECT NVL(MAX(divisionno), 0)+1 as divisionno FROM division),
             1, '��������', 1, 'Y', 'M');

2) ��ȸ
SELECT divisionno, categoryno, title, seqno, visible, ids
FROM division 
ORDER BY seqno ASC;

CREATE TABLE board( -- �Խ���
  boardno      NUMBER(7)        NOT NULL        PRIMARY KEY, -- �Խ��� ��ȣ
  divisionno   NUMBER(7)        NOT NULL ,                   -- ī�װ���ȣ
  me_no        NUMBER(7)        NOT NULL ,                   -- ȸ�� ��ȣ
  title        VARCHAR2(200)    NOT NULL,                    -- �Խ��� �̸�
  content      VARCHAR2(4000)   NOT NULL,                    -- �Խ��� ����
  good         NUMBER(7)        DEFAULT 0       NOT NULL,    -- ��õ��
  file1        VARCHAR2(100)    NULL ,                       -- Thumb ����
  file2        VARCHAR2(50)     NULL ,                       -- ���� 2
  size2        NUMBER(9)        DEFAULT 0       NULL ,       -- ���� 2 ũ��
  map          VARCHAR2(500)    NULL ,                       -- ����
  cnt          NUMBER(7)        DEFAULT 0       NOT NULL,    -- ��ȸ��
  replycnt     NUMBER(7)        DEFAULT 0       NOT NULL,    -- ��ۼ�
  rdate        DATE             NOT NULL,                    -- �����
  grpno        NUMBER(7)        NOT NULL,                    -- �׷� ��ȣ
  indent       NUMBER(2)        DEFAULT 0       NOT NULL,    -- �亯 ����
  ansnum       NUMBER(5)        DEFAULT 0       NOT NULL,    -- �亯 ����
  FOREIGN KEY (divisionno) REFERENCES division (divisionno), -- ī�װ���ȣ
  FOREIGN KEY (me_no) REFERENCES IEP_MEMBER (me_no),          --ȸ����ȣ
  PRIMARY KEY(boardno)
);

1)��� 
INSERT INTO board(blogno,
                          blogcategoryno, me_no, title, content, good, file1, file2, size2, map, cnt, replycnt, rdate, 
                          grpno, indent, ansnum)  
VALUES((SELECT NVL(MAX(boardno), 0) + 1 as boardno FROM board),
            1, 4, '����', '����', 0, 'fall_m.jpg', 'fall.jpg', 0, 'map', 0, 0, sysdate,
            (SELECT NVL(MAX(grpno), 0) + 1 as grpno FROM blog), 0, 0);



