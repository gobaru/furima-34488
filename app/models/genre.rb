class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'カテゴリー' },
    { id: 3, name: '商品の状態' },
    { id: 4, name: '配送料の負担' },
    { id: 5, name: '配送元の地域' },
    { id: 6, name: '発送までの日数' },
  ]
  end