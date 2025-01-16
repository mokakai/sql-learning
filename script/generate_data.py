import pymysql
from faker import Faker
from pymysql.err import MySQLError

# 创建 Faker 实例
fake = Faker()

# 数据库配置
DB_CONFIG = {
    "host": "localhost",    # 服务器地址
    "port": 3306,           # 数据库服务端口
    "user": "root",         # 登录用户
    "password": "Mm@12345", # 登录密码
    "database": "moka_blog" # 数据库名字
}


def insert_fake_users(num):
    """
    插入随机生成的用户数据到数据库
    :param num: 要插入的数据条数
    """
    try:
        # 连接数据库
        db = pymysql.connect(**DB_CONFIG)
        cursor = db.cursor()

        print(f"正在生成 {num} 条用户数据...")

        # 插入用户数据
        for _ in range(num):
            username = fake.user_name()
            email = fake.email()
            password = fake.password(length=10)
            bio = fake.sentence()
            avator = fake.image_url()
            createdate = fake.date_time_this_year()

            sql = """
                INSERT INTO users (username, email, password, bio, avator, createdate,createuser)
                VALUES (%s, %s, %s, %s, %s, %s,'Moka')
            """
            cursor.execute(sql, (username, email, password, bio, avator, createdate))

        # 提交事务
        db.commit()
        print(f"成功插入 {num} 条数据！")

    except MySQLError as e:
        print(f"数据库操作失败：{e}")

    finally:
        # 关闭数据库连接
        if 'db' in locals():
            cursor.close()
            db.close()
            print("数据库连接已关闭。")


# 调用函数生成 100 条用户数据
insert_fake_users(100)
