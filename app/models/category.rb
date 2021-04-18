class Category < ActiveHash::Base
  self.data = [
    {id:  1, name: '---'},
    {id:  2, name: 'レディース'},
    {id:  3, name: 'メンズ'},
    {id:  4, name: 'ベビー・キッズ'},
    {id:  5, name: 'インテリア・DIY'},
    {id:  6, name: '本・音楽'},
    {id:  7, name: 'おもちゃ・ホビー'},
    {id:  8, name: 'ゲーム・スマホ'},
    {id:  9, name: 'スポーツ・レジャー'},
    {id: 10, name: 'その他'},
  ]

  include ActiveHash::Associations
  has_many :listings
end
