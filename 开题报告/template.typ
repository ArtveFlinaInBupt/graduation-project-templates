#let serif-font = ("Times New Roman", "Songti SC")
#let sans-font = ("Helvetica", "Heiti SC")

#let fp = v(-1.25em) + box()
#let hfp = v(-.75em) + box()

#let checkbox = (
  empty: box(baseline: .2em, rect(width: 1em, height: 1em)),
  checked: box(baseline: .2em, rect(width: 1em, height: 1em, sym.checkmark))
)

#let word-zihao-to-length = (
  初号: 42pt,
  小初: 36pt,
  一号: 26pt,
  小一: 24pt,
  二号: 22pt,
  小二: 18pt,
  三号: 16pt,
  小三: 15pt,
  四号: 14pt,
  小四: 12pt,
  五号: 10.5pt,
  小五: 9pt,
  六号: 7.5pt,
  小六: 6.5pt,
  七号: 5.5pt,
  八号: 5pt,
)

#let project(
  info: (
    school: [计算机学院（国家示范性软件学院）],
    major: [],
    author: (
      name: [],
      id: [],
      class-id: [],
    ),
    supervisor: (
      name: [],
      unit: [],
      title: [],
    ),
    title: (
      cn: [],
      en: [],
    ),
    pass: (
      whether: false,
      date: [],
      signature: [],
    )
  ),
  body
) = {
  set document()

  set page(margin: (x: 3.54cm, y: 2.18cm))

  set heading(numbering: "1.1 ")
  // show heading: set text(font: serif-font)
  show heading.where(level: 1): set text(word-zihao-to-length.四号)
  show heading.where(level: 2): set text(word-zihao-to-length.小四)
  show heading: it => strong(it) + hfp

  set text(font: serif-font, size: word-zihao-to-length.五号)

  set par(justify: true)

  show strong: it => text(weight: "black", it)

  show: align.with(center)
  show: block.with(width: 110%)
  grid(
    align: center + horizon,
    row-gutter: 1.25em,
    text(
      top-edge: "bounds",
      bottom-edge: "bounds",
      word-zihao-to-length.三号,
      tracking: .5em
    )[*北京邮电大学*],
    text(
      top-edge: "bounds",
      bottom-edge: "bounds",
      word-zihao-to-length.三号
    )[*本科毕业设计（论文）开题报告*],
    table(
      columns: 6,
      inset: (x: .75em, y: 1em),
      [学院], table.cell(colspan: 2, info.school),
      [专业], table.cell(colspan: 2, info.major),
      [学生姓名], info.author.name,
      [学号], info.author.id,
      [班级], info.author.class-id,
      [指导教师姓名], info.supervisor.name,
      [所在单位], info.supervisor.unit,
      [职称], info.supervisor.title,
      table.cell(rowspan: 2)[设计（论文）题目],
      table.cell(colspan: 5, align(left, [（中文）] + info.title.cn)),
      table.cell(colspan: 5, align(left, [（英文）] + info.title.en)),
      table.cell(colspan: 6, align(left + top, {
        set par(
          first-line-indent: 2em,
          leading: 1.25em,
          spacing: 1.25em,
        )

        [毕业设计（论文）开题报告内容：]
        parbreak()
        body
      })),
      table.cell(colspan: 3)[允许进入毕业设计（论文）下一阶段：是 #if info.pass.whether { checkbox.checked } else { checkbox.empty } #h(.5em) 否 #if not info.pass.whether { checkbox.checked } else { checkbox.empty }],
      table.cell(rowspan: 2)[指导教师签字], table.cell(colspan: 2, rowspan: 2, info.pass.signature),
      [日期], table.cell(colspan: 2, info.pass.date),
    ),
    pad(top: -1em, align(left)[注：可根据开题报告的长度加页]),
  )
};
