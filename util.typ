#let fp = v(-1.25em) + box()
#let hfp = v(-.75em) + box()

#let checkbox = (
  empty: box(baseline: .2em, rect(width: 1em, height: 1em)),
  checked: box(baseline: .2em, rect(width: 1em, height: 1em, sym.checkmark))
)

#let try-str = it => if type(it) == str {
  it
} else if type(it) == content {
  it.text
} else {
  panic("it must be content or str")
}

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
