find_font <- function(x) {
  # install.packages("showtext")
  suppressMessages(require(showtext))
  suppressMessages(require(dplyr))
  # path 字体文件的系统路径
  # file 字体文件名（含扩展名），与 path 组合后构成完整文件路径
  # family 字体系列名称，用于 R 中指定字体时常用的名字
  # face 字体款式："plain", "bold", "italic", "oblique", "bold.italic"
  filter(sysfonts::font_files(), grepl(x, family, ignore.case = T)) %>% select(path, file, family, face)
}

find_font("Bookman")

ggplot(data = mtcars, aes(x = wt, y = mpg)) +
  geom_point() +
  labs(
    title = "Fuel Efficiency by Car Weight",
    subtitle = "Motor Trend Magazine 1973", caption = "source mtcars dataset",
    x = "Weight", y = "Miles per gallon"
  ) +
  theme(
    plot.title = element_text(family = "DejaVu Sans Mono", size = 14),
    plot.subtitle = element_text(family = "DejaVu Serif Condensed"),
    plot.caption = element_text(family = "C059", size = 15),
    axis.title = element_text(family = "Droid Sans Fallback"),
    axis.text = element_text(family = "DejaVu Serif", face = "bold.italic", size = 8)
  )
