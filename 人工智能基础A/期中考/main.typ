#import "@local/Typwork-some:0.1.1": styles, homework


#show: styles.work.with(
  course: "人工智能基础(A)",
  alter: "试鸢",
  lang: "zh-cn",
  title: "zxp-期中考试",
  level: "post",
)

#let q = homework.question
#let ans = homework.answer

#q(number: "1. ", ifline: false)[
  用Ollama部署了deepseek模型后，如果要使用该模型进行对话，应该用下面的哪个命令？ #h(1fr) #text(gray)[单选题(4分)]
]
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  text[A. show], text[B. pull], text[C. list], text(red)[D. run],
)


#q(number: "2. ", ifline: false)[
  监督学习回归问题的损失函数是？ #h(1fr) #text(gray)[单选题(4分)]
]
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  text(red)[A. 均分误差], text[B. 交叉熵], text[C. 准确率], text[D. KL散度],
)


#q(number: "3. ", ifline: false)[
  以下哪些算法是机器学习算法？ #h(1fr) #text(gray)[多选题(4分)]
]
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  text(red)[A. 深度学习], text(red)[B. K-mean], text[C. 最小二乘法#text(red)[?]], text[D. 最大-最小搜索],
)


#q(number: "4. ", ifline: false)[
  为了训练出一个实用的人工智能模型，应将数据集划分为如下几种？ #h(1fr) #text(gray)[多选题(4分)]
]
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  text(red)[A. 测试集], text(red)[B. 验证集], text(red)[C. 训练集], text[D. 对照集],
)


#q(number: "5. ", ifline: false)[
  属于幸存者偏差的现象是？ #h(1fr) #text(gray)[多选题(4分)]
]
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  text[A. 模型过拟合], text(red)[B. 仅调查存活企业], text[C. 模型欠拟合], text(red)[D. 仅分析返航飞机损失],
)


#q(number: "6. ", ifline: false)[
  人工智能三大学派包括？ #h(1fr) #text(gray)[多选题(4分)]
]
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  text(red)[A. 联结主义], text(red)[B. 行为主义], text(red)[C. 符号主义], text[D. 逻辑主义],
)
#q(number: "7. ", ifline: false)[
  无监督学习任务包括？ #h(1fr) #text(gray)[多选题(4分)]
]
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  text(red)[A. 聚类], text(red)[B.降维], text[C.回归], text[D.分类],
)
#q(number: "8. ", ifline: false)[
  下面属于联结主义人工智能学派的主要方法是？ #h(1fr) #text(gray)[多选题(4分)]
]
#grid(
  columns: (100pt, 100pt, 100pt, 1fr),
  text(red)[A. 神经网络], text(red)[B. 深度学习], text[C. 逻辑推理], text(red)[D. 基于神经网络的机器学习],
)
#q(number: "9. ", ifline: false)[
  下面属于线性回归评价指标的是？ #h(1fr) #text(gray)[多选题(4分)]
]
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  text(red)[A. 均方根误差], text[B. 精确率], text(red)[C. 校正决定系数], text(red)[D. 均分误差],
)


#q(number: "10. ", ifline: false)[
  下面适合使用决策树模型的是？ #h(1fr) #text(gray)[多选题(4分)]
]

A. 预测股票价格的波动幅度\
#text(red)[B. 判断客户是否流失]\
C. 预测某地区未来7天的平均气温\
#text(red)[D. 判断一封电子邮件是否为垃圾邮件]

#q(number: "11. ", ifline: false)[
  人工智能经历了二起三落后，当前的大语言模型具备了与人类交互的能力，因此这种基于transformer结构的深度学习模型是最好的人工智能技术。
]
#text(red)[否] #h(1fr) #text(gray)[判断题(3分)]

#q(number: "12. ", ifline: false)[
  对数据集不作任何标记，让计算机通过训练自动进行分类的算法就是无监督学习。
]
#text(red)[是] #h(1fr) #text(gray)[判断题(3分)]

#q(number: "13. ", ifline: false)[
  符号主义是人工智能三大学派之一，主要依赖于逻辑推理和规则。
]
#text(red)[是] #h(1fr) #text(gray)[判断题(3分)]

#q(number: "14. ", ifline: false)[
  过拟合是模型在训练集上表现很好，但在测试集上表现较差的现象。
]
#text(red)[是] #h(1fr) #text(gray)[判断题(3分)]

#q(number: "15. ", ifline: false)[
  损失函数是用来衡量模型预测值和真实值之间差距的指标。
]
#text(red)[是] #h(1fr) #text(gray)[判断题(3分)]

#q(number: "16. ", ifline: false)[
  幸存者偏差是指在数据分析中，只考虑幸存样本而忽略其他样本导致的偏差。
]
#text(red)[是] #h(1fr) #text(gray)[判断题(3分)]

#q(number: "17. ", ifline: false)[
  K-means算法需要预先指定聚类数量。
]
#text(red)[是] #h(1fr) #text(gray)[判断题(3分)]

#q(number: "18. ", ifline: false)[
  数据标准化（归一化）对无监督学习无影响。
]
#text(red)[否] #h(1fr) #text(gray)[判断题(3分)]

#q(number: "19. ", ifline: false)[
  问题求解的核心在于算法的设计与实现。
]
#text(red)[是] #h(1fr) #text(gray)[判断题(3分)]

#q(number: "20. ", ifline: false)[
  降维技术（如PCA）会损失部分数据信息
]
#text(red)[是] #h(1fr) #text(gray)[判断题(3分)]

#q(number: "21. ", ifline: false)[
  根据图灵测试的原理，简述以下几个问题 #h(1fr) #text(gray)[综合题(10分)]
]
#h(10pt) (1) 什么是图灵测试 #h(1fr) #text(gray)[简答题(2分)] \
#h(10pt) (2) 没有通过图灵测试的系统不具备智能吗？为什么？ #h(1fr) #text(gray)[简答题(4分)] \
#h(10pt) (3) 通过图灵测试的系统具备智能了吗？为什么？ #h(1fr) #text(gray)[简答题(4分)] \

#q(number: "22. ", ifline: false)[
  阅读下面通过python使用k邻近算法（KNN,通过测量不同特征值之间的距离来进行分类）对鸢尾花数据集进行分类代码，并回答问题。 #h(1fr) #text(gray)[综合题(10分)]
]

```py
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.neighbors import KNeighborsClassifier
from sklearn.metrics import accuracy_score
#step1
iris = load_iris()
X, y = iris.data, iris.target
#step2
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
#step3
scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)
#step4
Knn = KNeighborsClassifier(n_neighbors=3)
Knn.fit(X_train, y_train)
#step5
y_pred = knn.predict(X_test)
accuracy = accuracy_score(y_test, y_pred)
print("Accuracy:",accuracy)
```
#h(10pt) (1) 根据上面五个步骤简要描述其工作原理。 #h(1fr) #text(gray)[简答题(5分)] \
#h(10pt) (2) 代码中使用了哪些数据预处理步骤？这些步骤对模型性能有什么影响？ #h(1fr) #text(gray)[简答题(5分)] \


#q(number: "23. ", ifline: false)[
  已知A桶的容量为7升，B桶的容量为4升，如何通过倒水操作，使得其中一个桶里的水为5升？请详细描述倒水步骤，答题参考实例：装满A->A倒入B(A:X-Y,B:Y) #h(1fr) #text(gray)[简答题(5分)]
]

#q(number: "24. ", ifline: false)[
  假设一个二分类模型的混淆矩阵如下： #h(1fr) #text(gray)[综合题(5分)]
]

#align(center)[
  #table(
    columns: (auto, auto, auto),
    inset: 10pt,
    align: center + horizon,
    [], [*预测为正类*], [*预测为负类*],
    [*实际正类*], [80], [20],
    [*实际负类*], [10], [90],
  ),
]

#h(10pt) (1) 计算模型的准确率（Accuracy）是 #underline[#text(red)[85%]] #h(1fr) #text(gray)[填空题(1分)]\
#h(10pt) (1) 计算模型的召回率（Recall）是 #underline[#text(red)[80%]] #h(1fr) #text(gray)[填空题(2分)]\
#h(10pt) (1) 计算模型的F1分数（保留四位有效数字）是 #underline[#text(red)[84.21%]] #h(1fr) #text(gray)[填空题(2分)]
