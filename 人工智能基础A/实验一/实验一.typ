#import "@local/typreset:0.1.0": homework

#let simple = homework.simple_question

#show: homework.style.with(
  course: "实验一",
  names: "叶畅飞",
  lang: "zh-cn",
  hw-literal: "人工智能基础(A)",
)

#show raw.where(block: true): block.with(
  width: 100%,
  stroke: 1pt,
  radius: 5pt,
  breakable: true,
  inset: 5pt,
)


= 3-1、实验感受
通过本次实验，我在以下几个方面有了显著的收获：

+ * 对大语言模型的认识 *

  通过调研和使用国产大语言模型（如文心一言、通义千问、豆包、DeepSeek 等），我对大语言模型的基本功能和应用场景有了初步了解。这些工具在自然语言处理、问答系统、文本生成等方面表现出色，尤其是在中文语境下的表现令人印象深刻。

+ * 本地化部署 AI 模型 *

  通过 Ollama 工具成功在本地部署了 DeepSeek-1.5b 模型，这让我对开源大模型的运行机制有了更深入的理解。本地化部署不仅可以提高模型的响应速度，还能在无网络环境下使用，为后续的 AI 学习和开发提供了便利。

+ * Windows 系统操作技能提升 *

  在实验中，我掌握了 Windows 系统的基本操作，包括查看系统信息、管理任务进程、安装软件等。特别是在 VMware 中创建虚拟机和安装 Windows 操作系统的过程中，我对虚拟化技术有了初步的认识，这为后续学习 AI 开发环境搭建打下了基础。

+ * 问题解决能力的提升 *

  在实验过程中，我遇到了一些问题（如模型部署速度慢、虚拟机资源分配等），通过查阅资料和实践，我逐步找到了解决方案，这让我对技术问题的解决能力有了显著提升。


本次实验让我对 AI 技术和 Windows 系统操作有了更深入的理解，特别是在大语言模型的使用和虚拟化技术的应用方面收获颇丰。通过解决实验中的疑问，我不仅提升了自己的技术能力，还增强了对 AI 和计算机系统的兴趣。

未来，我将继续深入学习 AI 技术，探索更多实际应用场景，同时也会进一步研究如何优化模型性能和虚拟化环境，为后续的学习和开发打下更坚实的基础。

= 3-2 实验记录


== (一) 任务1 : 人工智能大语言模型工具使用初步

==== 1. 常用大模型工具使用操作：
#box(
  width: 45%,
  figure(
    image("image.png"),
    caption: [
      DeepSeek
    ],
  ),
)
#box(
  width: 45%,
  figure(
    image("image-1.png"),
    caption: [
      ChatGPT
    ],
  ),
)
==== 2. DeepSeek的本地化安装部署:

#figure(
  image("image-2.png"),
  caption: [
    DeepSeek-coder-v2:16b
  ],
)
)


=
== (二) 任务2: Windows基本操作

==== 1. 学习windows基本操作

#box(
  width: 60%,
  figure(
  image("image-3.png"),
  caption: [
    我的桌面截图
  ],
))
#box(
  width: 30%,
  figure(
  image("image-4.png",),
  caption: [
    右键菜单截图
  ],
))

====== (3) “开始菜单”键是Win，Win+D的功能是？Win+E的功能是？Win+R的功能是？Win+Tab的功能是？
#box(
  width: 45%,
  figure(
    image("image-3.png"),
    caption: [
      Win+D
    ],
  ),
)
#box(
  width: 45%,
  figure(
    image("image-21.png"),
    caption: [
      Win+E
    ],
  ),
)
#box(
  width: 45%,
  figure(
    image("image-19.png"),
    caption: [
      Win+R
    ],
  ),
)
#box(
  width: 45%,
  figure(
    image("image-20.png"),
    caption: [
      Win+Tab
    ],
  ),
)
====== (4) 常用的与Cirl组合的键是？
Ctrl+C: 复制,\
Ctrl+V: 粘贴,\
Ctrl+X: 剪切,\
Ctrl+Z: 撤销,\
Ctrl+Y: 重做,\
Ctrl+A: 全选,\
Ctrl+S: 保存,\
Ctrl+O: 打开,\
Ctrl+N: 新建,\
Ctrl+W: 关闭当前窗口,\
Ctrl+L: 锁定屏幕,\
Ctrl+Shift+Esc: 打开任务管理器.

==== 2. 通过Windows查看机器信息
====== (1) 查看cpu主频，内存，硬盘储存，设备等
我的机器CPU主频为 2.20 GHz，内存为 32 GB，硬盘储存为 1024 + 2048 GB
#box(
  width: 50%,
  height: 20%,
  figure(image("image-5.png"),caption: [
    CPU
  ]),
),
#box(
  height: 35%,
  width: 40%,
  figure(image("image-6.png",),caption: [
    内存
  ]),
),

====== (2) 查看任务管理器
查看进程信息，截取一个图

#figure(
  image("image-7.png",width: 90%),
  caption: [
    任务管理器
  ],
)

=

记录当前占用CPU资源排名前三的应用程序进程名称是：
- Notion
- Todesk远程控制客户端
- UDC Service
====== (3) 查看windows上安装的软件程序信息
打开控制面板的"程序和功能"，根据安装时间排个序，看看最近安装的程序的名称是什么？
程序名称： * fiz * \
如果你认为没有用的程序，尝试操作卸载程序
截取一个图

* 无没有用的程序 *

====== (4) 查看系统用户信息
#figure(
  image("image-8.png"),
  caption: [
    系统用户信息
  ],
)
==== 2. 学习windows软件安装
学习vmware软件下载，并完成vmware安装，截取安装过程中的截图不少于3个、

====== (1) 从官网下载vmware软件截图
#figure(
  image("image-9.png"),
  caption: [
    VMware下载官网
  ],
)
====== (2) 安装过程截图
#box(
  width: 45%,
  figure(
    image("image-10.png"),
    caption: [
      安装过程
    ],
  ),
)
#box(
  width: 45%,
  figure(
    image("image-11.png"),
    caption: [
      安装过程
    ],
  ),
)
====== (3) 安装完成后启动vmware后的截图
#figure(
  image("image-12.png"),
  caption: [
    VMware启动
  ],
)
==== 3. 学习mware软件中创建虚拟机及在虚拟机中安装windows的过程，截取不少于5个图

====== (1) 启动vmware创建一个虚拟机

#figure(
  image("image-13.png"),
  caption: [
    创建虚拟机
  ],
)
====== (2) 虚拟机中安装windows
#box(
  width: 45%,
  figure(
    image("image-14.png"),
    caption: [
      选择安装位置
    ],
  ),
)
#box(
  width: 45%,
  figure(
    image("image-15.png"),
    caption: [
      安装Windows
    ],
  ),
)

#box(
  width:45%,
  figure(
  image("image-16.png"),
  caption: [
    Setup
  ],
)
)
#box(
  width: 45%,
  figure(
    image("image-17.png"),
    caption: [
      Install
    ],
  ),
)

#box(
  figure(
    image("image-18.png"),
    caption: [
      安装完成
    ],
  ),
)