library(ggplot2)

# 添加了点标签的散点图，标签重叠没法看
ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "steelblue") +
  geom_text(label = row.names(mtcars)) +
  labs(x = "Weight", y = "Miles per gallon")

# 使用ggrepel这个包，可以解决标签重叠问题
# install.packages("ggrepel")
library(ggrepel)

ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point(color = "steelblue") +
  geom_hline(
    yintercept = median(mtcars$mpg),
    linetype = "dashed", color = "steelblue"
  ) +
  # 添加参考线标签，标签位置是靠试出来的，使用坐标进行定位
  geom_label(x = 5.2, y = 20.5, label = "median MPG", color = "white", fill = "steelblue", size = 3) +
  geom_text_repel(label = row.names(mtcars), size = 3) +
  labs(x = "Weight", y = "Miles per gallon")

# 为条形图增加百分比标签
library(ggplot2)
library(dplyr)
library(ISLR)

# 计算百分比
plotdata <- ISLR::Wage %>%
  group_by(race) %>%
  summarise(n = n()) %>%
  mutate(pct = n / sum(n), lbls = scales::percent(pct))

ggplot(data = plotdata, aes(x = race, y = pct)) +
  # 使用y的实际值绘制条形图
  geom_bar(stat = "identity", fill = "steelblue") +
  # 绘制条形图的标签
  geom_text(aes(label = lbls),
    vjust = -0.5,
    size = 3
  ) +
  labs(title = "Particularly By Race", x = "", y = "Percent") +
  theme_minimal()

# 计算百分比
plotdata <- ISLR::Wage %>%
  group_by(race, education) %>%
  summarise(n = n()) %>%
  mutate(pct = n / sum(n), lbls = scales::percent(pct))

#
ggplot(data = plotdata, aes(x = race, y = pct, fill = education)) +
  # 使用y的实际值绘制条形图
  geom_bar(stat = "identity", position = "fill", color = "steelblue") +
  scale_y_continuous("percent", label = scales::percent_format(accuracy = 2), n.breaks = 10) +
  labs(title = "Particularly By Race and Education", fill = "Education") +
  # position_stack函数可以确保每个堆积段的百分比标签都放到合适的位置
  geom_text(aes(label = lbls), size = 3, position = position_stack(vjust = 0.5)) +
  theme_minimal() +
  theme(panel.grid.major.x = element_blank())
