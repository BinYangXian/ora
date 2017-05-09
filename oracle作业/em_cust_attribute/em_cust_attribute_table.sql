 

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
  is '存储用户属性，包括个人用户、代理商用户、企业用户数据';
comment on column EM_CUST_ATTRIBUTE.CUST_ID
  is '用户编号';
comment on column EM_CUST_ATTRIBUTE.CUST_EMAIL
  is '用户邮件';
comment on column EM_CUST_ATTRIBUTE.CUST_PHONE
  is '用户手机';
comment on column EM_CUST_ATTRIBUTE.CUST_REGDATE
  is '用户注册日期';
comment on column EM_CUST_ATTRIBUTE.CUST_STATUS
  is '用户状态 0=正常 1=待激活 2=冻结 （止付）3=锁定 4=注销';
comment on column EM_CUST_ATTRIBUTE.CUST_TYPE
  is '用户类型 1=个人用户 2=支付商家 3=企业用户';
comment on column EM_CUST_ATTRIBUTE.CUST_REGFROM
  is '用户注册来源
应用系统分配号，
关联Em_Acs_AppInfo
';
comment on column EM_CUST_ATTRIBUTE.TRADE_GRADEID
  is '交易等级编号';
comment on column EM_CUST_ATTRIBUTE.REG_IPADDR
  is '开户IP地址';
comment on column EM_CUST_ATTRIBUTE.CERT_TYPE
  is '证件类型 1=居民身份证 2=军官证 3=护照
 4=港澳台居民大陆通行证';
comment on column EM_CUST_ATTRIBUTE.CERT_ID
  is '证件号码';
comment on column EM_CUST_ATTRIBUTE.CERT_ORG
  is '发证机关';
comment on column EM_CUST_ATTRIBUTE.CERT_GRANTDATE
  is '发证日期';
comment on column EM_CUST_ATTRIBUTE.CUST_COMPTEL
  is '办公电话';
comment on column EM_CUST_ATTRIBUTE.CUST_HOMETEL
  is '家庭电话';
comment on column EM_CUST_ATTRIBUTE.CUST_FAX
  is '传真号码';
comment on column EM_CUST_ATTRIBUTE.CUST_ADDRESS
  is '联系地址';
comment on column EM_CUST_ATTRIBUTE.CUST_POSTCODE
  is '邮政编码';
comment on column EM_CUST_ATTRIBUTE.VERIFY_PHONE
  is '验证手机有效 1=未验证 0=已验证
';
comment on column EM_CUST_ATTRIBUTE.VERIFY_EMAIL
  is '验证邮件有效 1=未验证 0=已验证
';
comment on column EM_CUST_ATTRIBUTE.VERIFY_CERT
  is '验证身份证实名 1=未验证 0=已验证
';
comment on column EM_CUST_ATTRIBUTE.VERIFY_BANK
  is '验证银行实名 1=未验证 0=已验证
 2=等待财务审核 3=等待用户确认打款金额';
comment on column EM_CUST_ATTRIBUTE.SAFE_SMS
  is '安全绑定.短信动态密码 1=未绑定 0=已绑定
';
comment on column EM_CUST_ATTRIBUTE.SAFE_USBKEY
  is '安全绑定.USB Key 1=未绑定 0=已绑定
';
comment on column EM_CUST_ATTRIBUTE.SAFE_MAC
  is '安全绑定.MAC
 1=未绑定 0=已绑定
';
comment on column EM_CUST_ATTRIBUTE.SAFE_AC
  is '安全绑定.AC数字证书 1=未绑定 0=已绑定
';
comment on column EM_CUST_ATTRIBUTE.PROVINCE_ID
  is '省份编码';
comment on column EM_CUST_ATTRIBUTE.CITY_ID
  is '城市编码';
comment on column EM_CUST_ATTRIBUTE.CUST_SEX
  is '用户性别 1=男 2=女
';
comment on column EM_CUST_ATTRIBUTE.LASTLOGINIP
  is '用户最后一次登陆IP地址';
comment on column EM_CUST_ATTRIBUTE.LASTLOGINDATE
  is '用户最后一次登陆时间';
comment on column EM_CUST_ATTRIBUTE.CUST_GRADEID
  is '用户等级编号  EM_PUB_CUSTGRADE';
comment on column EM_CUST_ATTRIBUTE.ISLIMIT
  is '是否是限制用户 0=正常用户 1=黑名单用户 2=灰名单用户
';
comment on column EM_CUST_ATTRIBUTE.VERIFY_BANK_TIMES
  is '用户已验证银行卡实名验证次数';
comment on column EM_CUST_ATTRIBUTE.CORE_ACCID
  is '核心系统账务ID';
comment on column EM_CUST_ATTRIBUTE.AI_SMS
  is '账户收入变动是否提醒短信 0=提醒 1=不提醒';
comment on column EM_CUST_ATTRIBUTE.AI_SMSAMOUNT
  is '短信提醒最小金额';
comment on column EM_CUST_ATTRIBUTE.AI_EMAIL
  is '账户收入变动是否提醒邮件 0=提醒 1=不提醒';
comment on column EM_CUST_ATTRIBUTE.AU_SMS
  is '账户支出变动是否提醒短信 0=提醒 1=不提醒';
comment on column EM_CUST_ATTRIBUTE.AU_SMSAMOUNT
  is '短信提醒最小金额';
comment on column EM_CUST_ATTRIBUTE.AU_EMAIL
  is '账户支出变动是否提醒邮件 0=提醒 1=不提醒';
comment on column EM_CUST_ATTRIBUTE.CUST_INTEGRITY
  is '用户信息完整度 1=不完整 2=完整';
comment on column EM_CUST_ATTRIBUTE.CERT_SNO
  is '用户身份标识证件序号，关联表EM_CUST_CERT';
comment on column EM_CUST_ATTRIBUTE.BANK_SNO
  is '用户银行卡信息序号，关联表EM_CUST_BANK';
comment on column EM_CUST_ATTRIBUTE.CORP_LICENSE_SNO
  is '企业证件信息序号，关联EM_CUST_CORP';
comment on column EM_CUST_ATTRIBUTE.LOGIN_VERIFY_MODE
  is '登录鉴权模式：1=登录密码，2=登录密码+动态密钥（短信）';
comment on column EM_CUST_ATTRIBUTE.CUST_NAME
  is '用户手机号密文';
comment on column EM_CUST_ATTRIBUTE.CUST_GREETINGS
  is '登录问候语';
alter table EM_CUST_ATTRIBUTE
  add constraint PK_EM_CUST_ATTRIBUTE primary key (CUST_ID);
alter table EM_CUST_ATTRIBUTE
  add constraint UK_EM_CUST_ATTRIBUTE_EMAIL unique (CUST_EMAIL);
alter table EM_CUST_ATTRIBUTE
  add constraint UK_EM_CUST_ATTRIBUTE_PHONE unique (CUST_PHONE);


spool off
