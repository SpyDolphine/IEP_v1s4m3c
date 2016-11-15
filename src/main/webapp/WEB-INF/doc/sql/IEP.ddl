/**********************************/
/* Table Name: ȸ������ */
/**********************************/
CREATE TABLE member(
		me_no                         		INTEGER(7)		 NULL ,
		me_id                         		VARCHAR2(50)		 NOT NULL,
		me_pw                         		VARCHAR2(50)		 NOT NULL,
		me_nick                       		VARCHAR2(50)		 NOT NULL,
		me_name                       		VARCHAR2(50)		 NOT NULL,
		me_grade                      		CHAR(1)		 NOT NULL,
		me_zip                        		VARCHAR2(15)		 NULL ,
		me_addr1                      		VARCHAR2(50)		 NULL ,
		me_addr2                      		VARCHAR2(50)		 NULL ,
		me_tel                        		VARCHAR2(30)		 NOT NULL,
		me_vis                        		CHAR(1)		 DEFAULT Y		 NOT NULL,
		me_auth                       		INTEGER(10)		 NOT NULL,
		me_confirm                    		CHAR(1)		 DEFAULT N		 NULL ,
		me_date                       		DATE		 NOT NULL
);

COMMENT ON TABLE member is 'ȸ������';
COMMENT ON COLUMN member.me_no is 'ȸ����ȣ';
COMMENT ON COLUMN member.me_id is 'ȸ�����̵�';
COMMENT ON COLUMN member.me_pw is 'ȸ����й�ȣ';
COMMENT ON COLUMN member.me_nick is 'ȸ���г���';
COMMENT ON COLUMN member.me_name is 'ȸ�����̵�';
COMMENT ON COLUMN member.me_grade is 'ȸ�����';
COMMENT ON COLUMN member.me_zip is '�����ȣ';
COMMENT ON COLUMN member.me_addr1 is '�ּ�';
COMMENT ON COLUMN member.me_addr2 is '���ּ�';
COMMENT ON COLUMN member.me_tel is '��ȭ��ȣ';
COMMENT ON COLUMN member.me_vis is 'Ż�𿩺�';
COMMENT ON COLUMN member.me_auth is '������ȣ';
COMMENT ON COLUMN member.me_confirm is '��������';
COMMENT ON COLUMN member.me_date is '�����';


/**********************************/
/* Table Name: �����Խ��� */
/**********************************/
CREATE TABLE commu_free(
		cm_no                         		NUMBER(7)		 NOT NULL,
		cm_title                      		VARCHAR2(120)		 NOT NULL,
		cm_content                    		VARCHAR2(4000)		 NOT NULL,
		likeup                        		NUMBER(7)		 DEFAULT 0		 NULL ,
		likedown                      		NUMBER(7)		 DEFAULT 0		 NULL ,
		cm_rdate                      		DATE		 NOT NULL,
		me_no                         		NUMBER(10)		 NOT NULL,
		me_id                         		VARCHAR2(30)		 NOT NULL
);

COMMENT ON TABLE commu_free is '�����Խ���';
COMMENT ON COLUMN commu_free.cm_no is '�� ��ȣ';
COMMENT ON COLUMN commu_free.cm_title is '�Խñ� ����';
COMMENT ON COLUMN commu_free.cm_content is '�� ����';
COMMENT ON COLUMN commu_free.likeup is '��õ';
COMMENT ON COLUMN commu_free.likedown is '����õ';
COMMENT ON COLUMN commu_free.cm_rdate is '��ϳ�¥';
COMMENT ON COLUMN commu_free.me_no is 'ȸ����ȣ';
COMMENT ON COLUMN commu_free.me_id is 'ȸ���г���';


/**********************************/
/* Table Name: Ŀ�´�Ƽ �Խ��� */
/**********************************/
CREATE TABLE community(
		cm_no                         		NUMBER(7)		 DEFAULT 1		 NOT NULL,
		cm_title                      		VARCHAR2(120)		 NOT NULL,
		cm_content                    		VARCHAR2(4000)		 NOT NULL,
		file1                         		VARCHAR2(100)		 NULL ,
		file2                         		VARCHAR2(50)		 NULL ,
		size2                         		NUMBER(9)		 DEFAULT 0		 NULL ,
		cm_likeit                     		NUMBER(7)		 DEFAULT 0		 NULL ,
		cm_map                        		VARCHAR2(1024)		 NULL ,
		cm_url                        		VARCHAR2(500)		 NULL ,
		cm_cnt                        		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		cm_date                       		DATE		 NOT NULL,
		replycnt                      		NUMBER(7)		 DEFAULT 0		 NULL ,
		grpno                         		NUMBER(7)		 NOT NULL,
		indent                        		NUMBER(2)		 DEFAULT 0		 NOT NULL,
		ansnum                        		NUMBER(2)		 DEFAULT 0		 NOT NULL,
		me_no                         		NUMBER(10)		 NULL 
);

COMMENT ON TABLE community is 'Ŀ�´�Ƽ �Խ���';
COMMENT ON COLUMN community.cm_no is '�� ��ȣ';
COMMENT ON COLUMN community.cm_title is '�Խñ� ����';
COMMENT ON COLUMN community.cm_content is '�� ����';
COMMENT ON COLUMN community.file1 is '����1';
COMMENT ON COLUMN community.file2 is '����2';
COMMENT ON COLUMN community.size2 is '������';
COMMENT ON COLUMN community.cm_likeit is '���ƿ�';
COMMENT ON COLUMN community.cm_map is '����';
COMMENT ON COLUMN community.cm_url is '��ó  ';
COMMENT ON COLUMN community.cm_cnt is '��ȸ��';
COMMENT ON COLUMN community.cm_date is '��ϳ�¥';
COMMENT ON COLUMN community.replycnt      is '��ۼ�';
COMMENT ON COLUMN community.grpno is '�׷��ȣ';
COMMENT ON COLUMN community.indent is '��۹�ȣ';
COMMENT ON COLUMN community.ansnum is '���Ĺ�ȣ';
COMMENT ON COLUMN community.me_no is 'ȸ����ȣ';


/**********************************/
/* Table Name: ��� */
/**********************************/
CREATE TABLE commu_comment(
		rno                           		NUMBER(7)		 NOT NULL,
		me_no                         		NUMBER(7)		 NOT NULL,
		me_id                         		VARCHAR2(30)		 NOT NULL,
		rcontent                      		VARCHAR2(4000)		 NOT NULL,
		likeup                        		NUMBER(7)		 DEFAULT 0		 NULL ,
		likedown                      		NUMBER(7)		 NULL ,
		grpno                         		NUMBER(7)		 NOT NULL,
		indent                        		NUMBER(2)		 DEFAULT 0		 NULL ,
		ansnum                        		NUMBER(5)		 DEFAULT 0		 NULL ,
		if_no                         		NUMBER(7)		 NULL ,
		me_id                         		NUMBER(10)		 NULL ,
		cm_no                         		NUMBER(7)		 NULL 
);

COMMENT ON TABLE commu_comment is '���';
COMMENT ON COLUMN commu_comment.rno is '�� ��ȣ';
COMMENT ON COLUMN commu_comment.me_no is 'ȸ����ȣ';
COMMENT ON COLUMN commu_comment.me_id  is 'ȸ�����̵�';
COMMENT ON COLUMN commu_comment.rcontent is '�� ����';
COMMENT ON COLUMN commu_comment.likeup is '��õ';
COMMENT ON COLUMN commu_comment.likedown is '����õ';
COMMENT ON COLUMN commu_comment.grpno is '�׷�ѹ�';
COMMENT ON COLUMN commu_comment.indent is '��۳ѹ�';
COMMENT ON COLUMN commu_comment.ansnum is '���ĳѹ�';
COMMENT ON COLUMN commu_comment.if_no is '�۹�ȣ';
COMMENT ON COLUMN commu_comment.me_id is 'ȸ�����̵�';
COMMENT ON COLUMN commu_comment.cm_no is '�� ��ȣ';


/**********************************/
/* Table Name: ������ */
/**********************************/
CREATE TABLE contest(
		ct_no                         		NUMBER(7)		 NOT NULL,
		me_no                         		VARCHAR2(7)		 NOT NULL,
		ct_title                      		VARCHAR2(300)		 NOT NULL,
		ct_host                       		VARCHAR2(200)		 NOT NULL,
		ct_supervision                		VARCHAR2(200)		 NOT NULL,
		ct_entry                      		VARCHAR2(200)		 NULL ,
		ct_enter                      		VARCHAR2(200)		 NULL ,
		ct_award                      		VARCHAR2(200)		 NULL ,
		ct_startdate                  		VARCHAR2(200)		 NULL ,
		ct_enddate                    		VARCHAR2(200)		 NULL ,
		daydate                       		VARCHAR2(200)		 NULL ,
		ct_statedate                  		VARCHAR2(200)		 NULL ,
		ct_url                        		VARCHAR2(200)		 NULL ,
		ct_content                    		VARCHAR2(4000)		 NULL ,
		ct_file1                      		VARCHAR2(100)		 NULL ,
		ct_file2                      		VARCHAR2(50)		 NULL ,
		ct_size2                      		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		ct_cnt                        		INTEGER(7)		 DEFAULT 0		 NOT NULL,
		ct-rdate                      		DATE		 NOT NULL
);

COMMENT ON TABLE contest is '������';
COMMENT ON COLUMN contest.ct_no is '�� ��ȣ';
COMMENT ON COLUMN contest.me_no is 'ȸ����ȣ';
COMMENT ON COLUMN contest.ct_title is '������ ����';
COMMENT ON COLUMN contest.ct_host is '����';
COMMENT ON COLUMN contest.ct_supervision is '�ְ�';
COMMENT ON COLUMN contest.ct_entry is '�����ڰ�';
COMMENT ON COLUMN contest.ct_enter is '�������';
COMMENT ON COLUMN contest.ct_award is '�û󳻿�';
COMMENT ON COLUMN contest.ct_startdate is '�������� ������';
COMMENT ON COLUMN contest.ct_enddate is '�������� ������';
COMMENT ON COLUMN contest.daydate is '������ ����';
COMMENT ON COLUMN contest.ct_statedate is '������ ��ǥ��';
COMMENT ON COLUMN contest.ct_url is '���������� ������';
COMMENT ON COLUMN contest.ct_content is '������ �󼼳���';
COMMENT ON COLUMN contest.ct_file1 is '����(������)';
COMMENT ON COLUMN contest.ct_file2 is '����2';
COMMENT ON COLUMN contest.ct_size2 is '���� ������';
COMMENT ON COLUMN contest.ct_cnt is '��ȸ��';
COMMENT ON COLUMN contest.ct-rdate is '��� �ð�';


/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE calender(
		cl_no                         		NUMBER(7)		 NOT NULL,
		cl_id                         		VARCHAR2(100)		 NOT NULL,
		cl_title                      		VARCHAR2(120)		 NOT NULL,
		cl_content                    		VARCHAR2(100)		 NOT NULL,
		cl_start                      		DATE		 NOT NULL,
		cl_end                        		DATE		 NOT NULL,
		cl_date                       		DATE		 NOT NULL,
		me_no                         		INTEGER(7)		 NULL ,
		ex_no                         		NUMBER(7)		 NULL ,
		lc_no                         		NUMBER(7)		 NULL ,
		cn_no                         		NUMBER(7)		 NULL ,
		ct_no                         		NUMBER(7)		 NULL 
);

COMMENT ON TABLE calender is '����';
COMMENT ON COLUMN calender.cl_no is '������ȣ';
COMMENT ON COLUMN calender.cl_id is '�����̸���';
COMMENT ON COLUMN calender.cl_title is '���� ����';
COMMENT ON COLUMN calender.cl_content is '��������';
COMMENT ON COLUMN calender.cl_start is '����������';
COMMENT ON COLUMN calender.cl_end is '����������';
COMMENT ON COLUMN calender.cl_date is '��� �ð�';
COMMENT ON COLUMN calender.me_no is 'ȸ����ȣ';
COMMENT ON COLUMN calender.ex_no is '�� ��ȣ';
COMMENT ON COLUMN calender.lc_no is '�� ��ȣ';
COMMENT ON COLUMN calender.cn_no is '�� ��ȣ';
COMMENT ON COLUMN calender.ct_no is '�� ��ȣ';


/**********************************/
/* Table Name: ��ũ�� */
/**********************************/
CREATE TABLE scrap(
		sp_no                         		NUMBER(7)		 NOT NULL,
		sp_id                         		VARCHAR2(100)		 NOT NULL,
		sp_title                      		VARCHAR2(120)		 NOT NULL,
		sp_content                    		VARCHAR2(100)		 NOT NULL,
		sp_date                       		DATE		 NOT NULL,
		me_no                         		INTEGER(7)		 NULL ,
		ex_no                         		NUMBER(7)		 NULL ,
		lc_no                         		NUMBER(7)		 NULL ,
		cn_no                         		NUMBER(7)		 NULL ,
		ct_no                         		NUMBER(7)		 NULL 
);

COMMENT ON TABLE scrap is '��ũ��';
COMMENT ON COLUMN scrap.sp_no is '��ũ����ȣ';
COMMENT ON COLUMN scrap.sp_id is '��ũ�����̵�';
COMMENT ON COLUMN scrap.sp_title is '��ũ�� ����';
COMMENT ON COLUMN scrap.sp_content is '��ũ������';
COMMENT ON COLUMN scrap.sp_date is '��� �ð�';
COMMENT ON COLUMN scrap.me_no is 'ȸ����ȣ';
COMMENT ON COLUMN scrap.ex_no is '�� ��ȣ';
COMMENT ON COLUMN scrap.lc_no is '�� ��ȣ';
COMMENT ON COLUMN scrap.cn_no is '�� ��ȣ';
COMMENT ON COLUMN scrap.ct_no is '�� ��ȣ';


/**********************************/
/* Table Name: ������� */
/**********************************/
CREATE TABLE enterprise_info(
		ei_no                         		NUMBER(7)		 NOT NULL,
		ei_corporationname            		INTEGER(50)		 NOT NULL,
		ei_slotname                   		VARCHAR2(50)		 NOT NULL,
		ei_crn                        		VARCHAR2(50)		 NOT NULL,
		ei_type                       		VARCHAR2(15)		 DEFAULT 15		 NOT NULL,
		ei_employees                  		NUMBER(17)		 NOT NULL,
		ei_established                		VARCHAR2(15)		 NULL ,
		ei_capitalstock               		NUMBER(50)		 NOT NULL,
		ei_sales                      		NUMBER(50)		 NOT NULL,
		ei_jobfunctions               		VARCHAR2(50)		 NOT NULL,
		ei_business                   		VARCHAR2(50)		 NOT NULL,
		ei_url                        		VARCHAR2(500)		 NULL ,
		ei_ci                         		VARCHAR2(50)		 NOT NULL,
		ei_majorbusiness              		VARCHAR2(50)		 NOT NULL,
		ei_logofile1                  		VARCHAR2(100)		 NULL ,
		ei_logosize1                  		NUMBER(8)		 NULL ,
		ei_map                        		VARCHAR2(1024)		 NOT NULL,
		ei_tpic                       		VARCHAR2(30)		 NULL ,
		ei_date                       		DATE		 NOT NULL,
		me_no                         		NUMBER(7)		 NULL 
);

COMMENT ON TABLE enterprise_info is '�������';
COMMENT ON COLUMN enterprise_info.ei_no is '������� ��ȣ';
COMMENT ON COLUMN enterprise_info.ei_corporationname is 'ȸ�� �̸�';
COMMENT ON COLUMN enterprise_info.ei_slotname is '��ǥ�� �̸�';
COMMENT ON COLUMN enterprise_info.ei_crn is '����ڵ�� ��ȣ';
COMMENT ON COLUMN enterprise_info.ei_type is '�������';
COMMENT ON COLUMN enterprise_info.ei_employees is '�����';
COMMENT ON COLUMN enterprise_info.ei_established is '������';
COMMENT ON COLUMN enterprise_info.ei_capitalstock is '�ں���';
COMMENT ON COLUMN enterprise_info.ei_sales is '�����';
COMMENT ON COLUMN enterprise_info.ei_jobfunctions is '������ (����)';
COMMENT ON COLUMN enterprise_info.ei_business is '������ (����)';
COMMENT ON COLUMN enterprise_info.ei_url is 'ȸ�� URL';
COMMENT ON COLUMN enterprise_info.ei_ci is '��� �Ұ�';
COMMENT ON COLUMN enterprise_info.ei_majorbusiness is '�ֿ� ����';
COMMENT ON COLUMN enterprise_info.ei_logofile1 is '�ΰ����ϸ�';
COMMENT ON COLUMN enterprise_info.ei_logosize1 is '�ΰ�ũ��';
COMMENT ON COLUMN enterprise_info.ei_map is '���� ��';
COMMENT ON COLUMN enterprise_info.ei_tpic is 'ä������';
COMMENT ON COLUMN enterprise_info.ei_date is '��ϳ�¥';
COMMENT ON COLUMN enterprise_info.me_no is 'ȸ����ȣ';


/**********************************/
/* Table Name: ��� */
/**********************************/
CREATE TABLE bl_comment(
		bc_commentno                  		NUMBER(7)		 NOT NULL,
		bc_email                      		VARCHAR2(100)		 NOT NULL,
		bc_content                    		VARCHAR2(4000)		 NOT NULL,
		bc_like                       		NUMBER(7)		 NOT NULL,
		bc_date                       		DATE		 NOT NULL,
		me_no                         		NUMBER(7)		 NOT NULL,
		bl_no                         		NUMBER(7)		 NULL ,
		em_no                         		NUMBER(7)		 NULL 
);

COMMENT ON TABLE bl_comment is '���';
COMMENT ON COLUMN bl_comment.bc_commentno is '�� ��ȣ';
COMMENT ON COLUMN bl_comment.bc_email is '�̸���';
COMMENT ON COLUMN bl_comment.bc_content is '�� ����';
COMMENT ON COLUMN bl_comment.bc_like is '���ƿ�';
COMMENT ON COLUMN bl_comment.bc_date is '��ϳ�¥';
COMMENT ON COLUMN bl_comment.me_no is 'ȸ����ȣ';
COMMENT ON COLUMN bl_comment.bl_no is '�� ��ȣ';
COMMENT ON COLUMN bl_comment.em_no is '�� ��ȣ';


/**********************************/
/* Table Name: ������Ʈ */
/**********************************/
CREATE TABLE blacklist(
		bl_no                         		NUMBER(7)		 NULL ,
		bl_email                      		VARCHAR2(100)		 NOT NULL,
		bl_title                      		VARCHAR2(120)		 NOT NULL,
		bl_content                    		VARCHAR2(4000)		 NOT NULL,
		bl_cnt                        		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		bl_like                       		NUMBER(7)		 NOT NULL,
		bl_date                       		DATE		 NOT NULL,
		bc_commentno                  		NUMBER(7)		 NULL 
);

COMMENT ON TABLE blacklist is '������Ʈ';
COMMENT ON COLUMN blacklist.bl_no is '�� ��ȣ';
COMMENT ON COLUMN blacklist.bl_email is '�̸���';
COMMENT ON COLUMN blacklist.bl_title is '�Խñ� ����';
COMMENT ON COLUMN blacklist.bl_content is '�Խñ� ����';
COMMENT ON COLUMN blacklist.bl_cnt is '��ȸ��';
COMMENT ON COLUMN blacklist.bl_like is '���ƿ�';
COMMENT ON COLUMN blacklist.bl_date is '��ϳ�¥';
COMMENT ON COLUMN blacklist.bc_commentno is '�� ��ȣ';


/**********************************/
/* Table Name: ä������ */
/**********************************/
CREATE TABLE employment_info(
		em_no                         		NUMBER(7)		 NOT NULL,
		em_title                      		VARCHAR2(120)		 NOT NULL,
		em_content                    		VARCHAR2(4000)		 NOT NULL,
		em_cof                        		VARCHAR2(1000)		 NOT NULL,
		em_pi                         		VARCHAR2(1000)		 NOT NULL,
		em_startdate                  		VARCHAR2(15)		 NULL ,
		em_enddate                    		VARCHAR2(15)		 NULL ,
		em_statedate                  		VARCHAR2(15)		 NULL ,
		em_interviewdate              		VARCHAR2(15)		 NULL ,
		em_rp                         		VARCHAR2(1000)		 NOT NULL,
		em_other                      		VARCHAR2(1000)		 NOT NULL,
		em_occupations                		VARCHAR2(30)		 NOT NULL,
		em_et                         		VARCHAR2(30)		 NOT NULL,
		em_lastschool                 		VARCHAR2(30)		 NOT NULL,
		em_salary                     		VARCHAR2(30)		 NOT NULL,
		em_rank                       		VARCHAR2(30)		 NOT NULL,
		em_position                   		VARCHAR2(30)		 NOT NULL,
		em_url                        		VARCHAR2(500)		 NOT NULL,
		em_supportformfile1           		VARCHAR2(100)		 NULL ,
		em_supportformsize1           		NUMBER(10)		 DEFAULT 0		 NULL ,
		em_cnt                        		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		em_date                       		DATE		 NOT NULL,
		ei_no                         		NUMBER(7)		 NULL 
);

COMMENT ON TABLE employment_info is 'ä������';
COMMENT ON COLUMN employment_info.em_no is '�� ��ȣ';
COMMENT ON COLUMN employment_info.em_title is 'ä�� ����';
COMMENT ON COLUMN employment_info.em_content is 'ä�� ����';
COMMENT ON COLUMN employment_info.em_cof is '�ڰ� ���';
COMMENT ON COLUMN employment_info.em_pi is '�ڰ� ���(������)';
COMMENT ON COLUMN employment_info.em_startdate is 'ä�� ���� ������';
COMMENT ON COLUMN employment_info.em_enddate is 'ä�� ���� ������';
COMMENT ON COLUMN employment_info.em_statedate is 'ä�� ���� ��ǥ��';
COMMENT ON COLUMN employment_info.em_interviewdate is 'ä�� ���� ����';
COMMENT ON COLUMN employment_info.em_rp is 'ä������';
COMMENT ON COLUMN employment_info.em_other is '��Ÿ';
COMMENT ON COLUMN employment_info.em_occupations is '������(����)';
COMMENT ON COLUMN employment_info.em_et is '������(�������)';
COMMENT ON COLUMN employment_info.em_lastschool is '������(�����з�)';
COMMENT ON COLUMN employment_info.em_salary is '������(�޿�)';
COMMENT ON COLUMN employment_info.em_rank is '������(����)';
COMMENT ON COLUMN employment_info.em_position is '������(��å)';
COMMENT ON COLUMN employment_info.em_url is 'URL';
COMMENT ON COLUMN employment_info.em_supportformfile1 is 'ä�� ������� ���ϸ� 1';
COMMENT ON COLUMN employment_info.em_supportformsize1 is 'ä�� ������� ���� ũ�� 1 ';
COMMENT ON COLUMN employment_info.em_cnt is '��ȸ��';
COMMENT ON COLUMN employment_info.em_date is '��ϳ�¥';
COMMENT ON COLUMN employment_info.ei_no is '������� ��ȣ';


/**********************************/
/* Table Name: �߰�ŷ��Խ��� */
/**********************************/
CREATE TABLE ITOS(
		IO_NO                         		NUMBER(7)		 NOT NULL,
		IO_TITLE                      		VARCHAR2(120)		 NOT NULL,
		IO_CONTENT                    		VARCHAR2(4000)		 NOT NULL,
		IO_GOOD                       		NUMBER(7)		 NOT NULL,
		IO_FILE1                      		VARCHAR2(100)		 NULL ,
		IO_FILE2                      		VARCHAR2(500)		 NULL ,
		IO_SIZE2                      		NUMBER(9)		 NULL ,
		IO_CNT                        		NUMBER(7)		 NOT NULL,
		IO_REPLYCNT                   		NUMBER(7)		 NOT NULL,
		IO_DATE                       		DATE		 NOT NULL,
		IO_COST                       		VARCHAR2(200)		 NOT NULL,
		IO_GRPNO                      		NUMBER(2)		 NOT NULL,
		IO_INDENT                     		NUMBER(2)		 NOT NULL,
		IO_ANSNUM                     		NUMBER(5)		 NOT NULL,
		me_no                         		INTEGER(7)		 NULL 
);

COMMENT ON TABLE ITOS is '�߰�ŷ��Խ���';
COMMENT ON COLUMN ITOS.IO_NO is '�۹�ȣ';
COMMENT ON COLUMN ITOS.IO_TITLE is '������';
COMMENT ON COLUMN ITOS.IO_CONTENT is '�۳���';
COMMENT ON COLUMN ITOS.IO_GOOD is '��õ��';
COMMENT ON COLUMN ITOS.IO_FILE1 is '����1';
COMMENT ON COLUMN ITOS.IO_FILE2 is '����2';
COMMENT ON COLUMN ITOS.IO_SIZE2 is '������2';
COMMENT ON COLUMN ITOS.IO_CNT is '��ȸ��';
COMMENT ON COLUMN ITOS.IO_REPLYCNT is '�����ȸ��';
COMMENT ON COLUMN ITOS.IO_DATE is '�������';
COMMENT ON COLUMN ITOS.IO_COST is '�ݾ�';
COMMENT ON COLUMN ITOS.IO_GRPNO is '�׷��ȣ';
COMMENT ON COLUMN ITOS.IO_INDENT is '�亯����';
COMMENT ON COLUMN ITOS.IO_ANSNUM is '�亯����';
COMMENT ON COLUMN ITOS.me_no is 'ȸ����ȣ';


/**********************************/
/* Table Name: �ڰ��� */
/**********************************/
CREATE TABLE LICENSE(
		LC_NO                         		NUMBER(7)		 NOT NULL,
		LC_TITLE                      		VARCHAR2(120)		 NOT NULL,
		LC_CONTENT                    		VARCHAR2(4000)		 NOT NULL,
		LC_FILE1                      		VARCHAR2(100)		 NULL ,
		LC_FILE2                      		VARCHAR2(500)		 NULL ,
		LC_SIZE2                      		NUMBER(9)		 NULL ,
		LC_CNT                        		NUMBER(7)		 NOT NULL,
		LC_DATE                       		DATE		 NOT NULL,
		LC_DATE1                      		VARCHAR2(15)		 NOT NULL,
		LC_DATE2                      		VARCHAR2(15)		 NOT NULL,
		LC_DATE3                      		VARCHAR2(15)		 NOT NULL,
		LC_DATE4                      		VARCHAR2(15)		 NOT NULL
);

COMMENT ON TABLE LICENSE is '�ڰ���';
COMMENT ON COLUMN LICENSE.LC_NO is '�۹�ȣ';
COMMENT ON COLUMN LICENSE.LC_TITLE is '����';
COMMENT ON COLUMN LICENSE.LC_CONTENT is '����';
COMMENT ON COLUMN LICENSE.LC_FILE1 is '����1';
COMMENT ON COLUMN LICENSE.LC_FILE2 is '����2';
COMMENT ON COLUMN LICENSE.LC_SIZE2 is '������2';
COMMENT ON COLUMN LICENSE.LC_CNT is '��ȸ��';
COMMENT ON COLUMN LICENSE.LC_DATE is '�������';
COMMENT ON COLUMN LICENSE.LC_DATE1 is '������';
COMMENT ON COLUMN LICENSE.LC_DATE2 is '������';
COMMENT ON COLUMN LICENSE.LC_DATE3 is '���賯';
COMMENT ON COLUMN LICENSE.LC_DATE4 is '��&�� ��ǥ��';


/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE STUDY(
		SY_NO                         		NUMBER(7)		 NOT NULL,
		TITLE                         		VARCHAR2(120)		 NOT NULL,
		CONTENT                       		VARCHAR2(4000)		 NOT NULL,
		FILE1                         		VARCHAR2(100)		 NULL ,
		FILE2                         		VARCHAR2(500)		 NULL ,
		SIZE2                         		NUMBER(9)		 NULL ,
		CNT                           		NUMBER(7)		 NOT NULL,
		SY_DATE                       		DATE		 NOT NULL,
		GATE                          		VARCHAR2(10)		 NOT NULL
);

COMMENT ON TABLE STUDY is '����';
COMMENT ON COLUMN STUDY.SY_NO is '�۹�ȣ';
COMMENT ON COLUMN STUDY.TITLE is '������';
COMMENT ON COLUMN STUDY.CONTENT is '�۳���';
COMMENT ON COLUMN STUDY.FILE1 is '����1';
COMMENT ON COLUMN STUDY.FILE2 is '����2';
COMMENT ON COLUMN STUDY.SIZE2 is '������2';
COMMENT ON COLUMN STUDY.CNT is '��ȸ��';
COMMENT ON COLUMN STUDY.SY_DATE is '�������';
COMMENT ON COLUMN STUDY.GATE is 'ī�װ�';


/**********************************/
/* Table Name: �����Խ��� */
/**********************************/
CREATE TABLE TQNA(
		QA_NO                         		NUMBER(7)		 NOT NULL,
		QA_TITLE                      		VARCHAR2(120)		 NOT NULL,
		QA_CONTENT                    		VARCHAR2(4000)		 NOT NULL,
		QA_CNT                        		NUMBER(7)		 NOT NULL,
		QA_DATE                       		DATE		 NOT NULL,
		me_no                         		INTEGER(7)		 NULL 
);

COMMENT ON TABLE TQNA is '�����Խ���';
COMMENT ON COLUMN TQNA.QA_NO is '�۹�ȣ';
COMMENT ON COLUMN TQNA.QA_TITLE is '������';
COMMENT ON COLUMN TQNA.QA_CONTENT is '�۳���';
COMMENT ON COLUMN TQNA.QA_CNT is '��ȸ��';
COMMENT ON COLUMN TQNA.QA_DATE is '�������';
COMMENT ON COLUMN TQNA.me_no is 'ȸ����ȣ';


/**********************************/
/* Table Name: �����ϴ�����(H,C) */
/**********************************/
CREATE TABLE QNA(
		fq_no                         		NUMBER(7)		 NULL ,
		fq_question                   		VARCHAR2(4000)		 NULL ,
		fq_answer                     		VARCHAR2(4000)		 NULL ,
		fq_date                       		DATE		 NULL ,
		fq_CH                         		CHAR(1)		 NULL 
);

COMMENT ON TABLE QNA is '�����ϴ�����(H,C)';
COMMENT ON COLUMN QNA.fq_no is '��ȣ';
COMMENT ON COLUMN QNA.fq_question is '����';
COMMENT ON COLUMN QNA.fq_answer is '�亯';
COMMENT ON COLUMN QNA.fq_date is '��ϳ�¥';
COMMENT ON COLUMN QNA.fq_CH is '�Խ��Ǳ���';


/**********************************/
/* Table Name: ����, �ڼҼ� */
/**********************************/
CREATE TABLE tip(
		tp_no                         		NUMBER(7)		 NULL ,
		tp_title                      		VARCHAR2(4000)		 NULL ,
		tp_content                    		VARCHAR2(4000)		 NULL ,
		tp_ch                         		VARCHAR2(2)		 NULL ,
		tp_date                       		DATE		 NULL 
);

COMMENT ON TABLE tip is '����, �ڼҼ�';
COMMENT ON COLUMN tip.tp_no is '��ȣ';
COMMENT ON COLUMN tip.tp_title is '����';
COMMENT ON COLUMN tip.tp_content is '����';
COMMENT ON COLUMN tip.tp_ch is '�����ϴ� ��';
COMMENT ON COLUMN tip.tp_date is '��¥';


/**********************************/
/* Table Name: ���� */
/**********************************/
CREATE TABLE gurume(
		gu_no                         		NUMBER(7)		 NOT NULL,
		gu_area                       		VARCHAR2(40)		 NOT NULL,
		gu_menu                       		VARCHAR2(40)		 NOT NULL,
		gu_price                      		VARCHAR2(100)		 NULL ,
		codename                      		VARCHAR2(100)		 NOT NULL,
		gu_title                      		VARCHAR2(120)		 NOT NULL,
		gu_cont                       		VARCHAR2(4000)		 NOT NULL,
		gu_cnt                        		NUMBER(7)		 DEFAULT 0		 NULL ,
		gu_stars                      		NUMBER(7)		 DEFAULT 0		 NULL ,
		gu_date                       		DATE		 NOT NULL,
		file1                         		VARCHAR2(100)		 NULL ,
		file2                         		VARCHAR2(100)		 NOT NULL,
		size2                         		NUMBER(7)		 DEFAULT 0		 NULL ,
		me_no                         		NUMBER(7)		 NULL ,
		codeno                        		NUMBER(7)		 NOT NULL,
		gu_map                        		VARCHAR2(400)		 NOT NULL
);

COMMENT ON TABLE gurume is '����';
COMMENT ON COLUMN gurume.gu_no is '�� ��ȣ';
COMMENT ON COLUMN gurume.gu_area is '����';
COMMENT ON COLUMN gurume.gu_menu is '�з�';
COMMENT ON COLUMN gurume.gu_price is '����';
COMMENT ON COLUMN gurume.codename is '�ڵ����';
COMMENT ON COLUMN gurume.gu_title is '���� ��';
COMMENT ON COLUMN gurume.gu_cont is '�� ����';
COMMENT ON COLUMN gurume.gu_cnt is '��ȸ��';
COMMENT ON COLUMN gurume.gu_stars is '����';
COMMENT ON COLUMN gurume.gu_date is '�����';
COMMENT ON COLUMN gurume.file1 is '�����';
COMMENT ON COLUMN gurume.file2 is '����';
COMMENT ON COLUMN gurume.size2 is '���� ũ��';
COMMENT ON COLUMN gurume.me_no is 'ȸ�� ��ȣ';
COMMENT ON COLUMN gurume.codeno is '�Խ��� ��ȣ';
COMMENT ON COLUMN gurume.gu_map is '����';


/**********************************/
/* Table Name: ���� ��� ���̺� */
/**********************************/
CREATE TABLE dat(
		dno                           		NUMBER(7)		 NOT NULL,
		gu_no                         		INTEGER(10)		 NOT NULL,
		d_cont                        		VARCHAR2(400)		 NULL ,
		d_name                        		INTEGER(10)		 NOT NULL,
		codeno                        		NUMBER(7)		 NOT NULL,
		codename                      		VARCHAR2(100)		 NOT NULL,
		likeup                        		NUMBER(7)		 DEFAULT 0		 NULL ,
		likedown                      		NUMBER(7)		 NULL ,
		grpno                         		NUMBER(7)		 DEFAULT 0		 NULL ,
		indent                        		NUMBER(2)		 DEFAULT 0		 NULL ,
		ansnum                        		NUMBER(5)		 DEFAULT 0		 NULL ,
		MNO                           		NUMBER(6)		 NULL ,
		d_date                        		DATE		 NOT NULL
);

COMMENT ON TABLE dat is '���� ��� ���̺�';
COMMENT ON COLUMN dat.dno is '��ȣ';
COMMENT ON COLUMN dat.gu_no is '������ȣ';
COMMENT ON COLUMN dat.d_cont is '����';
COMMENT ON COLUMN dat.d_name is '�г���';
COMMENT ON COLUMN dat.codeno is 'ȸ����ȣ(FK)';
COMMENT ON COLUMN dat.codename is '�г���';
COMMENT ON COLUMN dat.likeup is '��õ';
COMMENT ON COLUMN dat.likedown is '����õ';
COMMENT ON COLUMN dat.grpno is '�׷��ȣ';
COMMENT ON COLUMN dat.indent is '����';
COMMENT ON COLUMN dat.ansnum is '�亯��ȣ';
COMMENT ON COLUMN dat.MNO is 'ȸ�� ��ȣ';
COMMENT ON COLUMN dat.d_date is '�����';


/**********************************/
/* Table Name: ���� �ı� */
/**********************************/
CREATE TABLE seico(
		sc_no                         		NUMBER(7)		 NOT NULL,
		sc_name                       		VARCHAR2(40)		 NOT NULL,
		sc_area                       		VARCHAR2(40)		 NOT NULL,
		sc_jobs                       		VARCHAR2(40)		 NOT NULL,
		sc_gender                     		VARCHAR2(10)		 NOT NULL,
		sc_position                   		VARCHAR2(300)		 NOT NULL,
		sc_q                          		VARCHAR2(4000)		 NOT NULL,
		sc_tip                        		VARCHAR2(4000)		 NULL ,
		sc_stars                      		VARCHAR2(30)		 NOT NULL,
		sc_ex                         		VARCHAR2(20)		 NULL ,
		sc_where                      		VARCHAR2(100)		 NULL ,
		sc_like                       		NUMBER(7)		 DEFAULT 0		 NULL ,
		sc_likeup                     		NUMBER(7)		 NULL ,
		sc_likedown                   		NUMBER(7)		 NULL ,
		sc_title                      		VARCHAR2(120)		 NOT NULL,
		sc_cont                       		VARCHAR2(4000)		 NOT NULL,
		gu_cnt                        		NUMBER(7)		 DEFAULT 0		 NULL ,
		sc_date                       		DATE		 NOT NULL,
		file1                         		VARCHAR2(100)		 NULL ,
		file2                         		VARCHAR2(100)		 NULL ,
		size2                         		NUMBER(7)		 DEFAULT 0		 NULL ,
		MNO                           		NUMBER(6)		 NULL ,
		codename                      		VARCHAR2(100)		 NULL ,
		me_no                         		INTEGER(7)		 NULL 
);

COMMENT ON TABLE seico is '���� �ı�';
COMMENT ON COLUMN seico.sc_no is '�� ��ȣ';
COMMENT ON COLUMN seico.sc_name is '�ڵ����';
COMMENT ON COLUMN seico.sc_area is '����';
COMMENT ON COLUMN seico.sc_jobs is '�з�';
COMMENT ON COLUMN seico.sc_gender is '����';
COMMENT ON COLUMN seico.sc_position is '���� �� ����';
COMMENT ON COLUMN seico.sc_q is '���� ��������';
COMMENT ON COLUMN seico.sc_tip is '���� ��';
COMMENT ON COLUMN seico.sc_stars is '���̵�';
COMMENT ON COLUMN seico.sc_ex is '���� ����';
COMMENT ON COLUMN seico.sc_where is '������';
COMMENT ON COLUMN seico.sc_like is '���ƿ�';
COMMENT ON COLUMN seico.sc_likeup is '��õ';
COMMENT ON COLUMN seico.sc_likedown is '����õ';
COMMENT ON COLUMN seico.sc_title is '����';
COMMENT ON COLUMN seico.sc_cont is '�� ����';
COMMENT ON COLUMN seico.gu_cnt is '��ȸ��';
COMMENT ON COLUMN seico.sc_date is '�����';
COMMENT ON COLUMN seico.file1 is '�����';
COMMENT ON COLUMN seico.file2 is '����';
COMMENT ON COLUMN seico.size2 is '���� ũ��';
COMMENT ON COLUMN seico.MNO is 'ȸ�� ��ȣ';
COMMENT ON COLUMN seico.codename is '�ڵ����';
COMMENT ON COLUMN seico.me_no is 'ȸ����ȣ';


/**********************************/
/* Table Name: �����ı� ��� ���̺� */
/**********************************/
CREATE TABLE sdat(
		sd_no                         		NUMBER(7)		 NOT NULL,
		sc_no                         		INTEGER(10)		 NOT NULL,
		sd_cont                       		VARCHAR2(400)		 NULL ,
		sd_name                       		INTEGER(10)		 NOT NULL,
		codeno                        		NUMBER(7)		 NOT NULL,
		codename                      		VARCHAR2(100)		 NOT NULL,
		likeup                        		NUMBER(7)		 DEFAULT 0		 NULL ,
		likedown                      		NUMBER(7)		 NULL ,
		grpno                         		NUMBER(7)		 DEFAULT 0		 NULL ,
		indent                        		NUMBER(2)		 DEFAULT 0		 NULL ,
		ansnum                        		NUMBER(5)		 DEFAULT 0		 NULL ,
		MNO                           		NUMBER(6)		 NULL ,
		sd_date                       		DATE		 NOT NULL
);

COMMENT ON TABLE sdat is '�����ı� ��� ���̺�';
COMMENT ON COLUMN sdat.sd_no is '��ȣ';
COMMENT ON COLUMN sdat.sc_no is '�����ı� �Խ��� ��ȣ';
COMMENT ON COLUMN sdat.sd_cont is '����';
COMMENT ON COLUMN sdat.sd_name is '�г���';
COMMENT ON COLUMN sdat.codeno is 'ȸ����ȣ(FK)';
COMMENT ON COLUMN sdat.codename is '�г���';
COMMENT ON COLUMN sdat.likeup is '��õ';
COMMENT ON COLUMN sdat.likedown is '����õ';
COMMENT ON COLUMN sdat.grpno is '�׷��ȣ';
COMMENT ON COLUMN sdat.indent is '����';
COMMENT ON COLUMN sdat.ansnum is '�亯��ȣ';
COMMENT ON COLUMN sdat.MNO is 'ȸ�� ��ȣ';
COMMENT ON COLUMN sdat.sd_date is '�����';


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
COMMENT ON COLUMN serveyboard.sb_no is '��ȣ';
COMMENT ON COLUMN serveyboard.title is '����';
COMMENT ON COLUMN serveyboard.content is '����';
COMMENT ON COLUMN serveyboard.rdate is '�����';


/**********************************/
/* Table Name: ���������׸� */
/**********************************/
CREATE TABLE servey(
		serveyno                      		NUMBER(7)		 NULL ,
		item                          		VARCHAR2(200)		 NULL ,
		cnt                           		NUMBER(7)		 NULL ,
		�ۼ�Ʈ                           		NUMBER(3)		 NULL ,
		sb_no                         		NUMBER(7)		 NULL 
);

COMMENT ON TABLE servey is '���������׸�';
COMMENT ON COLUMN servey.serveyno is '�׸��ȣ';
COMMENT ON COLUMN servey.item is '�׸�';
COMMENT ON COLUMN servey.cnt is 'ī��Ʈ';
COMMENT ON COLUMN servey.�ۼ�Ʈ is 'aver';
COMMENT ON COLUMN servey.sb_no is '��ȣ';


/**********************************/
/* Table Name: �������� */
/**********************************/
CREATE TABLE notice(
		nt_no                         		NUMBER(7)		 NULL ,
		nt_nt                         		CHAR(1)		 NULL ,
		nt_title                      		VARCHAR2(120)		 NULL ,
		nt_content                    		VARCHAR2(4000)		 NULL ,
		nt_date                       		DATE		 NULL 
);

COMMENT ON TABLE notice is '��������';
COMMENT ON COLUMN notice.nt_no is '��ȣ';
COMMENT ON COLUMN notice.nt_nt is '�������׿���';
COMMENT ON COLUMN notice.nt_title is '����';
COMMENT ON COLUMN notice.nt_content is '����';
COMMENT ON COLUMN notice.nt_date is '��¥';



ALTER TABLE member ADD CONSTRAINT IDX_member_PK PRIMARY KEY (me_no);

ALTER TABLE commu_free ADD CONSTRAINT IDX_commu_free_PK PRIMARY KEY (cm_no);
ALTER TABLE commu_free ADD CONSTRAINT IDX_commu_free_FK0 FOREIGN KEY (me_no) REFERENCES member (me_no);

ALTER TABLE community ADD CONSTRAINT IDX_community_PK PRIMARY KEY (cm_no);
ALTER TABLE community ADD CONSTRAINT IDX_community_FK0 FOREIGN KEY (me_no) REFERENCES member (me_no);

ALTER TABLE commu_comment ADD CONSTRAINT IDX_commu_comment_PK PRIMARY KEY (rno);
ALTER TABLE commu_comment ADD CONSTRAINT IDX_commu_comment_FK0 FOREIGN KEY (cm_no) REFERENCES community (cm_no);
ALTER TABLE commu_comment ADD CONSTRAINT IDX_commu_comment_FK1 FOREIGN KEY (cm_no) REFERENCES commu_free (cm_no);

ALTER TABLE contest ADD CONSTRAINT IDX_contest_PK PRIMARY KEY (ct_no);

ALTER TABLE calender ADD CONSTRAINT IDX_calender_PK PRIMARY KEY (cl_no);
ALTER TABLE calender ADD CONSTRAINT IDX_calender_FK0 FOREIGN KEY (me_no) REFERENCES member (me_no);
ALTER TABLE calender ADD CONSTRAINT IDX_calender_FK1 FOREIGN KEY (ct_no) REFERENCES contest (ct_no);

ALTER TABLE scrap ADD CONSTRAINT IDX_scrap_PK PRIMARY KEY (sp_no);
ALTER TABLE scrap ADD CONSTRAINT IDX_scrap_FK0 FOREIGN KEY (me_no) REFERENCES member (me_no);
ALTER TABLE scrap ADD CONSTRAINT IDX_scrap_FK1 FOREIGN KEY (ct_no) REFERENCES contest (ct_no);

ALTER TABLE enterprise_info ADD CONSTRAINT IDX_enterprise_info_PK PRIMARY KEY (ei_no);
ALTER TABLE enterprise_info ADD CONSTRAINT IDX_enterprise_info_FK0 FOREIGN KEY (me_no) REFERENCES member (me_no);

ALTER TABLE bl_comment ADD CONSTRAINT IDX_bl_comment_PK PRIMARY KEY (bc_commentno);
ALTER TABLE bl_comment ADD CONSTRAINT IDX_bl_comment_FK0 FOREIGN KEY (me_no) REFERENCES member (me_no);

ALTER TABLE blacklist ADD CONSTRAINT IDX_blacklist_PK PRIMARY KEY (bl_no);
ALTER TABLE blacklist ADD CONSTRAINT IDX_blacklist_FK0 FOREIGN KEY (bc_commentno) REFERENCES bl_comment (bc_commentno);

ALTER TABLE employment_info ADD CONSTRAINT IDX_employment_info_PK PRIMARY KEY (em_no);
ALTER TABLE employment_info ADD CONSTRAINT IDX_employment_info_FK0 FOREIGN KEY (ei_no) REFERENCES enterprise_info (ei_no);

ALTER TABLE ITOS ADD CONSTRAINT IDX_ITOS_PK PRIMARY KEY (IO_NO);
ALTER TABLE ITOS ADD CONSTRAINT IDX_ITOS_FK0 FOREIGN KEY (me_no) REFERENCES member (me_no);

ALTER TABLE LICENSE ADD CONSTRAINT IDX_LICENSE_PK PRIMARY KEY (LC_NO);

ALTER TABLE STUDY ADD CONSTRAINT IDX_STUDY_PK PRIMARY KEY (SY_NO);

ALTER TABLE TQNA ADD CONSTRAINT IDX_TQNA_PK PRIMARY KEY (QA_NO);
ALTER TABLE TQNA ADD CONSTRAINT IDX_TQNA_FK0 FOREIGN KEY (me_no) REFERENCES member (me_no);

ALTER TABLE QNA ADD CONSTRAINT IDX_QNA_PK PRIMARY KEY (fq_no);

ALTER TABLE tip ADD CONSTRAINT IDX_tip_PK PRIMARY KEY (tp_no);

ALTER TABLE gurume ADD CONSTRAINT IDX_gurume_PK PRIMARY KEY (gu_no);
ALTER TABLE gurume ADD CONSTRAINT IDX_gurume_FK0 FOREIGN KEY (me_no) REFERENCES member (me_no);

ALTER TABLE dat ADD CONSTRAINT IDX_dat_FK0 FOREIGN KEY (gu_no) REFERENCES gurume (gu_no);

ALTER TABLE seico ADD CONSTRAINT IDX_seico_PK PRIMARY KEY (sc_no);
ALTER TABLE seico ADD CONSTRAINT IDX_seico_FK0 FOREIGN KEY (me_no) REFERENCES member (me_no);

ALTER TABLE sdat ADD CONSTRAINT IDX_sdat_FK0 FOREIGN KEY (sc_no) REFERENCES seico (sc_no);

ALTER TABLE serveyboard ADD CONSTRAINT IDX_serveyboard_PK PRIMARY KEY (sb_no);

ALTER TABLE servey ADD CONSTRAINT IDX_servey_PK PRIMARY KEY (serveyno);
ALTER TABLE servey ADD CONSTRAINT IDX_servey_FK0 FOREIGN KEY (sb_no) REFERENCES serveyboard (sb_no);

ALTER TABLE notice ADD CONSTRAINT IDX_notice_PK PRIMARY KEY (nt_no);

