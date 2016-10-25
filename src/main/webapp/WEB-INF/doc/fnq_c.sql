1. ���̺� ����
DROP TABLE notice;

CREATE TABLE fnq ( -- �������� ���̺�
  fq_no           NUMBER(7)      NOT NULL, -- �� ��ȣ
  me_no           NUMBER(7)      ,         -- ȸ����ȣ
  fq_question     VARCHAR2(4000)  NOT NULL, -- ����
  fq_answer       VARCHAR2(4000) NOT NULL, -- �亯
  fq_date         DATE        default sysdate  NOT NULL, -- ��Ͻð�    
  --FOREIGN KEY (me_id) REFERENCES IEP_MEMBER (me_id), -- ī�װ���ȣ
  PRIMARY KEY (fq_no)       -- �ѹ� ��ϵ� ���� �ߺ� �ȵ�
);


2. ���

INSERT IfqO notice(fq_no, me_no, fq_question, fq_answer )
  VALUES((SELECT NVL(MAX(fq_no), 0)+1 as fq_no FROM notice), 1, '����', '����')

3. ���
    SELECT fq_no, fq_question
    FROM notice
    ORDER BY fq_no ASC 
    
4. ��ȸ
    SELECT fq_no, me_no, fq_question, fq_answer, fq_date 
    FROM notice
    WHERE fq_no= 1
    
5. ����
    UPDATE notice 
    SET fq_question='���� ����', fq_answer='�亯 ����' 
    WHERE fq_no=1
6. ����
    DELETE FROM notice
    WHERE fq_no=1