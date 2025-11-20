library(ggplot2)

mtcars$am <- factor(mtcars$am, labels = c("Automatic", "Manual"))

ggplot(data = mtcars, aes(x = disp, y = mpg)) +
  geom_point(aes(color = factor(cyl)), size = 2) +
  # 添加平滑曲线图层 method = "lm"：使用线性回归方法进行拟合
  # formula = y ~ x + I(x^2)：指定拟合的公式，包含自变量x和x的二次项
  # linetype = "dotted"：设置曲线的线型为虚线se = F：不显示置信区间
  geom_smooth(method = "lm", formula = y ~ x + I(x^2), linetype = "dotted", se = F) +
  # 对颜色进行离散化处理，并设置图例标题
  # "Number of cylinders"：图例的标题为“Number of cylinders”
  scale_color_discrete("Number of cylinders") +
  # 进行分面绘图 ~am：根据变量am（变速器类型）进行分面，ncol = 2：设置分面的列数为2
  facet_wrap(~am, ncol = 2) +
  labs(
    title = "Mileage, transmission type, and number of cylinders",
    x = "Engine displacement", 
    y = "Miles per gallon"
  ) +
  theme_bw() +
  # 进一步自定义主题
  theme(
    # 设置分面标签的背景为白色
    strip.background = element_rect(fill = "white"),
    # 设置主要网格线的颜色为浅灰色
    panel.grid.major = element_line(color = "lightgrey"),
    # 设置次要网格线的属性
    panel.grid.minor = element_line(
      # 次要网格线的颜色为浅灰色
      color = "lightgrey",
      # 次要网格线的线型为虚线
      linetype = "dashed"
    ),
    # 隐藏坐标轴刻度线
    axis.ticks = element_blank(),
    # 将图例放置在图形的顶部
    legend.position = "top",
    # 隐藏图例的背景
    legend.key = element_blank()
  )
