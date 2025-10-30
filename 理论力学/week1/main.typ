#import "@local/Typwork-some:0.1.1": homework,styles

#let question = homework.question
#let answer = homework.answer

#let level = sys.inputs.at("level", default: "post"); //报告等级 the level of the report

/*
  level: "post" | "submit"
  post: 显示昵称并隐藏学号 show nickname and hide student ID
  submit: 显示真名和学号 show real name and student ID
*/
#show heading: it => {
  text(blue)[#it]
}
#show: styles.work.with(
  course: "理论力学",
  name: "叶畅飞",
  alter: "叶畅飞",
  id: "3240103132",
  lang: "zh-cn", // "zh-cn" | "en"
  title: "第五章 第一次作业",
  level: "submit",
)



= 一、思考题
  == 5-2
  #table(
    columns: (auto, auto, auto,auto, auto, auto, auto, auto),
    inset: 10pt,
    align: horizon,
    table.header(
      [], [*A*], [*B*], [*C*], [*D*], [*E*], [*F*], [*G*],
    ),
    [*$v$*], "不可能","可能","不可能","不可能","可能","可能","不可能",
    [*a*],"可能","可能","不可能","可能","可能","可能","可能",
  )
  速度方向应该与轨迹切线方向相同，加速度方向应该与轨迹曲率方向相同。

  == 5-7
  #set enum(numbering: "1)")
    + $a=a_n, a_t=0$ \ 
      沿曲线做匀速运动，说明切向加速度为零，所以全加速度等于法向加速度。
    + $a=a_t+a_n$ \
      沿曲线运动，说明切向加速度不为零，$a_n$大小未知，全加速度等于切向加速度与法向加速度的合成。 
    + $a=a_t$ \
      沿直线做变速运动，说明法向加速度为零，所以全加速度等于切向加速度。
    + $a=a_t+a_n$ \
      沿曲线变速，说明切向加速度与法向加速度均不为零，全加速度等于切向加速度与法向加速度的合成。

= 二、习题
  == 5-1
    运动方程\
    $
    x &= x_A = O A times cos(omega t) \
       &= 200cos(omega t) = 200cos(pi/5 t) (m m)\

    y &= O A times sin(omega t) - A C times sin(omega t) - C D times sin(omega t) \
       &= 100sin(omega t) = 100sin(pi/5 t) (m m)
    $

    轨迹方程\
    $
    (x/200)^2 + (y/100)^2 = 1
    $
  
  == 5-2
    $
      x_A &= x_B + A B times cos(phi - pi/2) \
          &= a + b sin(omega t) + l cos(omega t - pi/2) \
          &= a + (b + l) sin(omega t)\
    
      y_A &= A B times sin(phi - pi/2) \
          &=l sin(omega t - pi/2) \
          &=l cos(omega t)
    $
    于是轨迹方程为
    $
      ((x - a)/ (b + l))^2 + (y/l)^2 = 1
    $