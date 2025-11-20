# 下面的代码用于计算`mtcars`数据集各变量之间的相关系数，并将结果保留两位小数
# `cor(mtcars)` 函数用于计算 `mtcars` 数据集中各变量之间的相关系数矩阵
# `round(..., 2)` 函数用于将相关系数矩阵中的每个值进行四舍五入，保留两位小数
round(cor(mtcars), 2)

# install.packages("corrgram")
library(corrgram)

# 蓝色和从左下到右上的的斜杆表示变量正相关，反之表示负相关。颜色越深，相关性越大。
# 饼图占用面积越大，相关性越大
# order设置为T，则使用主成分分析法对变量重排序
corrgram(mtcars,
  order = T, lower.panel = panel.shade,
  upper.panel = panel.pie, text.panel = panel.txt,
  main = "Corrgram of mtcars"
)

# 在下三角区使用平滑拟合曲线和置信椭圆，上三角区使用散点图
corrgram(mtcars,
         order = T, lower.panel = panel.ellipse,
         upper.panel = panel.pts, text.panel = panel.txt,
         diag.panel = panel.minmax,
         main = "Corrgram of mtcars"
)

# 在下三角区使用阴影，上三角区输出相关系数
corrgram(mtcars,
         order = T, lower.panel = panel.shade,
         upper.panel = panel.cor,
         main = "Corrgram of mtcars"
)



