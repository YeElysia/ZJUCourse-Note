#import "@local/Typwork-some:0.1.1": styles, homework


#show: styles.work.with(
  course: "大学物理(甲) I",
  alter: "试鸢",
  lang: "zh-cn",
  title: "yhx-随堂测试(2)",
  level: "post",
)

#let q = homework.question
#let ans = homework.answer
#q(number: "一： ")[质量为6000kg的火箭垂直发射，喷气相对火箭的速度为2000m/s，每秒喷气120kg，求：]

（1）起飞时火箭的加速度;\
（2）若所带燃料为4800kg，火箭的最后速度;\
（3）火箭能达到的最大高度;\
设上升高度范围内$g = 9.8 m\/s^2$\

#ans[
  由密舍尔斯基方程，竖直方向有：
  $
    m frac(d v, d t) = -m g - v^' frac(d m, d t)
  $
  (1) 起飞时
  $
    a &= frac(d v, d t) = -g - frac(v^prime, m) frac(d m, d t)\
    &= lr(bracket.l,size:#200%) -9.8 - frac(2000, 6000) times (-120) lr(bracket.r, size: #200%) m\/s^2 \
    &= 30.2 m\/s^2
  $
  (2) 由
  $
    integral_0^v d v = integral_0^t -g d t - integral_(m_0)^m frac(v ^ prime, m) d m
  $
  $"   "$ 得 $t$ 时刻火箭速度
  $
    v = -g t + v^prime ln(frac(m_0, m))
  $
  $"   "$ 易知燃料消耗完时 $m = 1200k g$，$t = frac(4800k g, 120k g\/s) = 40 s$\，代入得
  $
    v &= lr(bracket.l, size:#200%) -9.8 times 40 + 2000 \ln(frac(6000, 1200)) lr(bracket.r, size: #200%) m\/s\
    &= 2.83 times 10^3 m\/s
  $
  (3) 燃料用完之前，t时刻的高度为：
  $
    x &= integral_0^x d x = integral_0^t v d t = integral_0^t [ v^prime ln(frac(m_0, m_0-alpha t)) - g t] d t \
    &=v^prime [ t - (frac(m_0, alpha) -t ) ln(frac(m_0, m_0-alpha t))] - frac(1,2)g t^2\
  $
  $"   "$ 代入 $t = 40 s$，$m_0 = 6000k g$，$alpha = 120k g\/s$，得
  $
    x &= 2000 times [ 40 - (frac(6000,120) - 40 ) times ln(frac(6000, 6000-120 times 40))] - frac(1,2) times 9.8 times 40^2 \
    &= 4.00 times 10^5 m
  $
]

#pagebreak()

#q(number: "二： ")[在实验室中，质子A以$0.6c$的速度向东运动，质子B以$0.5c$的速度向西运动，求：]
（1）在实验室参考系中，质子A的动能和动量的大小;\
（2）在与质子B相对静止的参考系中，质子A的动能和动量的大小;\

#ans[
  设质子A的静止质量为$m_0$\
  (1)
  $
    E_k &= m c^2 - m_0 c^2 = m_0 c^2 [ frac(1,sqrt(1-v^2/c^2)) - 1]\
    &= 0.25 m_0 c^2 \
    p &= m v = frac(m_0 v,sqrt(1-v^2/c^2))\
    &= 0.75 m_0 c\
  $
  (2)
  在与质子B相对静止的参考系中，质子A的速度为
  $
    v^prime = frac(v - u , 1 - frac(v u, c^2)) = 0.846 c
  $
  所以
  $
    E_k^prime &= m^prime c^2 - m_0 c^2 = m_0 c^2 [ frac(1,sqrt(1-(v^prime)^2/c^2)) - 1]\
    &= 0.876 m_0 c^2 \
    p^prime &= m^prime v^prime = frac(m_0 v^prime,sqrt(1-(v^prime)^2/c^2))\
    &= 1.59 m_0 c\
  $

]

#q(number: "三： ")[
  在惯性系中，理想流体在重力作用下作定常流动时，同一流线上的压强p、流速v、密度和高度h之间的关系满足伯努利方程，请推导：
]
#text(blue, 15pt)[$display( p + frac(1,2) rho v^2 + rho g h = "常量")$]

#ans[
  详见课本第3章第8节第3小节伯努利方程部分，此处仅给出公式推导，无具体分析过程。\
  $
    A_("外") = p_1 S_1 l_1 - p_2 S_2 l_2 = (p_1 -p_2) V
  $
  $
    A_("外") = laplace E_k + laplace E_p
  $
  $
    (p_1 -p_2) V = ( frac(1,2) m v_2^2 - frac(1,2) m v_1^2 ) + ( m g h_2 - m g h_1 )
  $
  $
    p_1 V + frac(1,2) m v_1^2 + m g h_1 = p_2 V + frac(1,2) m v_2^2 + m g h_2
  $
  $
    p + frac(1,2) rho v^2 + rho g h = "常量"
  $
]
