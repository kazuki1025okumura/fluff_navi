require 'csv'

CSV.read('lib/csv/animal.csv', headers: true).each do |row|
  Animal.seed do |s|
    s.id = row['id']
    s.name = row['name']
    s.kanji = row['kanji']
    s.icon = row['icon']
  end
end
