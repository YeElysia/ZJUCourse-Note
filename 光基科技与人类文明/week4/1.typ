#import "@local/Typwork-some:0.1.1": homework, styles

#let question = homework.question
#let answer = homework.answer

#let level = sys.inputs.at("level", default: "post"); //报告等级 the level of the report

/*
  level: "post" | "submit"
  post: 显示昵称并隐藏学号 show nickname and hide student ID
  submit: 显示真名和学号 show real name and student ID
*/

#show: styles.work.with(
  course: "Course Name",
  name: "Name",
  alter: "Nickname",
  id: "Student ID",
  lang: "zh-cn", // "zh-cn" | "en"
  title: "The Title of the Report",
  level: level,
)

#question(number: 1)[
  This is a question.
]
#answer()[
  This is an answer.
]
#question(number: "一、")[
  This is a question.
]
#answer()[
  This is an answer.
]

```python
test_str = "Hello, World!"
print(test_str)
```
