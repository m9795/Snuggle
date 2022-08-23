# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# 管理者の作成
Admin.create!(
  email: "admin@com",
  password: "hogehoge"
)

# ユーザの作成
users = User.create!(
  [
    { email: "olivia@test.com",
      name: "Olivia",
      password: "password",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"),
      filename:"sample-user1.jpg"),
      introduction: "はじめまして！よろしくお願いします。",
      study_content: "プログラミング",
      target: "自身のHPを作る",
      sleeping_time: "23:00~6:00　24時までには寝るようにしています",
      studying_time: "19:00~21:00　学校が終わって帰宅後学習しています",
      relax: "友人とランチ　ペットの猫と遊ぶ",
      fighting: "好きな音楽を聴く！",
      favorite_color: "オレンジ　ピンク",
      favorite_cafe: "メニューが豊富なカフェ　流行りのカフェ",
      favorite_drink: "フラペチーノ全般　カプチーノ",
      favorite_food: "パスタ　マカロン"},

    { email: "james@test.com",
      name: "James",
      password: "password",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"),
      filename:"sample-user2.jpg"),
      introduction: "はじめまして！穴場なカフェが好きです。おすすめがあれば教えてください。よろしくお願いします！！",
      study_content: "英語",
      target: "留学すること",
      sleeping_time: "0:00~5:00 朝からランニングしています",
      studying_time: "ランニング中や通学中にリスニングの学習をしています",
      relax: "サウナ　ジム",
      fighting: "ブラックのコーヒーを飲む",
      favorite_color: "黒　シルバー",
      favorite_cafe: "落ち着いた雰囲気のカフェ",
      favorite_drink: "ブラックコーヒー（無糖）",
      favorite_food: "ラーメン"},

    { email: "lucas@test.com",
      name: "Lucas",
      password: "password",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"),
      filename:"sample-user3.jpg"),
      introduction: "はじめまして。現在大学3年生です。仲良くしてください。",
      study_content: "タイピング",
      target: "タイピング検定3級",
      sleeping_time: "22:00~6:30",
      studying_time: "21:00~22:30",
      relax: "映画鑑賞　夜ドライブすること",
      fighting: "スケジュールを立てる",
      favorite_color: "緑",
      favorite_cafe: "コーヒー豆の種類が多いカフェ",
      favorite_drink: "エスプレッソ",
      favorite_food: "アメリカンワッフル"}
  ]
)

# お店の設備タグ作成
ShopTag.create!(
  [                                 # ID
    { name: "Wi-Fiあり" },          #  1
    { name: "電源あり" },           #  2
    { name: "30席以上" },           #  3
    { name: "個室あり" },           #  4
    { name: "予約可" },             #  5
    { name: "BGMあり" },            #  6
    { name: "メニュー豊富"},        #  7
    { name: "落ち着いた雰囲気" },   #  8
    { name: "にぎやかな雰囲気" },   #  9
    { name: "キャッシュレス可" },   # 10
    { name: "駐車場あり" }          # 11
  ]
)

# 投稿の作成
Post.create!(
  [
    # ユーザ1の投稿
    { title: "流行りのカフェ",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"),
      filename:"sample-post1.jpg"),
      content: "大人気のカフェに友人と行ってきました。テスト勉強もはかどってよかったです。 #cafe#Cavello#ランチ#テスト勉強",
      user_id: users[0].id,
      lat: "35.6896067",
      lng: "139.7005713",
      shop_name: "Cavello",
      shop_detail: "今話題の大人気カフェです。",
      shop_place: "新宿駅",
      shop_home_page: "/",
      shop_remarks: "ランチタイムに行きましたが、３組ほど並んでいました。"},

    # ユーザ2の投稿
    { title: "落ち着くお気に入りのカフェ",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"),
      filename:"sample-post2.jpg"),
      content: "落ち着いた雰囲気のカフェです。 #cafe #カフェ #学習におすすめ",
      user_id: users[1].id,
      lat: "35.68123620000001",
      lng: "139.7671248",
      shop_name: "calm cafe",
      shop_detail: "おしゃれな店内で、長時間営業なので学習にもおすすめです。",
      shop_place: "東京駅",
      shop_home_page: "/",
      shop_remarks: "学習で利用している人が多く、居心地がよかったです。"},

    # ユーザ3の投稿
    { title: "メニューが多いカフェ",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"),
      filename:"sample-post3.jpg"),
      content: "コーヒー豆の種類がたくさんあるので、コーヒー好きの方におすすめです！フードメニューもたくさんありました。おすすめはカフェラテとパンケーキです。#coffe#コーヒー#cafe#カフェ",
      user_id: users[2].id,
      lat: "35.6580339",
      lng: "139.7016358",
      shop_name: "Many",
      shop_detail: "店内が広く開放感があります。期間限定メニューも豊富です。",
      shop_place: "渋谷駅",
      shop_home_page: "/",
      shop_remarks: "混んでいましたが、店員さんも多いので提供は早かったです。",
     },

    # ユーザ1の非公開投稿
    { title: "cafe",
      content: "my favorite",
      user_id: users[0].id,
      publish: false
    }
  ]
)

# 投稿とお店の設備タグの紐づけ
ShopTagging.create!(
  [
    # 投稿1のタグ付け
    #（Wi-Fiあり・30席以上・にぎやかな雰囲気・キャッシュレス可）
    { post_id: 1,
      shop_tag_id: 1
    },
    { post_id: 1,
      shop_tag_id: 3
    },
    { post_id: 1,
      shop_tag_id: 9
    },
    { post_id: 1,
      shop_tag_id: 10
    },

    # 投稿2のタグ付け
    #（Wi-Fiあり・電源あり・BGMあり・落ち着いた雰囲気・キャッシュレス可・駐車場あり）
    { post_id: 2,
      shop_tag_id: 1
    },
    { post_id: 2,
      shop_tag_id: 2
    },
    { post_id: 2,
      shop_tag_id: 6
    },
    { post_id: 2,
      shop_tag_id: 8
    },
    { post_id: 2,
      shop_tag_id: 10
    },
    { post_id: 2,
      shop_tag_id: 11
    },

    # 投稿3のタグ付け
    #（30席以上・メニュー豊富・にぎやかな雰囲気・キャッシュレス可・駐車場あり）
    { post_id: 3,
     shop_tag_id: 3
    },
    { post_id: 3,
      shop_tag_id: 7
    },
    { post_id: 3,
      shop_tag_id: 9
    },
    { post_id: 3,
      shop_tag_id: 10
    },
    { post_id: 3,
      shop_tag_id: 11
    }
  ]
)

# フォローフォロワーの作成
Relationship.create!(
  [
    { follower_id: 1,
      followed_id: 2
    },
    { follower_id: 2,
      followed_id: 1
    },
    { follower_id: 2,
      followed_id: 3
    },
    { follower_id: 3,
      followed_id: 1
    }
  ]
)

# ユーザ1と2のチャットルーム作成
#（ユーザ1と2は相互フォロー）
Room.create!()

UserRoom.create!(
  [
    { user_id: 1,
      room_id: 1
    },
    { user_id: 2,
      room_id: 1
    }
  ]
)

# ユーザ1と2のチャット
Chat.create!(
  [
    { user_id: 2,
      room_id: 1,
      message: "Oliviaさん、はじめまして！フォローありがとうございます(*^^*)\r\nよろしくお願いします！！"
    },
    { user_id: 1,
      room_id: 1,
      message: "Jamesさん、はじめまして！メッセージありがとうございます😆\r\nこちらこそよろしくお願いします！！"
    }
  ]
)

# ユーザ1のひとりごと投稿
OwnPost.create!(
  [
    { user_id: 1,
      content: "昨日は少しさぼっちゃったから、今日こそ２時間学習するぞ！！"
    },
    { user_id: 1,
      content: "明日は友人とランチだから、そのためにも頑張ろう😆"
    }
  ]
)

# お気に入りの作成
Like.create!(
  [
    { user_id: 2,
      post_id: 1
    },
    { user_id: 3,
      post_id: 1
    },
    { user_id: 2,
      post_id: 3
    },
    { user_id: 1,
      post_id: 3
    }
  ]
)

# コメントの作成
Comment.create!(
  [
    { user_id: 1,
      post_id: 3,
      comment: "メニュー豊富なの魅力的ですね！今度行ってみます😀"
    },
    { user_id: 2,
      post_id: 3,
      comment: "おいしそうですね！もしよければ、おすすめ教えてください(^O^)／"
    }
  ]
)
