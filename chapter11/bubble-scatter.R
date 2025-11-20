# 创建一个二维散点图，使用点的大小来代表第三个变量的值（相当于多了一个维度的信息）
ggplot(mtcars, aes(x = wt, y = mpg, size = disp)) +
  geom_point() +
  labs(title = "Bubble Plot")

# 设置点的大小和颜色（相当于多了两个维度的信息，可以可视化2+2=4个变量）
ggplot(mtcars, aes(x = wt, y = mpg, size = disp, fill = factor(cyl))) +
  geom_point(alpha = .5, color = "black", shape = 21) +
  scale_size_continuous(range = c(1, 10)) +
  labs(
    title = "Auto mileage by weight and horsepower",
    x = "Weight", y = "Miles/Gallon",
    size = "Engine\ndisplacement", fill = "Cylinders"
  ) +
  theme_minimal()

# 气泡图和饼图缺点一样，就是不够直观，但是非常受商业应用的欢迎。