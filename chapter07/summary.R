# 定义一个包含变量名的向量myvars
# 这里选择了'mpg'（每加仑英里数）、'hp'（马力）和 'wt'（重量）这三个变量
myvars <- c("mpg", "hp", "wt")

# 查看mtcars数据集中由myvars指定的变量的前几行
# mtcars是R语言内置的一个数据集，包含了不同汽车的相关性能数据
# head函数用于显示数据的前几行，方便快速查看数据的结构和内容
head(mtcars[myvars])

# 通过summary计算描述性统计量
# summary函数可以对数据集中的变量计算一些基本的描述性统计信息，
# 如最小值、第一四分位数、中位数、均值、第三四分位数和最大值等
summary(mtcars[myvars])

# apply函数用于矩阵、sapply函数用于数据框
# 定义一个自定义函数mystats，用于计算数据的一些统计量
# 该函数接受一个向量x和一个逻辑参数na.omit，默认为FALSE
mystats <- function(x, na.omit = FALSE) {
  # 如果na.omit为TRUE，则移除向量x中的缺失值
  if (na.omit) {
    x <- x[!is.na(x)]
  }
  # 计算向量x的均值
  m <- mean(x)
  # 计算向量x的长度，即元素个数
  n <- length(x)
  # 计算向量x的标准差
  s <- sd(x)
  # 计算向量x的偏度
  # 偏度衡量数据分布的不对称程度
  skew <- sum((x - m)^3 / s^3) / n
  # 计算向量x的峰度
  # 峰度衡量数据分布的尖峰或平峰程度，这里减去3是为了得到相对于正态分布的峰度
  kurt <- sum((x - m)^4 / s^4) / n - 3
  # 返回一个包含样本数量、均值、标准差、偏度和峰度的向量
  return(c(n = n, mean = m, stdev = s, skewness = skew, kurtosis = kurt))
}

# 使用sapply函数对mtcars数据集中由myvars指定的变量应用mystats函数
# sapply函数会对数据框的每一列分别应用指定的函数，并返回一个矩阵或向量
sapply(mtcars[myvars], mystats)

# 定义一个新的函数dstats，它实际上是对sapply和mystats的封装
# 作用是对输入的数据框的每一列应用mystats函数
dstats <- function(x) {
  sapply(x, mystats)
}

# 分组计算描述性统计量
# by函数用于将数据按照指定的因子进行分组，并对每个组应用指定的函数
# 这里将mtcars数据集中由myvars指定的变量按照mtcars$am（汽车的换挡方式，0为自动，1为手动）进行分组
# 然后对每个组应用dstats函数，计算每个组内变量的统计量
by(mtcars[myvars], mtcars$am, dstats)
