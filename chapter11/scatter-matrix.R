# install.packages("GGally")
library(GGally)

# 主对角线是核密度图，主对角线下方是两两变量绘制的散点图，主对角线上方是Pearson相关系数。
ggpairs(mtcars[c("mpg", "disp", "drat", "wt")])

diagplots <- function(data, mapping) {
  ggplot(data = data, mapping = mapping) +
    geom_histogram(fill = "lightblue", color = "black")
}

lowerplots <- function(data, mapping) {
  ggplot(data = data, mapping = mapping) +
    geom_point(color = "darkgrey") +
    geom_smooth(method = "lm", color = "steelblue", se = FALSE) +
    geom_smooth(method = "loess", color = "red", se = FALSE, linetype = "dashed")
}

upperplots <- function(data, mapping) {
  # 调用 ggally_cor 函数，该函数用于计算并绘制相关性矩阵图
  ggally_cor(data = data, mapping = mapping, display_grid = F, size = 3.5, color = "red")
}

mytheme <-
  ggpairs(mtcars,
    columns = c("mpg", "disp", "drat", "wt"),
    columnLabels = c("MPG", "Displacement", "R Axle Ratio", "Weight"),
    title = "Scatter Plot Matrix with Linear and Loess Fits",
    lower = list(continuous = lowerplots),
    diag = list(continuous = diagplots),
    upper = list(continuous = upperplots)
  ) + theme(
    strip.background = element_blank(), panel.grid = element_blank(), panel.background = element_blank(),
    panel.border = element_rect(color = "grey20", fill = NA)
  )
