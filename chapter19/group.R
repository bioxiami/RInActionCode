library(ggplot2)
library(patchwork)

p1 <- ggplot(mtcars, aes(disp, mpg)) +
  geom_point() +
  labs(x = "Engine displacement", y = "Miles per gallon")

p2 <- ggplot(mtcars, aes(factor(cyl), mpg)) +
  geom_boxplot() +
  labs(x = "Number of cylinders", y = "Miles per gallon")

p3 <- ggplot(mtcars, aes(mpg)) +
  geom_histogram(bins = 8, fill = "darkgrey", color = "white") +
  labs(x = "Miles per gallon", y = "Frequency")

# | 横向组合图形，/ 纵向组合图形

(p1 | p2) / p3
