class SendDay < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '1〜２日で発想' },
    { id: 3, name: '２〜３日で発想' },
    { id: 4, name: '４〜７日で発想' },
  ]

  include ActiveHash::Associations
  has_many :products

  end