data("mtcars")

# 绘制散点图并添加线性拟合直线、loess拟合曲线（基于局部加权多项式回归的非参数拟合曲线，为数据提供平滑的趋势线）
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = "lm", se = F, color = "red") +
  geom_smooth(method = "loess", se = F, color = "blue", linetype = "dashed") +
  labs(
    title = "Basic Scatter Plot of MPG vs. Weight",
    x = "Car Weight", y = "Miles Per Gallon"
  )

# 添加单独的最佳拟合曲线
# labs中的color和shape分别设置颜色和形状的图例，如果设置为一样的值，则二者重叠
ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl), shape = factor(cyl))) +
  geom_point(size = 2) +
  geom_smooth(method = "lm", se = F) +
  geom_smooth(method = "loess", se = F, linetype = "dashed") +
  labs(
    title = "Scatter Plot of MPG vs. Weight",
    subtitle = "By Number of Cylinders",
    x = "Car Weight", y = "Miles Per Gallon",
    color = "Number of \nCylinders (Color)",
    shape = "Number of \nCylinders (Shape)"
  ) +
  theme_bw()

ggplot(mtcars, aes(x = wt, y = mpg, color = factor(cyl), shape = factor(cyl))) +
  geom_point(size = 2) +
  geom_smooth(method = "lm", se = F) +
  geom_smooth(method = "loess", se = F, linetype = "dashed") +
  labs(
    title = "Scatter Plot of MPG vs. Weight",
    subtitle = "By Number of Cylinders",
    x = "Car Weight", y = "Miles Per Gallon",
    color = "Number of \nCylinders",
    shape = "Number of \nCylinders"
  ) +
  theme_bw()
