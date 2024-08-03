# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seedの実行を開始"

seika = User.find_or_create_by!(email: "seika@example.com") do |user|
  user.name = "Seika"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")
end

yuta = User.find_or_create_by!(email: "yuta@example.com") do |user|
  user.name = "Yuta"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")
end

mira = User.find_or_create_by!(email: "mira@example.com") do |user|
  user.name = "Mira"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end

Book.find_or_create_by!(title: "赤ずきん グリム") do |book|
  book.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-book1.jpg"), filename:"sample-book1.jpg")
  book.body = "むかしむかし、あるところに『赤ずきん』と呼ばれるかわいい女の子がいました。女の子はおばあさんに作ってもらった赤いずきんをいつもかぶっていたので、そう呼ばれていました。ある日お母さんからのお使いで病気のおばあさんにお見舞いに行きました。途中で出会った悪い狼にそそのかされ、お母さんと約束した寄り道をしないという約束を破ってしまいました。その間に狼はおばあさんの家へ向かい、おばあさんを丸吞みにしてしまいました。赤ずきんも食べるためにおばあさんに扮して赤ずきんを待ちました。
  おばあさん家に到着した赤ずきんは「おばあさん。なんて大きなお耳でしょう？」「それはね、おまえの声がとおくからでもよく聞こえるようにさ」「なんてぎょろぎょろしたおめめでしょう？」「それはね、おまえの顔がよく見えるようにさ」「耳までさけた、なんて大きなおくなの？」「それは……おまえをひとくちで食べるためだ！」と赤ずきんを丸吞みにしました。
  満腹で大きないびきをかいて寝ていた狼を、近くを歩いていた狩人が見つけました。狼のお腹をナイフで切り裂くと、赤ずきんとおばあさんが生きたまま出てきました。狼のお腹には石を詰め込み懲らしめた後、赤ずきんとおばあさん、狩人はみんなでご飯を食べました。"
  book.user = seika
end

Book.find_or_create_by!(title: "銀河鉄道の夜　宮沢賢治") do |book|
  book.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-book2.jpg"), filename:"sample-book2.jpg")
  book.body = "貧しい少年のジョバンニはある夜、ひとりぼっちで星を眺めていました。気がつくと、同級生で疎遠になっていた友人のカムパネルラと共に銀河鉄道に乗り込んでいました。
  銀河鉄道には色々な考えや生き方をする人々に出会い、色々な事を学びました。星を巡る旅を楽しんだ二人でしたが、「ほんとうのさいわい」について話している際にカムパネルラは意味深な言葉を残して姿を消してしまいました。
  ひとり目を覚ましたジョバンニは急いで街へ向かうと、川に落ちたザネリを助けようとして溺れてしまい、そのまま行方不明になってしまった事を知ります。夢の中でカムパネルラが言っていた言葉の意味を悟るのでした。"
  book.user = yuta
end

Book.find_or_create_by!(title: "聖書") do |book|
  book.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-book3.jpg"), filename:"sample-book3.jpg")
  book.body = '聖書は、神様と人間との歴史上の出会いをまとめたものである。旧約聖書と新約聖書の二部構成となっている。イエス・キリストの登場前後で分かれている。
  旧約聖書ではイエス・キリストが登場する前、神様が人間の救いについて人間との間に結ばれた契約と経緯が記されている。新約聖書ではイエス・キリストが来られた後、キリストを通して神様が人間と結ばれた新しい契約と経緯が記されたものである。
  聖書は現在、世界で最も読まれている本となっている。'
  book.user = mira
end

puts "seedの実行が完了"