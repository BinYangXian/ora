 

spool em_cust_attribute_table.log

prompt
prompt Creating table EM_CUST_ATTRIBUTE
prompt ================================
prompt
create table EM_CUST_ATTRIBUTE
(
  CUST_ID           VARCHAR2(30) not null,
  CUST_EMAIL        VARCHAR2(100),
  CUST_PHONE        VARCHAR2(100),
  CUST_REGDATE      DATE default SYSDATE not null,
  CUST_STATUS       NUMBER(2) not null,
  CUST_TYPE         NUMBER(1),
  CUST_REGFROM      VARCHAR2(20) not null,
  TRADE_GRADEID     NUMBER(3),
  REG_IPADDR        VARCHAR2(30),
  CERT_TYPE         NUMBER(1),
  CERT_ID           VARCHAR2(50),
  CERT_ORG          VARCHAR2(50),
  CERT_GRANTDATE    DATE,
  CUST_COMPTEL      VARCHAR2(20),
  CUST_HOMETEL      VARCHAR2(20),
  CUST_FAX          VARCHAR2(20),
  CUST_ADDRESS      VARCHAR2(100),
  CUST_POSTCODE     VARCHAR2(10),
  VERIFY_PHONE      NUMBER(1) default 1 not null,
  VERIFY_EMAIL      NUMBER(1) default 1 not null,
  VERIFY_CERT       NUMBER(1) default 1 not null,
  VERIFY_BANK       NUMBER(1) default 1 not null,
  SAFE_SMS          NUMBER(1) default 1 not null,
  SAFE_USBKEY       NUMBER(1) default 1 not null,
  SAFE_MAC          NUMBER(1) default 1 not null,
  SAFE_AC           NUMBER(1) default 1 not null,
  PROVINCE_ID       NUMBER(2),
  CITY_ID           NUMBER(4),
  CUST_SEX          NUMBER(1),
  LASTLOGINIP       VARCHAR2(30),
  LASTLOGINDATE     DATE,
  CUST_GRADEID      NUMBER(3) not null,
  ISLIMIT           NUMBER(1) default 0,
  VERIFY_BANK_TIMES NUMBER(2) default 0,
  CORE_ACCID        NUMBER(20),
  AI_SMS            NUMBER(1) default 1,
  AI_SMSAMOUNT      NUMBER(14,2),
  AI_EMAIL          NUMBER(1) default 1,
  AU_SMS            NUMBER(1) default 1,
  AU_SMSAMOUNT      NUMBER(14,2),
  AU_EMAIL          NUMBER(1) default 1,
  CUST_INTEGRITY    NUMBER(1) default 1,
  CERT_SNO          VARCHAR2(32),
  BANK_SNO          VARCHAR2(32),
  CORP_LICENSE_SNO  VARCHAR2(32),
  LOGIN_VERIFY_MODE NUMBER(1) default 1,
  CUST_NAME         VARCHAR2(100),
  CUST_GREETINGS    VARCHAR2(100)
)
;
comment on table EM_CUST_ATTRIBUTE
  is '�洢�û����ԣ����������û����������û�����ҵ�û�����';
comment on column EM_CUST_ATTRIBUTE.CUST_ID
  is '�û����';
comment on column EM_CUST_ATTRIBUTE.CUST_EMAIL
  is '�û��ʼ�';
comment on column EM_CUST_ATTRIBUTE.CUST_PHONE
  is '�û��ֻ�';
comment on column EM_CUST_ATTRIBUTE.CUST_REGDATE
  is '�û�ע������';
comment on column EM_CUST_ATTRIBUTE.CUST_STATUS
  is '�û�״̬ 0=���� 1=������ 2=���� ��ֹ����3=���� 4=ע��';
comment on column EM_CUST_ATTRIBUTE.CUST_TYPE
  is '�û����� 1=�����û� 2=֧���̼� 3=��ҵ�û�';
comment on column EM_CUST_ATTRIBUTE.CUST_REGFROM
  is '�û�ע����Դ
Ӧ��ϵͳ����ţ�
����Em_Acs_AppInfo
';
comment on column EM_CUST_ATTRIBUTE.TRADE_GRADEID
  is '���׵ȼ����';
comment on column EM_CUST_ATTRIBUTE.REG_IPADDR
  is '����IP��ַ';
comment on column EM_CUST_ATTRIBUTE.CERT_TYPE
  is '֤������ 1=�������֤ 2=����֤ 3=����
 4=�۰�̨�����½ͨ��֤';
comment on column EM_CUST_ATTRIBUTE.CERT_ID
  is '֤������';
comment on column EM_CUST_ATTRIBUTE.CERT_ORG
  is '��֤����';
comment on column EM_CUST_ATTRIBUTE.CERT_GRANTDATE
  is '��֤����';
comment on column EM_CUST_ATTRIBUTE.CUST_COMPTEL
  is '�칫�绰';
comment on column EM_CUST_ATTRIBUTE.CUST_HOMETEL
  is '��ͥ�绰';
comment on column EM_CUST_ATTRIBUTE.CUST_FAX
  is '�������';
comment on column EM_CUST_ATTRIBUTE.CUST_ADDRESS
  is '��ϵ��ַ';
comment on column EM_CUST_ATTRIBUTE.CUST_POSTCODE
  is '��������';
comment on column EM_CUST_ATTRIBUTE.VERIFY_PHONE
  is '��֤�ֻ���Ч 1=δ��֤ 0=����֤
';
comment on column EM_CUST_ATTRIBUTE.VERIFY_EMAIL
  is '��֤�ʼ���Ч 1=δ��֤ 0=����֤
';
comment on column EM_CUST_ATTRIBUTE.VERIFY_CERT
  is '��֤���֤ʵ�� 1=δ��֤ 0=����֤
';
comment on column EM_CUST_ATTRIBUTE.VERIFY_BANK
  is '��֤����ʵ�� 1=δ��֤ 0=����֤
 2=�ȴ�������� 3=�ȴ��û�ȷ�ϴ����';
comment on column EM_CUST_ATTRIBUTE.SAFE_SMS
  is '��ȫ��.���Ŷ�̬���� 1=δ�� 0=�Ѱ�
';
comment on column EM_CUST_ATTRIBUTE.SAFE_USBKEY
  is '��ȫ��.USB Key 1=δ�� 0=�Ѱ�
';
comment on column EM_CUST_ATTRIBUTE.SAFE_MAC
  is '��ȫ��.MAC
 1=δ�� 0=�Ѱ�
';
comment on column EM_CUST_ATTRIBUTE.SAFE_AC
  is '��ȫ��.AC����֤�� 1=δ�� 0=�Ѱ�
';
comment on column EM_CUST_ATTRIBUTE.PROVINCE_ID
  is 'ʡ�ݱ���';
comment on column EM_CUST_ATTRIBUTE.CITY_ID
  is '���б���';
comment on column EM_CUST_ATTRIBUTE.CUST_SEX
  is '�û��Ա� 1=�� 2=Ů
';
comment on column EM_CUST_ATTRIBUTE.LASTLOGINIP
  is '�û����һ�ε�½IP��ַ';
comment on column EM_CUST_ATTRIBUTE.LASTLOGINDATE
  is '�û����һ�ε�½ʱ��';
comment on column EM_CUST_ATTRIBUTE.CUST_GRADEID
  is '�û��ȼ����  EM_PUB_CUSTGRADE';
comment on column EM_CUST_ATTRIBUTE.ISLIMIT
  is '�Ƿ��������û� 0=�����û� 1=�������û� 2=�������û�
';
comment on column EM_CUST_ATTRIBUTE.VERIFY_BANK_TIMES
  is '�û�����֤���п�ʵ����֤����';
comment on column EM_CUST_ATTRIBUTE.CORE_ACCID
  is '����ϵͳ����ID';
comment on column EM_CUST_ATTRIBUTE.AI_SMS
  is '�˻�����䶯�Ƿ����Ѷ��� 0=���� 1=������';
comment on column EM_CUST_ATTRIBUTE.AI_SMSAMOUNT
  is '����������С���';
comment on column EM_CUST_ATTRIBUTE.AI_EMAIL
  is '�˻�����䶯�Ƿ������ʼ� 0=���� 1=������';
comment on column EM_CUST_ATTRIBUTE.AU_SMS
  is '�˻�֧���䶯�Ƿ����Ѷ��� 0=���� 1=������';
comment on column EM_CUST_ATTRIBUTE.AU_SMSAMOUNT
  is '����������С���';
comment on column EM_CUST_ATTRIBUTE.AU_EMAIL
  is '�˻�֧���䶯�Ƿ������ʼ� 0=���� 1=������';
comment on column EM_CUST_ATTRIBUTE.CUST_INTEGRITY
  is '�û���Ϣ������ 1=������ 2=����';
comment on column EM_CUST_ATTRIBUTE.CERT_SNO
  is '�û���ݱ�ʶ֤����ţ�������EM_CUST_CERT';
comment on column EM_CUST_ATTRIBUTE.BANK_SNO
  is '�û����п���Ϣ��ţ�������EM_CUST_BANK';
comment on column EM_CUST_ATTRIBUTE.CORP_LICENSE_SNO
  is '��ҵ֤����Ϣ��ţ�����EM_CUST_CORP';
comment on column EM_CUST_ATTRIBUTE.LOGIN_VERIFY_MODE
  is '��¼��Ȩģʽ��1=��¼���룬2=��¼����+��̬��Կ�����ţ�';
comment on column EM_CUST_ATTRIBUTE.CUST_NAME
  is '�û��ֻ�������';
comment on column EM_CUST_ATTRIBUTE.CUST_GREETINGS
  is '��¼�ʺ���';
alter table EM_CUST_ATTRIBUTE
  add constraint PK_EM_CUST_ATTRIBUTE primary key (CUST_ID);
alter table EM_CUST_ATTRIBUTE
  add constraint UK_EM_CUST_ATTRIBUTE_EMAIL unique (CUST_EMAIL);
alter table EM_CUST_ATTRIBUTE
  add constraint UK_EM_CUST_ATTRIBUTE_PHONE unique (CUST_PHONE);


spool off
