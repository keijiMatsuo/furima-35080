class ShippingDays < ActiveHash::Base
  self.data = [
    {id: 1, name: '---'},
    {id: 2, name: '１〜２日'},
    {id: 3, name: '３〜４日'},
    {id: 4, name: '４〜７日'},
    {id: 5, name: '７日以上'}
  ]

  include ActiveHash::Associations
  has_many :listings
end
