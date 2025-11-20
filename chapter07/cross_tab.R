library(vcd)

# 列联表，也叫做交叉表或交叉列联表，是一种用于整理和显示两个或多个分类变量之间关系的表格。

# 一维列联表，书上的是with(Arthritis, table(Improved))，和下面一样的效果
mytable1 <- table(Arthritis$Improved)
mytable1

# 二维列联表
mytable2 <- table(Arthritis$Treatment, Arthritis$Improved)
mytable2

# 在 R 语言中，~ 符号被称为 “波浪符”，它的一个核心作用是创建公式对象。
# 公式格式：因变量 ~ 自变量1 + 自变量2 + ...
mytable3 <- xtabs(~ Treatment + Improved, data = Arthritis)
mytable3

# 多维列联表
mytable4 <- xtabs(~ Treatment + Sex + Improved, data = Arthritis)
mytable4
