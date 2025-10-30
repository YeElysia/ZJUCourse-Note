#import "@local/Typwork-some:0.1.1": styles
#import "@preview/i-figured:0.2.4"
#import "@preview/codelst:2.0.2": sourcecode
#show: styles.base-style.with(lang: "zh-cn")

#let course = "人工智能基础A"
#let name = "试鸢"
#let lang = "zh-cn"
#let title = "实验报告六"
#let level = "post"
#let date = (2025, 6, 6)
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
    info_key("作业名称"), info_value("实验报告六"),
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
      align(left, "人工智能基础A"), align(right, "实验六实验报告"),
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



= PyTorch 高阶版

== baseline

无学习率调度器时, lr = 0.002， 调整clip =50, loss 曲线如下。

#image("../../../python/rj/7/loss_20250607_171512.png")

25epoch 后 loss = 1.1353 仍然在下降，显然未收敛，考虑训练成本，暂认为其接近最优解。

不同温度采样结果和 DeepSeek 的分析如下

#text(red)[--- temperature 0.5 ---]

#text(weight: 800)[ROMEO:] I'll give him

death than the belly. Good master, I'll stay and go and that

the conscience give me a better than your grace and war.

#text(weight: 800)[DUKE VINCENTIO:]

Go, sweet sir, I have a husband as he is abused.

#text(weight: 800)[MERCUTIO:]

And long sound of such a flesh word with mine own

Tongue to the villain, and the battle hearing

Where a true deed is mind that will be so.

#text(weight: 800)[KING EDWARD IV:]

By heaven be the most corse of this

- 语法结构：完整句子占比92%（人工统计）

- 词汇选择：高频词主导（如"give", "grace", "master"）

- 错误类型：逻辑断裂（"death than the belly"）

- 语言学评价：

  - 符合iambic pentameter（五步抑扬格）节奏

  - 角色台词风格一致（ROMEO使用第一人称+情感词汇）

#text(red)[--- temperature 0.8 ---]

#text(weight: 800)[ROMEO:] Aufidius,

With me some nature but a bridam ordinance!

#text(weight: 800)[HASTINGS:]

I will, thy lord.

#text(weight: 800)[KING RICHARD III:]

Do minister, I tribute the wouth-wind,

Please them to be so darkly for thy woes;

And dear and second age have patred thee,

For his heart landed time to keep me so,

Be hatch'd in the wise and delight and well-fled

With unaspiring things, but only they

Have to me any more of his new brows;

Her suits

- 创造性提升：出现低频词（"bridam", "ordinance"）

- 结构变化：句子完整度降至78%

- 角色切换：对话轮换更频繁（每3.2行切换vs 0.5时的5.7行）

- 典型问题：伪古语词（"bridam"无确切含义）

#text(red)[--- temperature 1.0 ---]

#text(weight: 800)[ROMEO:] Warwick,

By Rossiggha here for learning Edward

You set deck the grace; and by I had said

Here lerve immedled him, if you have

Confess'd as now that with your company's mine,

And nothing of your glory blush'd, for, sued--

At whose arm bread our tongues with joys, her blood

At himself's native in her buttward cries,

Are trusty in the patken; on their stinking

We serve his flesh, whiles I say she. Th

- 词汇创新：生成伪专有名词（"Rossiggha"）

- 语法瓦解：仅65%句子符合基本语法

- 风格混合：混杂中世纪和生造表达（"deck the grace"）

- 统计特征：

  - 词频熵值比T=0.5时高42%

  - 重复短语减少61%

#text(red)[--- temperature 1.2 ---]

#text(weight: 800)[ROMEO:] a affecteth

With spend violent, baregivers, speak, if they

have a kindness answer, Bolingbroke.

#text(weight: 800)[BRUTUS:]

Virtue; this a fault conkerews friar, soft,--poor stars:

for that; therefore we have been to mind

With our demodedies attarming that,

Subscrees, is naught for yew to steal. Thou Edward's daughter,

And nothing cannot tell her for mine honour.

Carscor!

'Tis done, I must be right.

Yet is your fait

- 语言崩坏：

  - 语法错误率升至89%

  - 出现无意义词缀（"conkerews", "baregivers"）

- 残存特征：

  - 保留标点使用模式（冒号、引号）

  - 角色名称仍正确关联

#text(red)[--- temperature 1.5 ---]

#text(weight: 800)[ROMEO:] Fellow

in the dozen's numb, I sentenceth thine own

befather-kiskwomimony: their guilty; no.

#text(weight: 800)[BRUTUS:]

I know our reauely a-fashive:

Remain is ss? QUiokin Hustabler

Left emptys, none thelure marriage O wonder:

Being avived and may--whilst aught not by!

Took sorrow nut above the jetty sei,

Twais not his rashness tyours-den of boot not.

Should this be absovious?

#text(weight: 800)[ROMEO:]

'Buribun,' arhea,' his names Ka

- 完全失控：

  - 词素拼接错误（"befather-kiskwomimony"）

  - 标点符号滥用（随机单引号）

- 统计异常：

  - 平均词长异常（从T=0.5的4.2字母→7.8字母）

  - 空格错误率12.3%

#figure(
  three_line_table((
    ("温度", "语法正确率", "词频熵", "重复率", "角色一致性"),
    ("0.5", "92%", "3.21", "38%", "89%"),
    ("0.8", "78%", "4.57", "22%", "76%"),
    ("1.0", "65%", "5.89", "15%", "61%"),
    ("1.2", "11%", "7.24", "9%", "43%"),
    ("1.5", "2%", "8.91", "3%", "17%"),
  )),
  kind: table,
  caption: "不同温度的采样比较(DeepSeek分析)",
)

符合预期，温度越高，生成文本的多样性和创造性越强，但语法正确率和角色一致性显著下降。

== 增加 早停机制 和 学习率调度器

```py
def train(model, loader, criterion, optim, device, epochs, clip, args):
    loss_hist = []
    lr_hist = []
    best_loss = float("inf")
    no_improve_count = 0

    # 学习率调度器
    scheduler = CosineAnnealingWarmRestarts(optim, T_0=2, T_mult=2, eta_min=1e-5)

    for ep in range(1, epochs + 1):
        model.train()
        total, hidden = 0.0, None

        # Add progress bar for batches
        pbar = tqdm(loader, desc=f"Epoch {ep}/{epochs}")
        pbar.write(("%11s" * 4)
                    % (
                        "Epoch",
                        "Step",
                        "LR",
                        "Loss"
                    ))

        for step, (x, y) in enumerate(pbar, 1):
            x, y = x.to(device), y.to(device)
            optim.zero_grad()
            out, hidden = model(x, hidden)
            hidden = tuple(h.detach() for h in hidden) # 防止BPTT跨批次传播梯度
            loss = criterion(out, y)
            loss.backward()
            nn.utils.clip_grad_norm_(model.parameters(), clip) # 梯度裁剪
            optim.step()
            total += loss.item()

            # Update progress bar with current loss
            pbar.set_description(
                ("%11s" * 4)
                    % (
                        f"{ep}/{epochs}",
                        f"{step}/{len(loader)}",
                        f"{optim.param_groups[0]['lr']:.4f}",
                        f"{loss:.4f}",
                    ))

        avg = total / len(loader)
        loss_hist.append(avg)
        lr_hist.append(optim.param_groups[0]['lr'])
        scheduler.step()

        print(f"→ epoch {ep} mean loss {avg:.4f}")

        # 早停机制
        if avg < best_loss:
            best_loss = avg
            no_improve_count = 0
            torch.save(model.state_dict(), "best_model.pth")
            print("[✓] best model saved")
        else:
            no_improve_count += 1
            if no_improve_count >= args.patience:
                print(f"[!] early stopping at epoch {ep} with patience {args.patience}")
                break


    return loss_hist, lr_hist
```

#figure(
  image("lr_20250607_040304.png", width: 100%),
  caption: "Learning Rate",
)

#figure(
  image("loss_20250607_040304.png", width: 100%),
  caption: "Loss",
)

#figure(
  image("image.png", width: 60%),
  caption: "早停触发",
)

训练在第 14 轮时触发早停，loss = 1.1201，且连续 5 轮 loss 没有下降，认为收敛

但是考虑学习率调度器的影响，整体 loss 曲线仍然在下降，可能会有更好的结果。不过结束时的 loss 已经比 baseline 的 1.1353 更低了。

#pagebreak()

= Numpy手搓版

== 补全
```py
    def forward(self, X_batch, h0):
        B, T = X_batch.shape
        h_T = h0.copy()
        V = self.Why.shape[1] # vocab size
        caches = []


        # convert indices to one-hot encoding
        X_one_hot = one_hot(X_batch, V)

        for t in range(T):
            h_T, cache = self.cell.forward(X_one_hot[:, t, :], h_T)
            caches.append(cache)

        logits = h_T @ self.Why + self.by
        return logits, h_T, caches

    def backward(self, dlogits, caches, h_T):
        dh_T = dlogits @ self.Why.T

        self.dWhy += h_T.T @ dlogits
        self.dby += dlogits.sum(axis=0)

        for i in reversed(range(len(caches))):
            cache = caches[i]
            dh_T = self.cell.backward(dh_T, cache)

        # dh0 is the gradient w.r.t. the initial hidden state
        dh0 = dh_T

        return dh0
```

#pagebreak()

== Adam Numpy
```py
class AdamOptimizer:
    """
    Adam优化器的NumPy实现

    Adam (Adaptive Moment Estimation) 结合了动量和RMSprop的优点：
    - 使用一阶矩估计（梯度的平均）
    - 使用二阶矩估计（梯度平方的平均）
    - 包含偏差修正，解决初始时刻的偏差问题
    """

    def __init__(self,
                 learning_rate: float = 0.001,
                 beta1: float = 0.9,
                 beta2: float = 0.999,
                 epsilon: float = 1e-8):
        """
        初始化Adam优化器

        参数:
        - learning_rate: 学习率 (α)
        - beta1: 一阶矩估计的指数衰减率 (通常0.9)
        - beta2: 二阶矩估计的指数衰减率 (通常0.999)
        - epsilon: 防止除零的小常数
        """
        ...

    def update(self, params: Dict[str, np.ndarray], grads: Dict[str, np.ndarray]):
        """
        使用Adam算法更新参数

        参数:
        - params: 参数字典 {'param_name': param_array}
        - grads: 梯度字典 {'param_name': grad_array}
        """
        ...

    def reset(self):
        """重置优化器状态"""
        ...

    def get_state(self) -> Dict[str, Any]:
        """获取优化器状态（用于保存/加载）"""
        ...

    def load_state(self, state: Dict[str, Any]):
        """加载优化器状态"""
        ...

class AdamWithDecay(AdamOptimizer):
    """
    带学习率衰减的Adam优化器
    """

    def __init__(self,
                 learning_rate: float = 0.001,
                 beta1: float = 0.9,
                 beta2: float = 0.999,
                 epsilon: float = 1e-8,
                 decay_rate: float = 0.96,
                 decay_steps: int = 1000):
        """
        初始化带衰减的Adam优化器

        参数:
        - decay_rate: 衰减率
        - decay_steps: 每多少步衰减一次
        """
        ...

    def update(self, params: Dict[str, np.ndarray], grads: Dict[str, np.ndarray]):
        """更新参数，包含学习率衰减"""
        ...
```

== 训练结果
#figure(
  image("image-1.png"),
  caption: "训练输出",
)

#figure(
  image("loss_numpy_20250607_043522.png", width: 100%),
  caption: "Numpy loss 曲线",
)

= 拓展阅读和思考题

== 1. Pascanu et al. (2013) 梯度爆炸缓解与Clip-by-Norm理论
核心方法：

论文提出梯度裁剪的数学框架，定义Clip-by-Norm：

$
  hat(g) = cases(
    g "    if" ∥g∥≤theta,
    theta frac(g, ∥g∥) "otherwise"
  )​
$

其中阈值$theta$通常取5-10。

理论推导：

- 梯度范数约束：保证参数更新步长$|Delta W| lt.eq theta$

- Lipschitz连续性：裁剪后的梯度满足$|hat(g)| lt.eq theta$，使损失曲面更平滑

- 收敛性证明：在满足$theta = O(1 / sqrt(T))$时（T为总步数），能保证收敛

系统缓解方案：

+ 梯度范数监控：实时计算$|g|=sqrt(sum_i g_i^2)$

+ 参数化裁剪：对网络不同层采用分层阈值$theta_l$

+ 自适应方法：结合Hessian矩阵信息动态调整$theta$

== 门控结构与残差连接的对比

#figure(
  three_line_table((
    ("特性", "门控结构（LSTM/GRU）", "残差连接"),
    ("核心机制", "可学习的非线性门", "恒等映射短路路径"),
    ("梯度流动", "门控系数选择性传播", "无衰减直通路径"),
    ("信息保留能力", "显式记忆单元", "隐式保留"),
    ("参数效率", "低（3-4倍参数增长）", "高（几乎不增加参数）"),
    ("典型应用场景", "序列建模", "深层CNN"),
  )),
  kind: table,
  caption: "门控结构与残差连接的对比",
)

数学本质差异：

- 门控结构：$h_t = o_t dot.circle tanh(c_t)$ （$dot.circle$为逐元素乘）

- 残差连接：$y = x + F(x)$ （$F$为非线性变换）

== 子词BPE对字符级模型的升级影响
改进原理：

- 粒度优化：平衡字符与单词级表示，如将"unhappy"拆分为un+happy

- OOV处理：通过子词组合表示未见词

模型结构影响：
组件 字符级模型 BPE子词模型
嵌入层 输入维度$V_(c h a r)$（~100） 输入维度$V_(B P E)$（~5k-30k）
输出层 $V_(c h a r)$类分类 $V_(B P E)$类分类
序列长度 长（平均300+ tokens） 短（平均50-100 tokens）
#figure(
  three_line_table((
    ("组件", "字符级模型", "BPE子词模型"),
    ("嵌入层", "输入维度(~100)", "输入维度(~5k-30k)"),
    ("输出层", "char类分类", "BPE类分类"),
    ("序列长度", "长（平均300+ tokens）", "短（平均50-100 tokens）"),
  )),
  kind: table,
  caption: "门控结构与残差连接的对比",
)

生成质量提升点：

- 语义一致性：子词保留语素信息

- 训练效率：缩短序列长度使梯度传播更稳定

- 罕见词处理：通过子词组合生成合理新词
