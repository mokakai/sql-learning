create table users(
	id int auto_increment primary key, 				-- 用户唯一标识符
	username varchar(50) not null unique,			-- 用户名 唯一
	email varchar(100) not null unique,				-- 邮箱 唯一
	password varchar(255) not null,					-- 加密后密码
	bio text default null,							-- 个人简介
	avator varchar(255) default null,				-- 头像链接
	createdate timestamp default current_timestamp,	-- 注册时间
	updatedate timestamp default current_timestamp on update current_timestamp,-- 最后更新时间
	createuser varchar(50) not null,				-- 创建人
	updateuser varchar(50) 					-- 更新人
)

create table posts(
	id int auto_increment primary key, 				-- 文章唯一标识符
	userid int not null,							-- 发布文章的用户 ID
	title varchar(200) not null,					-- 文章标题
	content text not null,							-- 文章内容
	categoryid int not null,						-- 分类ID
	createdate timestamp default current_timestamp,	-- 发布时间
	updatedate timestamp default current_timestamp on update current_timestamp	-- 最后更新时间
)

create table categories(
	id int auto_increment primary key, 				-- 分类唯一标识
	name VARCHAR(100) not null,						-- 分类名称
	description text ,								-- 分类描述
	createdate timestamp default current_timestamp,	-- 发布时间
	updatedate timestamp default current_timestamp on update current_timestamp,	-- 最后更新时间
	createuser varchar(50) not null					-- 创建人
)

create table tags(
	id int auto_increment primary key, 				-- 标签唯一标识
	name VARCHAR(100) not null,						-- 标签名称
	createdate timestamp default current_timestamp,	-- 发布时间
	updatedate timestamp default current_timestamp on update current_timestamp,	-- 最后更新时间
	createuser varchar(50) not null					-- 创建人
)

create table post_tags(
	postid int not null, 				-- 文章ID
	tagid int not null					-- 标签ID
)

create table comments(
	id int auto_increment primary key, 				-- 评论唯一标识
	postid int not null, 							-- 文章ID
	userid int, 									-- 用户ID
	content text not null,							-- 评论内容
	createdate timestamp default current_timestamp	-- 发布时间
)

create table likes(
	id int auto_increment primary key, 				-- 评论唯一标识
	postid int not null, 							-- 文章ID
	userid int, 									-- 用户ID					
	createdate timestamp default current_timestamp	-- 发布时间
)

create table favorites(
	id int auto_increment primary key, 				-- 收藏唯一标识
	postid int not null, 							-- 被收藏文章ID
	userid int, 									-- 用户ID					
	createdate timestamp default current_timestamp	-- 发布时间
)