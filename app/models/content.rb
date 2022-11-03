class Content < ActiveHash::Base
  self.data = [
    { id: 1, name: '施設の情報変更' },
    { id: 2, name: '動物の飼育環境など' },
    { id: 3, name: 'その他' }
  ]
end
