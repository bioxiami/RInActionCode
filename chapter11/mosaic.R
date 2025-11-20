# 加载vcd包，vcd（Visualizing Categorical Data）是一个用于可视化分类数据的R包
library(vcd)

# 查看Titanic数据集，Titanic数据集是R中内置的一个关于泰坦尼克号乘客信息的数据集
Titanic

# 使用ftable函数将Titanic数据集转换为扁平表形式，方便查看多维分类数据的频率分布
ftable(Titanic)

# 使用mosaic函数绘制马赛克图，马赛克图可以直观地展示多维分类数据之间的关系
# shade = T表示根据残差对图形进行着色，有助于发现变量之间的关联
# legend = T表示显示图例
mosaic(Titanic, shade = T, legend = T)

# 另一种使用mosaic函数的方式，通过公式指定变量的顺序
# ~ Class + Sex + Age + Survived 表示以Class、Sex、Age和Survived这些变量来构建马赛克图
# data = Titanic 表示使用Titanic数据集
# shade = T和legend = T的含义与上面相同
mosaic(~ Class + Sex + Age + Survived, data = Titanic, shade = T, legend = T)

# 马赛克图：一种用于显示 两个或多个分类变量之间关系 的图表
# 横向宽度 表示某一类别所占比例，纵向高度 表示该类别下另一个变量的比例，有时用颜色表示 残差 / 关联强弱
# 面积 = 横向 × 纵向= 该组合所占比例（频数），面积越大代表该组合出现越多