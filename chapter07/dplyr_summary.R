library(dplyr)
# install.packages("carData")
library(carData)

# 计算最大值、最小值、中位数
Salaries %>% summarize(
  med = median(salary),
  min = min(salary),
  max = max(salary)
)

# 指定分类变量后，为分类变量的每个组合生产对应统计量
Salaries %>%
  group_by(rank, sex) %>%
  summarize(
    n = length(salary),
    med = median(salary),
    min = min(salary),
    max = max(salary)
  )

# 以下代码使用了R语言中的dplyr包，其目的是对Salaries数据集进行分组、选择列并计算统计量
# 从Salaries数据集中开始操作
Salaries %>%
  # 按照rank（职称）和sex（性别）这两个变量对数据进行分组
  # 分组后后续的操作会针对每个不同的rank和sex组合分别进行
  group_by(rank, sex) %>%
  # 从分组后的数据中选择yrs.service（服务年限）和yrs.since.phd（获得博士学位后的年限）这两列
  select(yrs.service, yrs.since.phd) %>%
  # 对选择的列（即yrs.service和yrs.since.phd）应用summarise_all函数
  # 该函数会对每列分别计算指定的统计量，这里指定的是mean（均值）
  # 最终会得到每个rank和sex组合下，yrs.service和yrs.since.phd的均值
  summarise_all(mean)
