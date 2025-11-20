set.seed(1234)

n <- 10000
c1 <- matrix(rnorm(n, mean = 0, sd = .5), ncol = 2)
c2 <- matrix(rnorm(n, mean = 3, sd = 2), ncol = 2)
mydata <- rbind(c1, c2)
mydata <- as.data.frame(mydata)
names(mydata) <- c("x", "y")

# 当数据很多而且重叠严重时，使用散点图来观察变量关系就有点力不从心了
ggplot(mydata, aes(x = x, y = y)) +
  geom_point() +
  ggtitle("High density Scatter")

# 利用核密度估计生成用颜色密度来表示点分布的散点图
# install.packages("KernSmooth")
with(mydata, smoothScatter(x, y, main = "High density Smoothed Scatter"))

# 将二元变量的封箱放到六边形单元格中
ggplot(mydata, aes(x = x, y = y)) +
  # geom_hex函数用于创建六边形分箱图
  # bins参数指定六边形的数量，这里设置为50，表示将绘图区域划分为50个六边形进行分箱
  geom_hex(bins = 50) +
  # scale_fill_continuous函数用于连续型变量的填充颜色比例设置
  # trans = "reverse"表示对填充颜色的比例进行反转，即颜色深浅的顺序与默认相反
  scale_fill_continuous(trans = "reverse") +  
  ggtitle("High density Smoothed Scatter")
