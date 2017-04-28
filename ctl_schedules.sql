-- 数据库初始化脚本

-- 创建数据库
CREATE DATABASE ctf;
-- 使用数据库
use ctf;
-- 创建用户表
CREATE TABLE users(
  user_id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '用户ID',
  user_name VARCHAR(20) NOT NULL UNIQUE COMMENT '用户名',
  password VARCHAR(20) NOT NULL COMMENT '密码',
  nick_name VARCHAR(20) NOT NULL UNIQUE COMMENT '昵称',
  age SMALLINT COMMENT '年龄',
  email VARCHAR(40) NOT NULL UNIQUE COMMENT '邮箱',
  md5 VARCHAR(40) NOT NULL COMMENT '邮箱验证码',
  validated TINYINT NOT NULL DEFAULT 0 COMMENT '验证状态',
  privilege_lvl TINYINT NOT NULL DEFAULT 1 COMMENT '权限等级',
  lvl TINYINT NOT NULL DEFAULT 1 COMMENT '用户等级',
  experience INT NOT NULL DEFAULT 0 COMMENT '经验值',
  head_img VARCHAR(20) NOT NULL COMMENT '头像',
  sign_up_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间'
)ENGINE=INNODB AUTO_INCREMENT=10000000 DEFAULT CHARSET=utf8 COMMENT='用户表';

 insert into 
      users (user_name, password, nick_name, age, email, md5, validated, privilege_lvl, lvl, head_img, sign_up_time)
    values 
      ('admin', '123456', 'admin', 22, 'jssjh2008@163.com', '232323232323', 1, 99, 100, '001.png'),
      ('moonshine', '12345678', 'moonshine', 23, 'jssjh2014@126.com', '232323232343', 1, 1, 50, '002.png');
--创建角色表
CREATE TABLE privilege_lvls(
  lvl TINYINT PRIMARY KEY COMMENT '等级',
  role VARCHAR(10) NOT NULL UNIQUE COMMENT '角色'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='角色表';

--创建称号表
CREATE TABLE lvl_names(
  lvl TINYINT PRIMARY KEY COMMENT '等级',
  name VARCHAR(20) NOT NULL UNIQUE COMMENT '称号'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='称号表';

--创建板块表
CREATE TABLE blocks(
  block_id SMALLINT AUTO_INCREMENT PRIMARY KEY COMMENT '板块ID',
  block_name VARCHAR(20) NOT NULL UNIQUE COMMENT '板块名',
  father_block_id SMALLINT NOT NULL DEFAULT 0 COMMENT '父板块ID'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='板块表';

--创建主题贴表
CREATE TABLE posts(
  post_id INT AUTO_INCREMENT PRIMARY KEY COMMENT '主题帖ID',
  post_title VARCHAR(40) NOT NULL COMMENT '主题帖标题',
  block_id SMALLINT NOT NULL COMMENT '所属板块ID',
  poster_id BIGINT NOT NULL COMMENT '发帖人ID',
  post_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发帖时间'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='主题帖表';
  
--创建留言表
CREATE TABLE comments(
  comment_id BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '留言ID',
  comment_value VARCHAR(225) NOT NULL COMMENT '留言内容',
  re_commentid BIGINT NOT NULL DEFAULT 0 COMMENT '所回复的留言ID',
  post_id INT NOT NULL COMMENT '所属主题帖ID',
  commenter_id BIGINT NOT NULL COMMENT '留言人ID',
  comment_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '留言时间'
)ENGINE=INNODB DEFAULT CHARSET=utf8 COMMENT='留言表';
