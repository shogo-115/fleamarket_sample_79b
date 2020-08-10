crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", user_path(current_user.id)
  parent :root
end

crumb :favorite do
  link "お気に入りの商品", product_favorites_path(:product_id)
  parent :mypage
end

crumb :newlooks do
  link "新着商品の一覧", newlook_path
  parent :root
end

crumb :womens do
  link "レディース商品の一覧", women_path
  parent :root
end

crumb :mens do
  link "メンズ商品の一覧", men_path
  parent :root
end

crumb :cameras do
  link "家電・スマホ・カメラ商品の一覧", camera_path
  parent :root
end

crumb :hobbies do
  link "おもちゃ・ホビー・グッズ商品の一覧", hobby_path
  parent :root
end

crumb :sold do
  link "出品商品の一覧", sold_path
  parent :mypage
end

crumb :bought do
  link "購入商品の一覧", bought_path
  parent :mypage
end