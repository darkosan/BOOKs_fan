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
  user.name = "Mina"
  user.password = "password"
  user.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")
end

Book.find_or_create_by!(title: "赤ずきん グリム") do |book|
  book.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-book1.jpg"), filename:"sample-book1.jpg")
  book.body = "有名なグリム童話。
  赤ずきんがおばあさんのところへお見舞いに行く最中に狼にそそのかされて、お母さんの言いつけを破り寄り道をしてしまった。それがきっかけに狼がおばあさんと赤ずきんを食べてしまった。
  通りすがりの狩人に助けられて、ハッピーエンド。
  そのあとに続きあり、赤ずきんは家に帰ったのち、お母さんに約束を破ったことを謝り、約束を破らないことを約束した。"
  book.user = seika
  book.genre = Genre.find_or_create_by!(name: "童話")
end

Book.find_or_create_by!(title: "銀河鉄道の夜　宮沢賢治") do |book|
  book.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-book2.jpg"), filename:"sample-book2.jpg")
  book.body = "貧しい少年のジョバンニはある夜、ひとりぼっちで星を眺めていました。気がつくと、同級生で疎遠になっていた友人のカムパネルラと共に銀河鉄道に乗り込んでいました。
  銀河鉄道には色々な考えや生き方をする人々に出会い、色々な事を学びました。星を巡る旅を楽しんだ二人でしたが、「ほんとうのさいわい」について話している際にカムパネルラは意味深な言葉を残して姿を消してしまいました。
  ひとり目を覚ましたジョバンニは急いで街へ向かうと、川に落ちたザネリを助けようとして溺れてしまい、そのまま行方不明になってしまった事を知ります。夢の中でカムパネルラが言っていた言葉の意味を悟るのでした。
  有名な内容ではあるが、内容は難しい。"
  book.user = yuta
  book.genre = Genre.find_or_create_by!(name: "ファンタジー")
end

Book.find_or_create_by!(title: "聖書") do |book|
  book.image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-book3.jpg"), filename:"sample-book3.jpg")
  book.body = '聖書は、神様と人間との歴史上の出会いをまとめたものである。旧約聖書と新約聖書の二部構成となっている。イエス・キリストの登場前後で分かれている。
  旧約聖書ではイエス・キリストが登場する前、神様が人間の救いについて人間との間に結ばれた契約と経緯が記されている。新約聖書ではイエス・キリストが来られた後、キリストを通して神様が人間と結ばれた新しい契約と経緯が記されたものである。
  聖書は現在、世界で最も読まれている本となっている。'
  book.user = mira
  book.genre = Genre.find_or_create_by!(name: "哲学")
end

puts "seedの実行が完了"