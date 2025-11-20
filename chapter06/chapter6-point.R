library(ggplot2)
library(dplyr)

plotdata <- mpg %>%
  filter(year == "2008") %>%
  group_by(model) %>%
  summarise(meanHwy = mean(hwy))

plotdata

# 展示每种车型每加仑汽油行驶的英里数
ggplot(plotdata, aes(x = meanHwy, y = model)) +
  geom_point() +
  labs(
    x = "Miles Per Gallon",
    y = "", title = "Gas Mileage for Car Models"
  )

# 加上排序（卡罗拉这么牛逼？）
ggplot(plotdata, aes(x = meanHwy, y = reorder(model, meanHwy))) +
  geom_point() +
  labs(
    x = "Miles Per Gallon",
    y = "", title = "Gas Mileage for Car Models"
  )
