class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '新品・未使用' },
    { id: 3, name: '未使用に近い' },
    { id: 4, name: '目立った傷や汚れ無し' },
    { id: 5, name: 'やや傷、汚れ有り' },
    { id: 6, name: '傷や汚れ有り' },
    { id: 7, name: '状態が悪い' },
    { id: 8, name: 'ジャンク品' }
  ]

  include ActiveHash::Associations
  has_many :listings
end
