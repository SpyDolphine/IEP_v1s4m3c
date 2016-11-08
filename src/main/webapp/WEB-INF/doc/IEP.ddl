/**********************************/
/* Table Name: ȸ�� */
/**********************************/
CREATE TABLE IEP_MEMBER(
		me_no                         		INTEGER(10)		 NULL ,
		me_id                         		VARCHAR2(100)		 NULL ,
		me_pw                         		VARCHAR2(20)		 NULL ,
		me_nick                       		VARCHAR2(40)		 NULL ,
		me_name                       		VARCHAR2(40)		 NULL ,
		me_grade                      		CHAR(1)		 NULL ,
		me_zipcode                    		VARCHAR2(10)		 NULL ,
		me_addr1                      		VARCHAR2(100)		 NULL ,
		me_addr2                      		VARCHAR2(100)		 NULL ,
		me_tel                        		VARCHAR2(20)		 NULL ,
		me_date                       		DATE		 NULL ,
		me_vis                        		CHAR(1)		 NULL 
);

COMMENT ON TABLE IEP_MEMBER is 'ȸ��';
COMMENT ON COLUMN IEP_MEMBER.me_no is 'ȸ����ȣ';
COMMENT ON COLUMN IEP_MEMBER.me_id is 'ȸ�����̵�(�̸���)';
COMMENT ON COLUMN IEP_MEMBER.me_pw is '��й�ȣ';
COMMENT ON COLUMN IEP_MEMBER.me_nick is '�г���';
COMMENT ON COLUMN IEP_MEMBER.me_name is '�̸�';
COMMENT ON COLUMN IEP_MEMBER.me_grade is '���';
COMMENT ON COLUMN IEP_MEMBER.me_zipcode is '�����ȣ';
COMMENT ON COLUMN IEP_MEMBER.me_addr1 is '�ּ�1';
COMMENT ON COLUMN IEP_MEMBER.me_addr2 is '�ּ�2';
COMMENT ON COLUMN IEP_MEMBER.me_tel is '��ȭ��ȣ';
COMMENT ON COLUMN IEP_MEMBER.me_date is '���Գ�¥';
COMMENT ON COLUMN IEP_MEMBER.me_vis is 'Ż�𿩺�';


/**********************************/
/* Table Name: ��������Խ��� */
/**********************************/
CREATE TABLE serveyboard(
		sb_no                         		NUMBER(7)		 NULL ,
		title                         		VARCHAR2(200)		 NULL ,
		content                       		VARCHAR2(4000)		 NULL ,
		rdate                         		DATE		 NULL 
);

COMMENT ON TABLE serveyboard is '��������Խ���';
COMMENT ON COLUMN serveyboard.sb_no is '�Խ��ǹ�ȣ';
COMMENT ON COLUMN serveyboard.title is '����';
COMMENT ON COLUMN serveyboard.content is '����';
COMMENT ON COLUMN serveyboard.rdate is '��¥';


/**********************************/
/* Table Name: ���������׸� */
/**********************************/
CREATE TABLE servey(
		serveyno                      		NUMBER(7)		 NULL ,
		item                          		VARCHAR2(200)		 NULL ,
		cnt                           		NUMBER(10)		 NULL ,
		COLUMN_4                      		INTEGER(10)		 NULL 
);

COMMENT ON TABLE servey is '���������׸�';
COMMENT ON COLUMN servey.serveyno is '�׸��ȣ';
COMMENT ON COLUMN servey.item is '���������׸�';
COMMENT ON COLUMN servey.cnt is 'Column3';
COMMENT ON COLUMN servey.COLUMN_4 is 'Column4';



ALTER TABLE IEP_MEMBER ADD CONSTRAINT IDX_IEP_MEMBER_PK PRIMARY KEY (me_no);

ALTER TABLE serveyboard ADD CONSTRAINT IDX_serveyboard_PK PRIMARY KEY (sb_no);

