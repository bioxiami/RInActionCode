# install.packages("scatterplot3d")
library(scatterplot3d)

with(mtcars, scatterplot3d(wt, disp, mpg, main = "Basic 3D Scatter Plot"))

# 在图中添加垂直于平面的线条
s3d <- with(
  mtcars,
  scatterplot3d(wt, disp, mpg,
    # pch 参数用于指定散点的符号样式，pch = 16 表示使用实心圆作为散点的符号
    pch = 16,
    # highlight.3d 参数用于控制是否突出显示三维效果
    # 设置为 T（即 TRUE）表示突出显示三维效果
    highlight.3d = T,
    # type 参数用于指定散点图的类型
    # 这里 type = "h" 表示绘制垂直于平面的线条
    type = "h",
    # main 参数用于设置图形的主标题
    # 这里将主标题设置为 "3D Scatter Plot With Vertical Lines"
    main = "3D Scatter Plot With Vertical Lines"
  )
)

s3d

# 以下代码用于构建一个线性回归模型，并尝试绘制该模型的三维平面
# 构建线性回归模型
# 使用lm()函数构建一个线性回归模型，该模型用于预测汽车的每加仑英里数（mpg）
# 预测变量为汽车的重量（wt）和发动机排量（disp）
# 数据来源为mtcars数据集
fit <- lm(mpg ~ wt + disp, data = mtcars)

# 绘制线性回归模型的三维平面
# 调用s3d对象的plane3d()方法，将前面构建的线性回归模型fit作为参数传入
# 目的是在三维空间中绘制该线性回归模型所代表的平面
s3d$plane3d(fit)
