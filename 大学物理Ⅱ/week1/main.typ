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
  title: "作业1",
  level: "submit",
)



= 9-8
  对于半球壳上的任意电荷，其在球心处产生的电场为：
  $
    d bold(E)  = 1/(4pi epsilon_0) (d q) / (R^2) bold(e)_r \
  $
  由对称性，电荷产生的场强在垂直于轴向的分量相互抵消，只有沿轴向的分量相加。则有：
  $
    bold(E) &= integral d bold(E) =integral_0^(pi/2) integral_0^(2pi R sin theta)  1/(4pi epsilon_0)  (sigma (R dot d theta) d l)/ R^2 cos theta\
    &= sigma/(2 epsilon_0) integral_0^(pi/2) sin theta cos theta d theta\
    &= sigma/(4 epsilon_0)
  $

= 9-9
 以水平向右为正方向，
 对左侧圆环，其在O点产生的电场为：
 $
  bold(E)_1 &= integral d bold(E) = 1/(4pi epsilon_0) (d q) / (R^2) bold(e)_r \
            &= - integral_(-pi/2)^(pi/2) 1/(4pi epsilon_0) (lambda dot  R dot d theta)/ R^2 cos theta \
            &= - lambda/(2pi epsilon_0 R)
 $
右侧两直导线在O点产生的电场为：
 $
  bold(E)_2 &= integral d bold(E) = 1/(4pi epsilon_0) (d q) / (r^2) bold(e)_r \
            &= 2integral_(0)^(infinity) 1/(4pi epsilon_0) (lambda d l)/ (R^2+l^2) l/(sqrt(R^2 + l^2)) \
            &= lambda/(2pi epsilon_0) integral_(0)^(infinity) (l d l)/ (R^2+l^2)^(3/2) = lambda/(2pi epsilon_0) integral_(1/R)^(0) - d(R^2+l^2)^(-1/2)\
            &= lambda/(2pi epsilon_0 R)
 $
所以O点处的合场强为：$0$
= 9-25
#set enum(numbering: "1)")
  + 
    $
      U_o = q / (4 pi epsilon_0 l) + (- q / (4 pi epsilon_0 (l))) = 0 \ 
      U_c = q / (4 pi epsilon_0 dot 3l) + (- q / (4 pi epsilon_0 l)) = - q / (6 pi epsilon_0 l) \
      A_(o a) = q_0(U_c - U_infinity) = (q q_0) / (6 pi epsilon_0 l) \
    $

  + 
    $
    A_(c infinity) = -q_0(U_c - U_infinity) = (q q_0) / (6 pi epsilon_0 l) \
    $
= 9-28 
#set enum(numbering: "a)")
  + 
    $
     U_a &= integral_(0.3)^infinity (Q_1 + Q_2)/(4pi epsilon_0 r_2^2) d r + integral_(0.2)^(0.3) Q_1 / (4pi epsilon_0 r_1^2 d r) \
     &= 900 V
    $
  + 
    $
     U_b &= integral_(0.5)^infinity (Q_1 + Q_2)/(4pi epsilon_0 r_2^2) d r \
     &= 500 V
    $
= 9-29
  $
    U_(A B)=U_(C D) = integral_(R)^(2R) (lambda d x)/(4 pi epsilon_0 x) = lambda/(4 pi epsilon_0) ln 2 \
    U_(overparen(B C)) = integral_(0)^(pi) (lambda d theta)/(4 pi epsilon_0 R) = lambda/(4 epsilon_0)\
    \
    U_O = U_(A B) + U_(overparen(B C)) + U_(C D) = lambda/(4 pi epsilon_0) (2ln 2 + pi)
  
  $
= 9-31
#set enum(numbering: "1)")
  + 
    $
      U_A &= integral_(-l)^(l) (Q/(2l) d x)/(4 pi epsilon_0 sqrt(x^2 + y^2)) \
      &= Q/(4 pi epsilon_0 l) integral_(0)^(l) 1/ sqrt(x^2 + y^2) d x \
      &= Q/(4 pi epsilon_0 l) [ln(x + sqrt(x^2 + y^2))]_(0)^(l) \
      &= Q/(4 pi epsilon_0 l) ln((l + sqrt(l^2 + y^2))/y) \

      E_A &= - (d U_A) / (d y) = Q/(4 pi epsilon_0 l) (y/sqrt(y^2+l^2) / (l+sqrt(l^2 + y^2)) - 1/y) \
      &= Q/(4 pi epsilon_0 sqrt(l^2 + y^2) y)
    $
  + 
    $
      U_B &= integral_(x-l)^(x+l) (Q/(2l) d r)/(4 pi epsilon_0 r) = Q/(8 pi epsilon_0 l) ln((x+l)/ (x-l)) \ 
      E_B &= - (d U_B) / (d x) = - Q/(8 pi epsilon_0 l) (1/(x+l) - 1/(x-l)) \
      &= Q/(4 pi epsilon_0 (x+l)(x-l))
    $
= 9-32
  $
    d q = sigma 2 pi l sin theta d l \
    U = integral_(R_1/(sin theta))^(R_2/(sin theta)) (sigma 2 pi l sin theta d l)/(4 pi epsilon_0 l) = sigma/(2 epsilon_0) (R_2 - R_1)
  $
= 9-33
  $
    sigma = Q/(pi (b^2-a^2))   \
    d q = sigma 2 pi r d r\
  $
  $ 
    U &= integral_(a)^(b) (sigma 2 pi r d r)/(4 pi epsilon_0 r) = Q/(2 pi epsilon_0 (b^2-a^2)) (b-a)\
      &= 1.8 times 10^10 times 6 times 10^(-6) div 1.2 = 9 times 10^3 (V)
  $
= 10-1
  $
    U_o = q/(4 pi epsilon_0 r) + (- q)/(4 pi epsilon_0 a) + (Q+q)/(4 pi epsilon_0 b) \
  $
= 10-4
+
  $
  U_O = U_q + U_感 = q/(4 pi epsilon_0 l) + 1/(4 pi epsilon_0 R) integral q^' = q/(4 pi epsilon_0 l)
  $
+
  $
    U_感 = 1/(4 pi epsilon_0 R) integral q^'= q^'/(4 pi epsilon_0 R) = U_O - U_q = 0 - q/(4 pi epsilon_0 l) = - q/(4 pi epsilon_0 l)\

    display(therefore) q^' = - q R/l
  $