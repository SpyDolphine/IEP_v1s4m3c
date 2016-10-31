1. ���̺� ����
DROP TABLE fnq;

CREATE TABLE fnq (                         -- ���ֹ��� ����
  fq_no           NUMBER(7)      NOT NULL, -- �� ��ȣ
  me_no           NUMBER(7)      ,         -- ȸ����ȣ
  fq_question     VARCHAR2(4000) NOT NULL, -- ����
  fq_answer       VARCHAR2(4000) NOT NULL, -- �亯
  fq_date         DATE        default sysdate  NOT NULL, -- ��Ͻð�    
  fq_CH           CHAR      NOT NULL,            -- Ȩ�������������� ȸ���������� �к�
  --FOREIGN KEY (me_no) REFERENCES IEP_MEMBER (me_no), -- ī�װ���ȣ
  PRIMARY KEY (fq_no)       -- �ѹ� ��ϵ� ���� �ߺ� �ȵ�
);



2. ���
  INSERT into fnq(fq_no, 
                    me_no, fq_question, fq_answer, fq_CH)
  VALUES((SELECT NVL(MAX(fq_no), 0)+1 as fq_no FROM fnq), 
                    #{me_no}, #{fq_question}, #{fq_answer}, #{fq_CH})
  INSERT into fnq(fq_no, 
                    me_no, fq_question, fq_answer, fq_CH)
 VALUES((SELECT NVL(MAX(fq_no), 0)+1 as fq_no FROM fnq), 1, '����', '����', 'C')
                    
INSERT into fnq(fq_no, me_no, fq_question, fq_answer , fq_CH)
  VALUES((SELECT NVL(MAX(fq_no), 0)+1 as fq_no FROM fnq), 1, '����', '����', 'C')

3. ��ü ���
    SELECT fq_no, fq_question, fq_answer, fq_CH
    FROM fnq
    ORDER BY fq_no ASC
3-1. ȸ������ ���

    SELECT fq_no, fq_question, fq_answer
    FROM fnq
    where fq_CH = 'C'
    ORDER BY fq_no ASC 
    
3-2. Ȩ������ ���

    SELECT fq_no, fq_question, fq_answer
    FROM fnq
    where fq_CH = 'H'
    ORDER BY fq_no ASC 
    
5. ����
    UPDATE fnq 
    SET fq_question='���� ����', fq_answer='�亯 ����' 
    WHERE fq_no=1
6. ����
    DELETE FROM notice
    WHERE fq_no=1
    
    
        SELECT COUNT(*) as cnt
    FROM (select fq_ch
            from fnq 
             where fq_ch = 'H' )
        WHERE fq_question LIKE %a% and fq_ch = 'H'