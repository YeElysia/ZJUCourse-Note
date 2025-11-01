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
  title: "第五章 第2次作业",
  level: "submit",
)


== 5-8

显然 $display(l_(O D) = a cos(k t))$，于是 $ display(v_t = -a k sin(k t)) $方向由 $D$ 指向 $O$。

又 $x = l_(O D) cos(k t), y = l_(O D) sin(k t)$，所以 $v_x = -a k sin(2 k t), v_y = a k cos(2 k t)$。即：
$
  v = a k
$

== 5-10

切向加速度 $display(a_t = a cos(30 degree)) = 8.66 m\/s$

法向加速度 $display(a_n = a sin(30 degree) = v^2 / rho)$。所以 $rho = 5m$
