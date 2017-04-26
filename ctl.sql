CREATE TABLE users(
  userid BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '用户ID',
  username VARCHAR(20) NOT NULL UNIQUE COMMENT '用户名',
  nickname VARCHAR(20) NOT NULL UNIQUE COMMENT '昵称',
  age SMALLINT COMMENT '年龄',
  privilege_lvl TINYINT NOT NULL DEFAULT 1 COMMENT '权限等级',
  sign_up_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间'
)ENGINE=INNODB AUTO_INCREMENT=10000000 DEFAULT CHARSET=utf8 COMMENT='用户表';

CREATE TABLE privilege_lvls(
  lvl TINYINT PRIMARY KEY COMMENT '等级',
  role VARCHAR(10) NOT NULL UNIQUE COMMENT '角色'
)ENGINE=INNODB CHARSET=utf8 COMMENT='角色表';

CREATE TABLE blocks(
  blockid SMALLINT AUTO_INCREMENT PRIMARY KEY COMMENT '板块ID',
  blockname VARCHAR(20) NOT NULL UNIQUE COMMENT '板块名',
  father_blockid SAMLLINT NOT NULL DEFAULT 0 COMMENT '父板块ID'
)ENGINE=INNODB CHARSET=utf8 COMMENT='板块表';

CREATE TABLE posts(
  postid INT AUTO_INCREMENT PRIMARY KEY COMMENT '主题帖ID',
  poster_title VARCHAR(40) NOT NULL COMMENT '主题帖标题',
  blockid SMALLINT NOT NULL COMMENT '所属板块ID',
  posterid BIGINT NOT NULL COMMENT '发帖人ID',
  post_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMMENT '发帖时间'
)ENGINE=INNODB CHARSET=utf8 COMMENT='主题帖表';
  
CREATE TABLE comments(
  commentid BIGINT AUTO_INCREMENT PRIMARY KEY COMMENT '留言ID',
  comment_value VARCHAR(225) NOT NULL COMMENT '留言内容',
  re_commentid BIGINT NOT NULL DEFAULT 0 COMMENT '所回复的留言ID',
  postid INT NOT NULL COMMENT '所属主题帖ID',
  commenterid BIGINT NOT NULL COMMENT '留言人ID',
  comment_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMMENT '留言时间'
)ENGINE=INNODB CHARSET=utf8 COMMENT='留言表';
