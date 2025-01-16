### 为什么Mysql没有schema的划分

MySQL 的确有类似 schema 的功能，只是名称和实现方式与其他数据库（如 PostgreSQL 或 Oracle）不同。在 MySQL 中，schema 和 database 是等价的概念。换句话说，MySQL 使用 database 作为逻辑上的划分单位，而不是单独的 schema 层次

### MySQL 没有独立 schema 的原因

#### 1.历史设计:
- MySQL 的早期设计目标是简单和易用，它以 database 为逻辑分组，而没有单独的 schema 概念
- 在 MySQL 的生态中，许多开发者已经习惯用 database 来组织数据

#### 2.文件系统的映射：
- MySQL 的每个 database（schema）在底层直接对应文件系统中的一个目录，每张表对应一个文件或一组文件。这种设计方便了备份和管理，但限制了更复杂的 schema 概念的引入

#### 3.与其他 RDBMS 的对比：
- PostgreSQL 和 Oracle 允许在一个数据库中创建多个 schema，schema 是数据库中的一个逻辑分组单位
- 在 MySQL 中，逻辑分组单位只有 database，每个 database 中直接存放表和其他数据库对象（如视图、存储过程

### MySQL 的替代方案
如果需要类似 schema 的功能，可以通过以下方式实现：

#### 1. 使用多个 database
- 每个 schema 相当于 MySQL 中的一个 database
- 使用 USE database_name 切换逻辑分组
- 表命名方式：database_name.table_name

#### 2.表命名规则
- 在同一个 database 中，通过命名规则模拟 schema 分组。
- 比如：将 schema1 和 schema2 表放在同一个 database 中：
    - schema1_table1
    - schema1_table2
    - schema2_table1

#### 3.通过权限隔离
- 可以为不同的 database 设置不同的用户和权限，达到 schema 的分组管理效果


