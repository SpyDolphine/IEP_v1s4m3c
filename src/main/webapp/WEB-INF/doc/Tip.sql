1. ���̺� ����
DROP TABLE tip;

CREATE TABLE tip (
  tp_no      NUMBER(7)       NOT NULL,   -- �� ��ȣ
  tp_title   VARCHAR2(4000)  NOT NULL,  -- ����
  tp_content VARCHAR2(4000)  NOT NULL,   -- ����
  tp_ch      VARCHAR2(2)     NOT NULL,   -- ����ǥ��
  tp_date    DATE            default sysdate,   -- ��� �ð�
  PRIMARY KEY (tp_no)            -- �ѹ� ��ϵ� ���� �ߺ� �ȵ�
);



2. ���
  INSERT into tip(tp_no, 
                    tp_title, tp_content, tp_ch)
  VALUES((SELECT NVL(MAX(tp_no), 0)+1 as tp_no FROM tip), 
                    #{tp_title}, #{tp_content}, #{tp_ch})
                    
  INSERT into tip(tp_no, tp_title, tp_content, tp_ch)
    VALUES((SELECT NVL(MAX(tp_no), 0)+1 as tp_no FROM tip), '����', '����', 'A')
                    
  INSERT into tip(tp_no, tp_title, tp_content , tp_ch)
    VALUES((SELECT NVL(MAX(tp_no), 0)+1 as tp_no FROM tip), 1, '����', '����', 'C')

3. ��ü ���
    SELECT tp_no, tp_title, tp_content, tp_ch
    FROM tip
    ORDER BY tp_no DESC
    
4. �Խ��Ǻ� ���
-- �ڼҼ� ���̺�
    SELECT tp_no, tp_title, tp_content, tp_ch
    FROM tip
    WHERE tp_ch = 'A'
    ORDER BY tp_no DESC
-- ���� ���̺�    
    SELECT tp_no, tp_title, tp_content, tp_ch
    FROM tip
    WHERE tp_ch = 'I'
    ORDER BY tp_no DESC

    SELECT tp_no, tp_title, tp_content, tp_ch
    FROM tip
    WHERE tp_ch = #{tp_ch}
    ORDER BY tp_no DESC
    
5. ����
    UPDATE tip 
    SET tp_title='���� ����', tp_content='�亯 ����' , tp_ch='A'
    WHERE tp_no=1
6. ����
    DELETE FROM tip
    WHERE tp_no=1