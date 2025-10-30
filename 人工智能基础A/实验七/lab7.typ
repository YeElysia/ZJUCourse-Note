#import "@local/Typwork-some:0.1.1": styles
#import "@preview/i-figured:0.2.4"
#import "@preview/codelst:2.0.2": sourcecode
#show: styles.base-style.with(lang: "zh-cn")

#let course = "人工智能基础A"
#let name = "试鸢"
#let lang = "zh-cn"
#let title = "实验报告七"
#let level = "post"
#let date = (2025, 6, 3)
#set document(title: course, author: name)
#set page(numbering: none)

// 封面
#align(center)[
  // hust logo
  #v(20pt)

  #image("figures/char.png", width: 55%)

  #v(40pt)

  #text(
    size: 36pt,
    weight: "bold",
  )[人工智能基础实验报告]

  #v(40pt)

  #let info_value(body) = {
    rect(
      width: 100%,
      inset: 2pt,
      stroke: (
        bottom: 1pt + black,
      ),
      text(
        size: 16pt,
        bottom-edge: "descender",
      )[
        #body
      ],
    )
  }

  #let info_key(body) = {
    rect(
      width: 100%,
      inset: 2pt,
      stroke: none,
      text(
        size: 16pt,
        body,
      ),
    )
  }

  #grid(
    columns: (70pt, 180pt),
    rows: (40pt, 40pt),
    gutter: 3pt,
    info_key("作业名称"), info_value("实验报告七"),
    info_key("姓　　名"), info_value("试鸢"),
    info_key("学　　号"), info_value("*********"),
    info_key("电子邮箱"), info_value("**********@email.com"),
    info_key("联系电话"), info_value("**********"),
    info_key("指导老师"), info_value(""),
  )

  #v(30pt)
  #text(size: 16pt)[
    #date.at(0) 年 #date.at(1) 月 #date.at(2) 日
  ]
]
#pagebreak()
#counter(page).update(1)
// 页面布局
#let _set_paper_page_par(body) = {
  set text(12pt, font: ("Maple Mono NF", "LXGW WenKai"))
  set par(justify: true, leading: 1em, first-line-indent: 2em)
  set par(spacing: 1.24em)

  body
}
// 正文部分页脚
#let _set_paper_page_footer_main(body) = {
  set page(
    footer: context {
      set align(center)

      grid(
        columns: (5fr, 1fr, 5fr),
        line(length: 100%, stroke: 0.7pt),
        context {
          text(10pt, baseline: -3pt, counter(page).display("1"))
        },
        line(length: 100%, stroke: 0.7pt),
      )
    },
  )

  body
}
// 摘要部分页脚
#let _set_paper_page_footer_pre(body) = {
  set page(
    footer: context {
      set align(center)

      grid(
        columns: (5fr, 1fr, 5fr),
        line(length: 100%, stroke: 0.7pt),
        context {
          text(10pt, baseline: -3pt, counter(page).display("I"))
        },
        line(length: 100%, stroke: 0.7pt),
      )
    },
  )

  body
}

// 页眉
#let _set_paper_page_header(body) = {
  set page(header: {
    set text(10pt, baseline: 8pt, spacing: 3pt)
    grid(
      columns: (auto, 1fr),
      align(left, "人工智能基础A"), align(right, "实验七实验报告"),
    )

    line(length: 100%, stroke: 0.7pt)
  })

  body
}

// 目录
#let chinese_outline() = {
  align(center)[
    #text(size: 18pt, "目　　录")
  ]

  set text(size: 12pt)
  // 临时取消目录的首行缩进
  set par(leading: 1.24em, first-line-indent: 0pt)
  context {
    let loc = here()
    let elements = query(heading.where(outlined: true))
    for el in elements {
      // 计算机学院要求不出现三级以上标题
      if el.level > 2 {
        continue
      }

      // 是否有 el 位于前面，前面的目录中用拉丁数字，后面的用阿拉伯数字
      let before_toc = query(heading.where(outlined: true).before(loc)).find(one => { one.body == el.body }) != none
      let page_num = if before_toc {
        numbering("I", counter(page).at(el.location()).first())
      } else {
        counter(page).at(el.location()).first()
      }

      link(el.location())[#{
        // acknoledgement has no numbering
        let chapt_num = if el.numbering != none {
          numbering(el.numbering, ..counter(heading).at(el.location()))
        } else { none }

        if el.level == 1 {
          set text(weight: "bold")
          if chapt_num == none {} else {
            chapt_num
            "　　"
          }
          el.body
        } else {
          chapt_num
          "　"
          el.body
        }
      }]

      // 填充 ......
      box(width: 1fr, h(0.5em) + box(width: 1fr, repeat[.]) + h(0.5em))
      [#page_num]
      linebreak()
    }
  }
}

#let _fix_indent(body) = {
  // 首段不缩进，手动加上 box
  show figure: it => {
    it + empty_par()
  }
  show math.equation.where(block: true): it => {
    it + empty_par()
  }

  body
}
// 页面大小
#let _set_paper_page_size(body) = {
  set page(
    paper: "a4",
    margin: (
      top: 2.5cm,
      bottom: 2.5cm,
      left: 3cm,
      right: 3cm,
    ),
  )

  body
}


#let _set_heading(body) = {
  set heading(numbering: "1.1.1.1")
  set heading(supplement: [节])

  // 参考自 https://github.com/nju-lug/modern-nju-thesis/blob/main/utils/custom-heading.typ
  show heading: it => {
    if it != none {
      set par(first-line-indent: 0em)
      if it.has("numbering") and it.numbering != none {
        numbering(it.numbering, ..counter(heading).at(it.location()))
        [　 ]
      }
      it.body
    } else {
      ""
    }
  }
  show heading.where(level: 1): it => {
    set text(weight: "bold", size: 18pt)
    set block(spacing: 1.5em)
    it
  }
  show heading.where(level: 2): it => {
    set text(weight: "bold", size: 14pt)
    set block(spacing: 1em, above: 1.5em, below: 1.5em)
    it
  }
  show heading.where(level: 3): it => {
    set text(weight: "bold", size: 12pt)
    set block(spacing: 0.5em, above: 1.5em, below: 1.5em)
    it
  }
  show heading.where(level: 4): it => {
    set text(weight: "bold", size: 12pt)
    set block(above: 1.5em, below: 1.5em)
    it
  }

  body
}

// 设置图表
#let _set_figure(body) = {
  // 设置前缀
  show figure.where(kind: image): set figure(supplement: [图])

  show figure.where(kind: table): set figure(supplement: [表])
  show figure.where(kind: table): set figure.caption(position: top)

  // 使用正确的编号与图表标题字体及分隔符
  show figure.caption: set text()
  set figure.caption(separator: "　")

  set math.equation(supplement: [公式])

  body
}

// 设置编号 (引用时, 需要使用标签), 注意, 必须在 heading 设置完成后再调用
#let _set_numbering(body) = {
  show heading: i-figured.reset-counters
  show figure: i-figured.show-figure.with(numbering: "1-1")
  show math.equation: i-figured.show-equation.with(numbering: "(1-1)")

  body
}

// 参考文献
#let _set_references(csl_style: "pages/hust-cse-ug.csl", body) = {
  set bibliography(title: "参考文献", style: csl_style)

  show bibliography: it => {
    set heading(level: 1, numbering: none)
    set par(justify: false, leading: 1.24em, first-line-indent: 2em)

    it
  }

  body
}

// 引用文献相关函数
#let bib_cite(..names) = {
  for name in names.pos() {
    cite(name)
  }
}

// 三线表
#let tlt_header(content) = {
  set align(center)
  rect(
    width: 100%,
    stroke: (bottom: 1pt),
    [#content],
  )
}

#let tlt_cell(content) = {
  set align(center)
  rect(
    width: 100%,
    stroke: none,
    [#content],
  )
}

#let tlt_row(r) = {
  (..r.map(tlt_cell).flatten(),)
}

#let three_line_table(values) = {
  rect(
    stroke: (bottom: 1pt, top: 1pt),
    inset: 0pt,
    outset: 0pt,
    grid(
      columns: auto,
      rows: auto,
      // table title
      grid(
        columns: values.at(0).len(),
        ..values.at(0).map(tlt_header).flatten()
      ),

      grid(
        columns: values.at(0).len(),
        ..values.slice(1).map(tlt_row).flatten()
      ),
    ),
  )
}

// 设置标题, 需要在图表前设置
#show: _set_heading
// 图表公式的排版
#show: _set_figure
// 图表公式的序号
#show: _set_numbering
// 参考文献
#show: _set_references.with(csl_style: "hust-cse-ug.csl")
// 整体页面设置
#show: _set_paper_page_size

// 整体页眉
#show: _set_paper_page_header
// 目录与摘要的页脚
#show: _set_paper_page_footer_pre
// 整体段落与页面设置
#show: _set_paper_page_par



// 目录
#chinese_outline()


// 整体段落与页面设置
#show: _set_paper_page_par
#show: _set_paper_page_footer_main
#counter(page).update(1)



= 计算余弦相似度和广义Jaccard相似度

== 方法一

$"令苹果的词向量" A = [0.96, 0.77, 0.85, 0.15], \ "大米的词向量" B = [0.18, 0.22, 0.05, 0.93]。$

$
  ||A|| & = sqrt(0.96^2 + 0.77^2 + 0.85^2 + 0.15^2) \
        & = sqrt(0.9216 + 0.5929 + 0.7225 + 0.0225) \
        & = sqrt(2.2595) approx 1.5032
$

$
  ||B|| & = sqrt(0.18^2 + 0.22^2 + 0.05^2 + 0.93^2) \
        & = sqrt(0.0324 + 0.0484 + 0.0025 + 0.8649) \
        & = sqrt(0.9482) approx 0.9738
$
$
  "余弦相似度" & = frac(A dot.c B, ||A|| dot.c ||B||) \
               & = frac(0.96 times 0.18 + 0.77 times 0.22 + 0.85 times 0.05 + 0.15 times 0.93, 1.5032 times 0.9738) \
               & = frac(0.1728 + 0.1694 + 0.0425 + 0.1395, 1.4638) \
               & = frac(0.5242, 1.4638) approx 0.3581
$

$
  "广义Jaccard相似度" & = frac(A dot.c B, ||A||^2 + ||B||^2 - A dot.c B) \
                      & = frac(0.5242, 1.5032^2 + 0.9744^2 - 0.5242) \
                      & = frac(0.5242, 2.2595 + 0.9482 - 0.5242) \
                      & = frac(0.5242, 2.6835) approx 0.1953
$

#pagebreak()

== 方法二
```py
import numpy as np

A = np.array([0.96, 0.77, 0.85, 0.15])
B = np.array([0.18, 0.22, 0.05, 0.93])

cosine_similarity = np.dot(A, B) / (np.linalg.norm(A) * np.linalg.norm(B))
jaccard_similarity = np.dot(A, B) / (np.linalg.norm(A)**2 + np.linalg.norm(B)**2 - np.dot(A, B))

print(f"余弦相似度: {cosine_similarity}")
print(f"广义Jaccard相似度: {jaccard_similarity}")
```
#image("image.png")

= 词袋模型实践

== 构建两句话的词袋模型并计算相似度

=== 准备工作

```py
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity

# 输入的两个句子
sentence1 = "这颗星球上的一些沙漠曾是海洋"
sentence2 = "被黑夜笼罩的地方，也会迎来光明"
```
=== 分词
```py
# 使用jieba进行分词
def jieba_cut(sentence):
    return " ".join(jieba.cut(sentence))

sentence1_cut = jieba_cut(sentence1)
sentence2_cut = jieba_cut(sentence2)

print("句子1:", sentence1_cut)
print("句子2:", sentence2_cut)
```
#image("image-1.png")

=== 构建词袋模型
```py
# 使用CountVectorizer构建词袋模型
vectorizer = CountVectorizer()
# 将两个句子转换为词袋向量
X = vectorizer.fit_transform([sentence1_cut, sentence2_cut])

print(f"词袋向量{X}")
```
#image("image-2.png")
=== 计算余弦相似度
```py
# 计算余弦相似度
cosine_sim = cosine_similarity(X[0:1], X[1:2])

# 输出相似度
print(f"两个句子的余弦相似度为: {cosine_sim[0][0]:.4f}")
```
#image("image-3.png")


== 构件两句话以上的模型
```py
import jieba
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity







# 输入的两个句子
sentence1 = "置身十字路口正中央 混入熙来熙往的人群 唯独我漫无目的 有如漂流者一般 那些流行的首首歌曲 总是唱不出我的心思 请不要在幻象中 对着我露出微笑 今天又语不成声 将感情吞如心底 书页写满了草稿 啊啊 就这么度过了数千个夜晚 为了我自己 只是如此 就仅仅是如此而已 为从心头满溢而出的话语找寻出口 若能传达至你的心中 稍稍填补虚无的空隙 即使这样的我 也将大喊我在这里 唱着迷途之星的歌 不知为何每每问起 谈论的总都是未来 但讲到眼前的我 却总是敷衍了事 无视于 我无法融入亮丽世界的心绪 请不要推荐我走向散发光辉的明天 夜空中闪烁光芒 无依无靠的星尘 在踌躇之中失散 啊啊 那颗彷徨的星儿就是我啊 成为我自己 只有如此 我能做的只有如此 模仿他人这种事 我也没办法做得好 为何要将这种痛苦的日子 用一句无趣带过 就算步伐多踉跄 我也是在挣扎着啊 唱着迷途之星的歌 为了我自己 只是如此 就仅仅是如此而已 在流下泪水之后 才终于诞生的话语 彼此似乎有些许相似 怀抱着隐隐作痛的胸口 面对在颤抖的你 大喊着我与你同在 唱着迷途之星的歌"
sentence2 = "内心满是憔悴，眼神游动不止。我在这世界孤身一人，这不断凋零的春季中，每年都只感受到冰冷。在一片黑暗中，单向往前走着，我只能不断胡乱写着。明知期待也是一场空，却依然不断寻求救赎（令人揪心却又叫人心爱）。此刻感觉好像能了解（幸福却又让人心乱神迷）。照耀着无法哭泣的我，光芒温柔地携我同行，穿过层层云朵，变得闪闪发光。内心的思绪满溢而出，脸颊回过神来，也正闪闪闪光。热泪沾湿了我的脸庞，为什么你的手是如此地温暖？拜托你，请你从此再也不要放手。人与人的缘分，总是断断续续。人们在喜悦及悲伤中，细数一个又一个的爱。为了确认内心的跳动（令人喜悦却又叫人寂寞）。此刻感觉好像能了解（重要却又让人感到害怕）。照耀着无法哭泣的我，是光芒温柔地将我拥入怀中。在这阳光普照的世界，骄傲绽放的重要之人，知晓何谓温暖的春天。因为你我，而留下泪水。啊啊，多么地耀眼，啊啊，多么地美丽。穿过层层云朵，变得闪闪发光。内心的思绪满溢而出，脸颊回过神来，也正闪闪闪光。热泪沾湿了我的脸庞，为什么你的手是如此地温暖？呐，拜托你，请你从此再也不要放手。永远，永远，再也不要放手。"

# 使用jieba进行分词
def jieba_cut(sentence):
    return " ".join(jieba.cut(sentence))

sentence1_cut = jieba_cut(sentence1)
sentence2_cut = jieba_cut(sentence2)

# 使用CountVectorizer构建词袋模型
vectorizer = CountVectorizer()
# 将两个句子转换为词袋向量
X = vectorizer.fit_transform([sentence1_cut, sentence2_cut])
# 计算余弦相似度
cosine_sim = cosine_similarity(X[0:1], X[1:2])

# 输出相似度
print(f"两个句子的余弦相似度为: {cosine_sim[0][0]:.4f}")
```
#image("image-4.png")

#pagebreak()

= 使用word2Vec计算文本相似度
== 代码以及可视化截图
=== 准备工作
```py
import jieba
from gensim.models import Word2Vec
from sklearn.metrics.pairwise import cosine_similarity
```

=== 分词
```py
sentences = [
    "内心满是憔悴 眼神游动不止",
    "我在这世界孤身一人",
    "这不断凋零的春季中",
    "每年都只感受到冰冷",
    "在一片黑暗中 单向往前走着",
    "我只能不断胡乱写着",
    "明知期待也是一场空",
    "却依然不断寻求救赎",
    "（令人揪心却又叫人心爱）",
    "此刻感觉好像能了解",
    "（幸福却又让人心乱神迷）",
    "照耀着无法哭泣的我",
    "光芒温柔地携我同行",
    "穿过层层云朵 变得闪闪发光",
    "内心的思绪满溢而出",
    "脸颊回过神来 也正闪闪闪光",
    "热泪沾湿了我的脸庞",
    "为什么你的手是如此地温暖",
    "拜托你",
    "请你从此再也不要放手",
    "人与人的缘分 总是断断续续",
    "人们在喜悦及悲伤中",
    "细数一个又一个的爱",
    "为了确认内心的跳动",
    "（令人喜悦却又叫人寂寞）",
    "此刻感觉好像能了解",
    "（重要却又让人感到害怕）",
    "照耀着无法哭泣的我",
    "是光芒温柔地将我拥入怀中",
    "在这阳光普照的世界 骄傲绽放的重要之人",
    "知晓何谓温暖的春天",
    "因为你我 而留下泪水",
    "啊啊 多么地耀眼",
    "啊啊 多么地美丽",
    "穿过层层云朵 变得闪闪发光",
    "内心的思绪满溢而出",
    "脸颊回过神来 也正闪闪发光",
    "热泪沾湿了我的脸庞",
    "为什么你的手是如此地温暖",
    "呐，拜托你",
    "请你从此再也不要放手",
    "永远 永远 再也不要放手",
]

# 使用jieba对句子进行分词
def cut_sentences(sentences):
    return [list(jieba.cut(sentence)) for sentence in sentences]

tokenized_sentences = cut_sentences(sentences)

# 打印分词后的结果
for sentence in tokenized_sentences:
    print(" ".join(sentence))
```
#image("image-5.png", width: 50%)


=== 模型训练
```py
# 训练Word2Vec模型
model = Word2Vec(tokenized_sentences, vector_size=100, window=5, min_count=1, sg=0)
```

=== 计算句子向量
```py
# 计算句子向量
def sentence_vector(tokens):
    vectors = [model.wv[word] for word in tokens if word in model.wv]
    return np.mean(vectors, axis=0) if vectors else np.zeros(100)

# 获取每个句子的词向量
sentence_vectors = [sentence_vector(sentence) for sentence in tokenized_sentences]
```

=== 计算相似度
```py
# 计算余弦相似度
cosine_sim = cosine_similarity(sentence_vectors)
```

=== 可视化结果
```py
plt.figure(figsize=(10, 8))
sns.heatmap(cosine_sim, annot=True, cmap="coolwarm", xticklabels=[f"句子{i+1}" for i in range(len(sentences))], yticklabels=[f"句子{i+1}" for i in range(len(sentences))], fmt=".2f")
plt.title("句子余弦相似度热图")
plt.show()
```
#image("Figure_1.png")

#pagebreak()
= 实验感受
学会了利用人工智能的工具来进行文本相似度的计算，了解了余弦相似度和广义Jaccard相似度的计算方法，并通过实践掌握了词袋模型和Word2Vec模型的使用。通过这些实践，我对自然语言处理有了更深入的理解，也感受到了人工智能在文本处理方面的强大能力。
