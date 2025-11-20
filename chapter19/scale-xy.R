# scale 比例尺、刻度
# scale_x_*、scale_y_*函数控制图形的x轴和y轴，可以指定多种标尺的类型

# aes是aesthetics的缩写，美学；美学理论；艺术美，可以理解为图形美感属性。
library(ggplot2)

# 使用默认参数绘制：按汽车重量计算的燃油效率
ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  labs(title = "Fuel efficiency by car weight")

# breaks设置主刻度线位置的数字向量、minor_breaks设置次刻度线位置的数字向量
# 主刻度可以理解为坐标轴上的大的刻度，次刻度可以理解为主刻度之间的小刻度
# limits设置坐标的最大值和最小值
ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  scale_x_continuous(name = "Weight", n.breaks = 10, minor_breaks = NULL, limits = c(1.5, 5.5)) +
  scale_y_continuous(
    name = "Miles per gallon", breaks = seq(10, 35, 5),
    minor_breaks = seq(10, 35, 1), limits = c(10, 35)
  ) +
  labs(title = "Fuel efficiency by car weight")




# 自定义变量的坐标轴
# 数据集 install.packages("ISLR")
library(ISLR)

# 实际上并没有major这一列啊，英文版的是取race这一列
ggplot(Wage, aes(race, fill = education)) +
  geom_bar(position = "fill") +
  labs(title = "Participant Education by Race")