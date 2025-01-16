### 安装Mysql

### 查看Linux当前用户

```
whoami

moka_linux //当前用户不具备开启mysql 服务的权限

```

### 切换到更高权限的root用户

```
service mysql start //开启Mysql服务

```

```
sudo apt update
sudo apt install mysql-server
```

### 开启Mysql服务
```
sudo service mysql start

 * Starting MySQL database server mysqld  
```

### 检查Mysql是否开启
```
sudo service mysql status

 * MySQL is stopped.

```

### 关闭Mysql服务
```
sudo service mysql stop

 * stopped MySQL database server mysqld  
```

### 数据库密码 Mm@12345 

### 登录Mysql

```
mysql -u root -p //使用root用户登录 -p需要输入密码

```
### 退出Mysql登录

```
输入quit

mysql> quit
Bye
```

### 查看mysql数据库名字命令

```
SHOW DATABASES; 

+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+


```
### 使用可视化工具DBeaver连接Mysql

```
IP:localhost 端口:3306
数据库:mysql  用户:root 密码： Mm@12345
```


