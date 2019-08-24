# egg_and_building
Googleの採用試験に出たとされる「ビルの100階×卵2個」の問題を、動的計画法で解くRubyコードです。
（解析的に解けなかったので、じゃあ最適化で解けばいいじゃない、という発想でやっつけました）

https://www.freecodecamp.org/news/how-to-solve-the-google-recruiters-puzzle-about-throwing-eggs-from-a-building-de6e7ef1755d/

## How to Use

ローカルにcloneして、以下を実行してください。

```
$ ruby solve.rb
```

問題設定の変更は「 `sample_problem.rb` 」を変更してください。
階数100階以上、卵3個以上の問題にも対応しています。
