library("RMySQL") ##读取Mysql
con <- dbConnect(MySQL(),host="127.0.0.1",dbname="test",user="root",password="root")
##建立连接，host好像是ip地址

summary(con)
dbGetInfo(con)
dbListTables(con)
dbRemoveTable(con,"a") ##删除mysql数据库中数据

a<-data.frame(name=c("陈","李","高钓鱼"),r=c(1,2,4))
dbWriteTable(con,"b",a,overwrite=TRUE) ##写入数据库 b是数据库里表格名称；a是r里数据集名称
dbListTables(con) ##查看数据库表单
dbSendQuery(con,'SET NAMES utf8') ##设置数据库编码
dbSendQuery(con,'SET NAMES gbk')  ##设置数据库编码(我这台计算机用gbk)
a1<-dbReadTable(con,"ti_wind_cw_date")  ##读取出数据
dbWriteTable(conn, "b", b,row.names=FALSE,overwrite=TRUE)

dbGetQuery(con, "SELECT * FROM t_demo where c>0") ##sql语句提取数据

dbReadTable(con,"b")

dbDisconnect(con) ##关闭接口
