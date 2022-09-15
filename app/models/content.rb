class Content < ActiveHash::Base
  self.data = [
    { id: 1, name: '施設の情報が間違っている' },
    { id: 2, name: '動物の飼育環境など' },
    { id: 3, name: '動物への虐待、暴言など' },
    { id: 4, name: 'その他' }
  ]
end
