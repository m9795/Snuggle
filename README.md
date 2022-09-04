# ![logo2](https://user-images.githubusercontent.com/106650955/186106765-ef446621-e77c-448a-b9ab-e534e2b1f50a.svg) -すなぐる-

## サイト概要
### サイトテーマ
#### カフェ×学習のコミュニティサイトです。
* アプリケーション名のSnuggle(すなぐる)は「寄り添う」の意味があります。
* 「利用者同士が程よく寄り添えたら」という想いと、「利用者に寄り添ったアプリケーションを作成できればいいな」と思い決めました。
#### このサイトで出来ること
* 学習におすすめのカフェを共有できる
* 学習時間やリラックス方法などを共有できる
* 学習を頑張っている仲間を作ることができる

### テーマを選んだ理由
学習を続けるには息抜きが必要です。
そんな時に、リラックスできるカフェで学習することで息抜きができればいいなと思い、
みんなのおすすめのカフェを共有できればと思いました。
現在、コロナ禍でリモートワークやオンライン学習が進んでおり
ワークスペースとしてのカフェ需要は高まっています。
今後も需要は高まると予想されているので、効率よく学習に取り組めるカフェを
探すことができればと考えました。

### ターゲットユーザ
* 学習を頑張っている人、これから学習を頑張りたい人
* カフェが好きな人、リラックスしたい人

### 主な利用シーン
* 学習におすすめのカフェなどを共有したい時
* 同じような目標を持つ学習仲間を作りたい時
* 情報共有し学習意欲を向上させたい時
* リラックスや息抜きをして効率よく学習したい時
* 息詰まったり疲労感がある時　など

## 設計書
### ER図
![image](https://user-images.githubusercontent.com/106650955/186998490-cf03c6b1-6a4e-430a-8660-dfa9627886f8.png)

### その他設計書
- テーブル定義書：[テーブル提議書_Snuggle.pdf](https://github.com/m9795/Snuggle/files/9400606/_Snuggle.pdf)
- アプリケーション詳細設計書：[アプリケーション詳細設計書.pdf](https://github.com/m9795/Snuggle/files/9436838/default.pdf)
- UI Flows(ユーザ側)：[user.pdf](https://github.com/m9795/Snuggle/files/9399592/user.pdf)
- UI Flows(管理者側)：[admin.pdf](https://github.com/m9795/Snuggle/files/9399593/admin.pdf)
- テスト仕様書(管理者側)：[テスト仕様書①_admin.pdf](https://github.com/m9795/Snuggle/files/9436636/_admin.pdf)
- テスト仕様書(ユーザ側)：[テスト仕様書②_user.pdf](https://github.com/m9795/Snuggle/files/9436651/_user.pdf)

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 開発効率向上
- devise
- rails-i18n
- bootstrap
- kaminari
- annotate
- Rubocop
- dotenv-rails

#### デバッグツール
- pry-rails
- pry-byebug
- better_errors
- binding_of_caller

## UI/UX
- レスポンシブ対応

## 外部API
#### 地図利用
- Maps JavaScript API
- Geocoding API

## 使用素材
- ロゴ：Canva(https://www.canva.com/)
- アイコン：Fontawsome(https://fontawesome.com/)
- サンプル画像：O-DAN(https://o-dan.net/ja/)
- 絵文字：fromkato.com(https://fromkato.com/)
