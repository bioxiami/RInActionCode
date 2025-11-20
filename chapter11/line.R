# 散点图用线连接起来就是折线图

tree1 <- subset(Orange, Tree == 1)

ggplot(data = tree1, aes(x = age, y = circumference)) +
  geom_point(size = 2) +
  geom_line() +
  labs(
    title = "Orange Tree 1 Growth",
    x = "Age", y = "Circumference"
  ) +
  theme_bw()

# geom_line函数支持将分类变量映射到下面的选项 size、color、linetype
ggplot(data = Orange, aes(x = age, y = circumference, linetype = Tree, color = Tree)) +
  geom_point(size = 2) +
  geom_line(size = 1) +
  scale_color_brewer(palette = "Set1") +
  labs(
    title = "Orange Tree 1 Growth",
    x = "Age", y = "Circumference"
  ) +
  theme_bw()
