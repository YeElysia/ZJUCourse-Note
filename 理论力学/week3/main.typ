#import "@local/Typwork-some:0.1.1": homework, styles

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
  title: "第六章 作业",
  level: "submit",
)


== 6-5

设∠ $O C B$ 为 $phi$，∠ $B O C$ 为 $theta$, 则
$
  tan theta = frac(r sin phi, h - r cos phi)
$
因此转动方程为
$
  theta_(O A) = arctan(frac(r sin phi, h - r cos phi))
$

== 6-17

$
      omega & = v_A / R = 2 bold(k) #h(5pt)upright(r a d)\/s \
      alpha & = a_B^t / R = -1.5 bold(k) #h(5pt)upright(r a d)\/s^2 \
            \
  alpha_C^t & = alpha times r_C = -75 sqrt(2) bold(i) - 75 sqrt(2) bold(j) #h(5pt) m\/s^2 \
  alpha_C^n & = omega times v_C = -200 sqrt(2) bold(i) + 200 sqrt(2) bold(j) #h(5pt) m\/s^2 \
    alpha_C & = alpha_C^t + alpha_C^n = -388.9 bold(i) + 176.8 bold(j) #h(5pt) m\/s^2 \
$
