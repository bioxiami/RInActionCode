# 饼图在R语言中不吃香，因为人们觉得饼图不如条形图或者点图
# 因为相对于面积，人类对长度更加敏感？
install.packages("remotes")

remotes::install_github("rkabacoff/ggpie")

library(ggpie)

# 查看mpg数据集中车型的分布
ggpie(mpg, class)

# 删除图例并添加标题，标签放置于饼图区域之外
ggpie(mpg, class, legend = FALSE, offset = 1.3,
      title = "Automobiles by Car Class")

# 增加年份数据
ggpie(mpg, class, year, legend = FALSE, offset = 1.3,
      title = "Car Class by Year")
