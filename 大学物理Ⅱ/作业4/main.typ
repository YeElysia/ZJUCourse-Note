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
  course: "大学物理Ⅱ",
  name: "叶畅飞",
  alter: "叶畅飞",
  id: "3240103132",
  lang: "zh-cn", // "zh-cn" | "en"
  title: "作业4",
  level: "submit",
)
#set enum(numbering: "1)")
= 13-1
  空气：
  $
    I = B/(mu_0 n) = (4.2 times 10^(-4))/(4 pi times 10^(-7) times 1000) = 0.33 A
  $
  铁芯：
  $
    B^' = mu_r B = 5000 times 4.2 times 10^(-4) = 2.1 T 
  $

= 13-2

  (1)
  $
    I = 2 pi R_1 H_c = 2 pi times 5times 10^(-4) times 500/pi = 0.5 A
  $

  (2)
  $
    I = 2 pi R_2 H_c = 2 pi times 8 times 10^(-3) times 500/pi = 0.8 A
  $

= 13-4

  (1) 
  $
    B &= Phi / S = 0.02 T \ 
  $
  $
    H &= (N I) / (2 pi R) = (300 times 0.032) / 0.3 = 32 upright(A\/m) \ 
    M &= B / (mu_0)  - H = 0.02 / (4 pi times 10^(-7)) -32 = 1.59 times 10^4 upright(A\/m)
  $

  (2) $j_m = M = 1.59 times 10^4 upright(A\/m)$

  (3)
  $
    mu_r = B / (mu_0 H) = 0.02 / (4 pi times 10^(-7) times 32) = 496
  $
= 13-8

  (1) 设一个铁原子磁矩为$P_(m 1)$
  $
    N &= (rho V)/M dot N_A \ 
    P_m &= P_(m 1) dot N = 7.57 upright(A dot m^2) \
   $

   (2)

   $
     M = P_m dot B sin 90 degree = 11.4 upright(N dot m)
   $