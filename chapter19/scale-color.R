library(ggplot2)

# scale_color_*函数用于点、线、边界和文本的颜色控制
# scale_fill_*函数用于面积的形状对象的颜色控制

# >>>>>> 连续型变量的颜色演示 <<<<<<

p1 <- ggplot(data = mtcars, aes(x = wt, y = mpg, colour = disp)) +
  geom_point(shape = 19, size = 3) +
  scale_x_continuous(name = "Weight", n.breaks = 10, minor_breaks = NULL, limits = c(1.5, 5.5)) +
  scale_y_continuous(
    name = "Miles per gallon", breaks = seq(10, 35, 5),
    minor_breaks = seq(10, 35, 1), limits = c(10, 35)
  )

# 默认颜色
p1 + ggtitle("Default color gradient")

# 灰阶图
p1 + scale_color_gradient(low = "grey", high = "black") +
  ggtitle("Greysacle color gradient")

# 从红到蓝
p1 + scale_color_gradient(low = "red", high = "blue") +
  ggtitle("Red-Blue color gradient")

# 分为5种离散颜色
p1 + scale_color_steps(low = "red", high = "blue") +
  ggtitle("Red-Blue binned color gradient")

# 从红到蓝再到白
p1 + scale_color_steps2(
  low = "red", mid = "white", high = "blue",
  midpoint = median(mtcars$disp)
) +
  ggtitle("Red-White-Blue binned color gradient")

# 反转颜色的渐变方向
p1 + scale_color_viridis_c(direction = -1) + ggtitle("Viridis color gradient")

# >>>>>> 离散型变量的颜色演示 <<<<<<
library(ISLR)

p2 <- ggplot(Wage, aes(race, fill = education)) +
  geom_bar(position = "fill") +
  labs(title = "Participant Education by Race")

# 默认颜色
p2 + ggtitle("Default color")

# Brewer调色板
p2 + scale_fill_brewer(palette = "Set2") + ggtitle("ColorBrewer Set2 palette")

# 默认的离散方案
p2 + scale_fill_viridis_d() + ggtitle("Viridis color scheme")

# 自定义颜色
p2 + scale_fill_manual(values = c("gold4", "orange2", "deepskyblue3",
                                  "brown2", "yellowgreen")) + ggtitle("Custom Color")
