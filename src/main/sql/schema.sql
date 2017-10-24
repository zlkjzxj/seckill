--数据库脚本初始化

--创建数据库
CREATE DATABASE seckill;

--使用数据库
USE seckill;

--创建秒杀数据库
CREATE TABLE seckill (
  `seckill_id`  BIGINT      NOT NULL AUTO_INCREMENT
  COMMENT '商品库存id',
  `name`        VARCHAR(20) NOT NULL
  COMMENT '商品名称',
  `number`      INT         NOT NULL
  COMMENT '库存数量',
  `start_time`  TIMESTAMP   NOT NULL
  COMMENT '秒杀开始时间',
  `end_time`    TIMESTAMP   NOT NULL
  COMMENT '秒杀结束时间',
  `create_time` TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP
  COMMENT '创建时间',
  PRIMARY KEY (seckill_id),
  KEY idx_start(start_time),
  KEY idx_end(end_time),
  KEY idx_create(create_time)
)
  ENGINE = InnoDB
  AUTO_INCREMENT = 1000
  DEFAULT CHARSET = UTF8
  COMMENT = '秒杀库存表';

--初始化数据
INSERT INTO seckill ( NAME, NUMBER, start_time, end_time)
VALUES
('1000元秒杀iphone6 p', 200, '2017-10-23 00:00:00', '2017-10-23 00:00:00'),
('500元秒杀红米note2', 300, '2017-10-23 00:00:00', '2017-10-23 00:00:00'),
('8000元秒杀honor 8', 400, '2017-10-23 00:00:00', '2017-10-23 00:00:00'),
('2000元秒杀mate10', 500, '2017-10-23 00:00:00', '2017-10-23 00:00:00');

--创建秒杀记录表
--用户认证相关的信息

CREATE TABLE success_killed (
  `seckIll_id`  BIGINT    NOT NULL
  COMMENT '商品id',
  `user_phone`  BIGINT    NOT NULL
  COMMENT '用户手机号',
  `state`       TINYINT   NOT NULL DEFAULT -1
  COMMENT '状态标识： -1：无效 0：成功 1：已付款 2：已发货',
  `create_time` TIMESTAMP NOT NULL
  COMMENT '创建时间',
  PRIMARY KEY (seckIll_id, user_phone), /*联合主键*/
  KEY idx_create(create_time)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = UTF8
  COMMENT = '秒杀成功记录明细表';

--为什么要手写DDL;
--记录每次上线的DDL修改，方便查阅。


--使用过程中出现问题，穿件表的时候不能同时创建多个timestamp 类型，修改my.cnf 添加

SQL - MODE ="NO_ENGINE_SUBSTITUTION"

mysql 忘记密码 my.cnf 添加 skip- GRANT - TABLES

修改密码

USE mysql;
UPDATE user
SET authentication_string = passowd('root')
WHERE user = 'root';