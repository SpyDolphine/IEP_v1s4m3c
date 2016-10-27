1. ���̺� ����
DROP TABLE interview;

CREATE TABLE interview (                 -- ���� ���̺�
  iv_no      NUMBER(7)       NOT NULL,   -- �� ��ȣ
  iv_title   VARCHAR2(120)   NOT NULL,   -- ����
  iv_content VARCHAR2(4000)  NOT NULL,   -- ����
  iv_date    DATE            default sysdate,   -- ��� �ð�
  PRIMARY KEY (iv_no)            -- �ѹ� ��ϵ� ���� �ߺ� �ȵ�
);


2. ���
  INSERT into interview(iv_no, 
                    iv_title, iv_content)
  VALUES((SELECT NVL(MAX(iv_no), 0)+1 as iv_no FROM interview), 
                    #{iv_title}, #{iv_content})
                    
 INSERT into interview(iv_no, iv_title, iv_content)
 VALUES((SELECT NVL(MAX(iv_no), 0)+1 as iv_no FROM interview), '����', '����')
                    
INSERT into interview(iv_no, iv_title, iv_content)
  VALUES((SELECT NVL(MAX(iv_no), 0)+1 as iv_no FROM interview), '����', '����')

3. ��ü ���
    SELECT iv_no, iv_title, iv_content
    FROM interview
    ORDER BY iv_no DESC
    
5. ����
    UPDATE interview 
    SET iv_title='���� ����', iv_content='�亯 ����' 
    WHERE iv_no=1
    
6. ����
    DELETE FROM interview
    WHERE iv_no=1