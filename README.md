# Input-tip
# 核心其实是SQL语句
String sql="select text from library where (spell like '%"+text+"%') or (text like '%"+text+"%')";
数据库中存储这些tip,sql语句直接查询提取
