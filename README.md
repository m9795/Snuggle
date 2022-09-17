# ![logo2](https://user-images.githubusercontent.com/106650955/186106765-ef446621-e77c-448a-b9ab-e534e2b1f50a.svg) -すなぐる-

## サイト概要
#### カフェ×学習のコミュニティサイトです。
アプリケーション名のSnuggle(すなぐる)は「寄り添う」の意味があります。「利用者同士が程よく寄り添えたら」という想いと、「利用者に寄り添ったアプリケーションを作成できればいいな」という想いから決めました。

### サイトテーマ
カフェに立ち寄るように、仲間と気軽に集まれる場所に

#### このサイトで出来ること
* 学習におすすめのカフェの共有
* 学習時間やリラックス方法などの共有
* 学習を頑張っている仲間作り　など

### テーマを選んだ理由
**きっかけ**  
現在プログラミング学習をする中で、学習中の息抜きの大切さと一緒に頑張る仲間がいるありがたさを実感したことがきっかけです。

**カフェx学習 を選んだ背景**  
　程よくリラックスでき、集中できる空間は学習効率が上がると感じており、カフェはその両方を満たしていると考え、
カフェと学習を掛け合わせたテーマで作成しようと思いました。  
　現在、新型コロナウイルスの影響でリモートワークやオンライン学習などが進んでいますが、
「自宅だと集中しにくい」「作業場所と生活場所が変わらず気持ちの切り替えがしにくい」という声を聞いたことがあったため、
それらの問題も解決できるようなサイトにしたいなと考え、学習やワークスペースにおすすめのカフェを共有できるサイトにしました。

### ターゲットユーザ
* 年齢：10代後半~30代
* 性別：男女問わない
* 学習を頑張っている人、これから学習を頑張りたい人
* カフェが好きな人、リラックスしたい人　など

### 主な利用シーン
* 同じような目標を持つ学習仲間を作りたい時
* 学習におすすめのカフェを探したり投稿したりしたい時
* 楽しみながら学習を頑張りたいとき
* 情報共有し学習意欲を向上させたい時
* リラックスや息抜きをして効率よく学習したい時
* 息詰まったり疲労感がある時　など

## 設計書
### AWS構成図
![AWS構成図](https://user-images.githubusercontent.com/106650955/190860192-699ff9e0-834f-4ab6-acf4-b9e6f0a6ddee.png)

### ER図
![image](https://user-images.githubusercontent.com/106650955/186998490-cf03c6b1-6a4e-430a-8660-dfa9627886f8.png)

### その他設計書
- テーブル定義書：[テーブル提議書_Snuggle.pdf](https://github.com/m9795/Snuggle/files/9400606/_Snuggle.pdf)
- アプリケーション詳細設計書：[アプリケーション詳細設計書.pdf](https://github.com/m9795/Snuggle/files/9436838/default.pdf)
- テスト仕様書(管理者側)：[テスト仕様書①_admin.pdf](https://github.com/m9795/Snuggle/files/9436636/_admin.pdf)
- テスト仕様書(ユーザ側)：[テスト仕様書②_user.pdf](https://github.com/m9795/Snuggle/files/9436651/_user.pdf)

## 動作デモ
### 投稿機能(ActiveStorage・Google Maps API)
<img src="https://user-images.githubusercontent.com/106650955/190840110-c73afc5e-06bc-4fb2-baca-fff9d03463ed.gif" width="70%">

### チャット機能
<img src="https://user-images.githubusercontent.com/106650955/190839704-1088677b-067e-490e-97fc-2f508f3b7ce0.gif" width="70%">

### 検索機能(設備タグ・ハッシュタグ・キーワード)
<img src="https://user-images.githubusercontent.com/106650955/190866187-fad38b50-3fab-4461-a89e-feabca2e92d8.gif" width="70%">

### お問い合わせ機能(Action Mailer)
<img src="https://user-images.githubusercontent.com/106650955/190862235-369a2cf5-bb30-4b73-aeb1-8c1051301473.gif" width="70%">

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

## 使用素材・ツール
- ロゴ：Canva(https://www.canva.com/)
- アイコン：Fontawsome(https://fontawesome.com/)
- サンプル画像：O-DAN(https://o-dan.net/ja/)
- 絵文字：fromkato.com(https://fromkato.com/)
- favicon.ico作成：(https://ao-system.net/favicon/

#### README
- ER図・AWS構成図：diagrams.net
- 動画編集：Clipchamp
- gif作成：Convertio(https://convertio.co/ja/)
