1. ���̺� ����
DROP TABLE aboutme;

CREATE TABLE aboutme (             -- �ڼҼ� ���̺�
  am_no      NUMBER(7)       NOT NULL,   -- �� ��ȣ
  am_title   VARCHAR2(4000)  NOT NULL,  -- ����
  am_content VARCHAR2(4000)  NOT NULL,   -- ����
  am_date    DATE            default sysdate,   -- ��� �ð�
  PRIMARY KEY (am_no)            -- �ѹ� ��ϵ� ���� �ߺ� �ȵ�
);



2. ���
  INSERT into aboutme(am_no, 
                    am_title, am_content, fq_CH)
  VALUES((SELECT NVL(MAX(am_no), 0)+1 as am_no FROM aboutme), 
                    #{am_title}, #{am_content}, #{fq_CH})
  INSERT into aboutme(am_no, am_title, am_content)
 VALUES((SELECT NVL(MAX(am_no), 0)+1 as am_no FROM aboutme), '����', '����')
                    
INSERT into aboutme(am_no, am_title, am_content , fq_CH)
  VALUES((SELECT NVL(MAX(am_no), 0)+1 as am_no FROM aboutme), 1, '����', '����', 'C')

3. ��ü ���
    SELECT am_no, am_title, am_content
    FROM aboutme
    ORDER BY am_no ASC
    
5. ����
    UPDATE aboutme 
    SET am_title='���� ����', am_content='�亯 ����' 
    WHERE am_no=1
6. ����
    DELETE FROM notice
    WHERE am_no=1