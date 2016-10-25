CREATE TABLE serveyboard( -- �Խ���
  sb_no        NUMBER(7)        NOT NULL, -- �Խ��� ��ȣ
  title        VARCHAR2(200)    NOT NULL,                    -- �Խ��� �̸�
  content      VARCHAR2(4000)   NOT NULL,                    -- �Խ��� ����
  rdate        DATE             NOT NULL,                    -- �����
  PRIMARY KEY(sb_no) 
);

CREATE TABLE servey( -- ��������
  serveyno    NUMBER(7)     NOT NULL,    --�������� ��ȣ
  sb_no       NUMBER(7)     NOT NULL,    --�Խ��� ��ȣ
  item        VARCHAR2(200) NOT NULL,    --�������� �׸�
  cnt         NUMBER(7)     DEFAULT 0,   --�������� ī��Ʈ
  aver        NUMBER(3)     DEFAULT 0,   --��ռ�ġ
  FOREIGN KEY (sb_no) REFERENCES serveyboard (sb_no) ON DELETE CASCADE, -- ���� �ѹ�
  PRIMARY KEY(serveyno)
);

select * from servey
ALTER TABLE servey ADD
(
    CONSTRAINT sb_no
    FOREIGN KEY ( serveyno )
        REFERENCES ���TABLE ( NUM )
    ON DELETE CASCADE
);




DELETE FROM serveyboard WHERE sb_no=1
DELETE serveyboard WHERE sb_no=1 [CASCADE]

drop table servey;
drop table serveyboard;
select * from servey
select * from serveyboard

INSERT INTO serveyboard(sb_no, title, content, rdate) 
  VALUES ((SELECT NVL(MAX(sb_no), 0) + 1 as sb_no FROM serveyboard), '��������1', '����', sysdate);
  
INSERT INTO servey(serveyno, sb_no, item) 
  VALUES ((SELECT NVL(MAX(serveyno), 0) + 1 as serveyno FROM servey), 1, '�������� �׸� 1');
  
INSERT INTO servey(serveyno, sb_no, item)  
  VALUES ((SELECT NVL(MAX(serveyno), 0) + 1 as serveyno FROM servey), 1, '�������� �׸� 2');
  
INSERT INTO servey(serveyno, sb_no, item) 
  VALUES ((SELECT NVL(MAX(serveyno), 0) + 1 as serveyno FROM servey), 1, '�������� �׸� 3');
  
UPDATE servey
SET aver
WHERE serveyno=1 AND sb_no = 1;

    UPDATE serveyboard 
    SET title='�����̶��', content='�����̶��'
    WHERE sb_no=1

-- ��ü ��
select sum(cnt) from servey where sb_no = 3

-- ����� ���
select item, cnt,  
  round((ratio_to_report(cnt) over () * 100.00), 2) as avg 
FROM servey
where sb_no = 3 









