SET SESSION FOREIGN_KEY_CHECKS=0;

/* Drop Tables */

DROP TABLE IF EXISTS t_contact;
DROP TABLE IF EXISTS t_dis_log;
DROP TABLE IF EXISTS t_reserve_record;
DROP TABLE IF EXISTS t_sms_send_record;




/* Create Tables */

-- t_contact
CREATE TABLE t_contact
(
	-- id
	id varchar(64) NOT NULL COMMENT 'id : id',
	-- 所属用户
	user_id varchar(64) NOT NULL COMMENT '所属用户 : 所属用户',
	-- 姓名
	name varchar(255) NOT NULL COMMENT '姓名 : 姓名',
	-- 性别
	gender varchar(2) COMMENT '性别 : 性别',
	-- 出生日期
	birthday varchar(50) COMMENT '出生日期 : 出生日期',
	-- 昵称
	nick_name varchar(100) COMMENT '昵称 : 昵称',
	-- 头像
	head_img varchar(500) COMMENT '头像 : 头像',
	-- 手机号
	telphone varchar(200) COMMENT '手机号 : 手机号',
	-- 身高
	height varchar(10) COMMENT '身高 : 身高',
	-- 体重
	weight varchar(20) COMMENT '体重 : 体重',
	idno varchar(20) COMMENT '身份证号',
	create_by varchar(64) COMMENT '创建人',
	create_date datetime COMMENT '创建时间',
	update_by varchar(64) COMMENT '更新者',
	update_date datetime COMMENT '更新日期',
	remarks varchar(255) COMMENT '备注',
	-- 删除标记（0：正常 1：删除）
	del_flag char DEFAULT '0' COMMENT '删除标记 : 删除标记（0：正常 1：删除）',
	PRIMARY KEY (id)
) COMMENT = 't_contact' DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;


-- 病历
CREATE TABLE t_dis_log
(
	-- id
	id varchar(64) NOT NULL COMMENT 'id : id',
	patient_name varchar(20) COMMENT '病人姓名',
	date varchar(20) COMMENT '就诊日期',
	-- 1 门诊
	-- 2 急诊
	type char DEFAULT '1' COMMENT '就诊类型 : 1 门诊
2 急诊',
	hospital varchar(50) COMMENT '就诊医院',
	dept varchar(50) COMMENT '就诊科室',
	doctor varchar(50) COMMENT '医生姓名',
	reason varchar(200) COMMENT '就诊原因',
	result varchar(500) COMMENT '诊断结果',
	suggestion varchar(255) COMMENT '医生建议',
	chufang varchar(500) COMMENT '用药处方',
	jianchabaogao varchar(500) COMMENT '检查报告',
	bingli varchar(100) COMMENT '病历',
	-- 所属用户
	user_id varchar(64) COMMENT '所属用户 : 所属用户',
	create_by varchar(64) COMMENT '创建人',
	create_date datetime COMMENT '创建时间',
	update_by varchar(64) COMMENT '更新者',
	update_date datetime COMMENT '更新日期',
	remarks varchar(255) COMMENT '备注',
	-- 删除标记（0：正常 1：删除）
	del_flag char DEFAULT '0' COMMENT '删除标记 : 删除标记（0：正常 1：删除）',
	PRIMARY KEY (id),
	UNIQUE (id)
) COMMENT = '病历';


-- 预约记录表
CREATE TABLE t_reserve_record
(
	id varchar(64) NOT NULL COMMENT 'id',
	-- 所属用户
	user_id varchar(64) NOT NULL COMMENT '所属用户 : 所属用户',
	reserve_user_id varchar(64) NOT NULL COMMENT '预约医生',
	reserve_date varchar(20) COMMENT '预约日期',
	reserve_time varchar(20) COMMENT '预约时段',
	-- 1，普通
	-- 2，专家
	-- 
	reserve_type char(2) COMMENT '预约类型 : 1，普通
2，专家
',
	disease varchar(500) COMMENT '病情',
	create_by varchar(64) COMMENT '创建人',
	create_date datetime COMMENT '创建时间',
	update_by varchar(64) COMMENT '更新者',
	update_date datetime COMMENT '更新日期',
	remarks varchar(255) COMMENT '备注',
	-- 删除标记（0：正常 1：删除）
	del_flag char DEFAULT '0' COMMENT '删除标记 : 删除标记（0：正常 1：删除）',
	PRIMARY KEY (id),
	UNIQUE (id)
) COMMENT = '预约记录表';


-- t_sms_send_record
CREATE TABLE t_sms_send_record
(
	id varchar(64) NOT NULL COMMENT 'id',
	-- 接收手机号
	telphone varchar(20) NOT NULL COMMENT '接收手机号 : 接收手机号',
	-- 内容
	content varchar(255) COMMENT '内容 : 内容',
	-- 发送状态
	send_status varchar(20) COMMENT '发送状态 : 发送状态',
	-- 发送结果
	send_out_body varchar(255) COMMENT '发送结果 : 发送结果',
	-- 创建时间
	create_date datetime NOT NULL COMMENT '创建时间 : 创建时间',
	-- 更新者
	update_by varchar(64) COMMENT '更新者 : 更新者',
	-- 更新时间
	update_date datetime NOT NULL COMMENT '更新时间 : 更新时间',
	-- 备注信息
	remarks varchar(255) COMMENT '备注信息 : 备注信息',
	-- 删除标记
	del_flag char DEFAULT '0' NOT NULL COMMENT '删除标记 : 删除标记',
	PRIMARY KEY (id)
) COMMENT = 't_sms_send_record' DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;



