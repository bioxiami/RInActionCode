library(ggplot2)

p1 <- ggplot(mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  labs(x = "Weight", y = "Miles per gallon")

# 默认主题，特征：浅灰色背景和白色网格线。被认为是出版标准，也是最不容易出错的主题
p1 + theme_grey() + labs(title = "theme grey")

# 经典的黑色和白色主题，特征：纯白色背景和深灰色网格线。在许多学术期刊中很受欢迎，因为它在黑白打印时非常清晰。
p1 + theme_bw() + labs(title = "theme bw")

# 一个简约透明的主题。特征：没有背景注释，只有坐标轴和基本的网格线。非常现代和干净，是当前数据可视化中最流行的主题之一。
p1 + theme_minimal() + labs(title = "theme minimal")

# 模仿经典的基础 R 绘图的外观。特征：没有网格线，只有坐标轴。给人一种简洁、传统的印象。
p1 + theme_classic() + labs(title = "theme classic")

# 与 theme_bw() 类似，但线条更细、颜色更浅。特征：浅灰色网格线和白色背景
p1 + theme_light() + labs(title = "theme light")

# theme_light() 的深色版本。特征：深灰色背景和浅灰色网格线。适合在光线较暗的环境下演示，或者为了与浅色元素形成高对比度。
p1 + theme_dark() + labs(title = "theme dark")

# 一个完全空的主题，移除了所有非数据元素。特征：没有坐标轴、网格线、标题或标签，只有一个纯粹的绘图区域。
p1 + theme_void() + labs(title = "theme void")

# 这是一个主题宝库，提供了大量模仿知名出版物和软件风格的预设主题。
library(ggthemes)

# 模仿《经济学人》杂志的风格
p1 + theme_economist() + labs(title = "theme economist")

# 模仿《华尔街日报》的风格
p1 + theme_wsj() + labs(title = "theme wsj")

# 基于 Edward Tufte 的数据墨水比原则设计，极简风格
p1 + theme_tufte() + labs(title = "theme tufte")

# 模仿 FiveThirtyEight 网站的风格
p1 + theme_fivethirtyeight() + labs(title = "theme FiveThirtyEight")

# 模仿 Stata 统计软件的绘图风格
p1 + theme_stata() + labs(title = "theme Stata")

# 使用 Solarized 调色板，提供浅色和深色两种模式
p1 + theme_solarized() + labs(title = "theme Solarized")
