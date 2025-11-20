# 当将变量映射到颜色、填充、形状、线条类型或大小时，ggplot2就会创建图例

ggplot(data = mtcars, aes(x = wt, y = mpg, colour = factor(cyl))) +
  geom_point(size = 3) +
  labs(
    title = "Fuel Efficiency by Car Weight",
    x = "Weight", y = "Miles per gallon"
  ) +
  scale_color_discrete(name = "Cylinders") +
# 设置图形的主题，以下是对主题中各个元素的详细设置
theme(
  # 设置图例的位置，c(.95, .95) 表示图例的左下角位于图形区域的相对坐标 (0.95, 0.95) 处
  # 这里使用相对坐标，取值范围是从 0 到 1，0 表示图形的左下角，1 表示图形的右上角
  legend.position = c(.95, .95),
  # 设置图例的对齐方式，c(1, 1) 表示图例的右上角与指定的位置对齐
  # 这里同样使用相对坐标，1 表示图例的右上角
  legend.justification = c(1, 1),
  # 设置图例的背景样式
  # element_rect() 函数用于创建一个矩形元素
  # fill = "lightgrey" 表示图例背景填充颜色为浅灰色
  # color = "white" 表示图例背景的边框颜色为白色
  # linewidth = 1 表示图例背景的边框线宽为 1
  legend.background = element_rect(fill = "lightgrey", color = "white", linewidth = 1),
  # 设置图例中每个项目的背景为空白，即不显示每个图例项目的背景（添加白色边框）
  legend.key = element_blank(),
  # 设置图例的排列方向为水平方向
  legend.direction = "horizontal"
)
