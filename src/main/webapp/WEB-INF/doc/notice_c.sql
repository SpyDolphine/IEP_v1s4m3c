1. ���̺� ����
DROP TABLE notice;

CREATE TABLE notice ( -- �������� ���̺�
  nt_no       NUMBER(7)      NOT NULL, -- �� ��ȣ
  me_no       NUMBER(7)      ,         -- ȸ����ȣ
  nt_title    VARCHAR2(120)  NOT NULL, -- ����
  nt_content  VARCHAR2(4000) NOT NULL, -- ����
  nt_date       DATE        default sysdate  NOT NULL, -- ��Ͻð�    
  --FOREIGN KEY (me_no) REFERENCES IEP_MEMBER (me_no), -- ī�װ���ȣ
  PRIMARY KEY (nt_no)       -- �ѹ� ��ϵ� ���� �ߺ� �ȵ�
);


2. ���

INSERT INTO notice(nt_no, me_no, nt_title, nt_content )
  VALUES((SELECT NVL(MAX(nt_no), 0)+1 as nt_no FROM notice), 1, '����', '����')

3. ���
    SELECT nt_no, nt_title
    FROM notice
    ORDER BY nt_no ASC 
    
4. ��ȸ
    SELECT nt_no, me_no, nt_title, nt_content, nt_date 
    FROM notice
    WHERE nt_no= 1
    
5. ����
    UPDATE notice 
    SET nt_title='���� ����', nt_content='���� ����' 
    WHERE nt_no=1
6. ����
    DELETE FROM notice
    WHERE nt_no=1
    
    
    SELECT gu_no, gu_area, gu_menu, gu_title, gu_name, gu_stars, gu_cnt, gu_date, file1, file2, size2, r
    FROM(
       SELECT gu_no, gu_area, gu_menu, gu_title, gu_name, gu_stars, gu_cnt, gu_date, file1, file2, size2, rownum as r
       FROM(
            SELECT gu_no, gu_area, gu_menu, gu_title, gu_name, gu_stars, gu_cnt, gu_date, file1, file2, size2
            FROM gurume
            ORDER BY gu_no DESC
       )
    )
    WHERE <![CDATA[r >=#{startNum} AND r <= #{endNum}]]>