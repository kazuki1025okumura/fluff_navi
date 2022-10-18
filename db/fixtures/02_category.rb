require 'csv'

CSV.read('lib/csv/category.csv', headers: true).each do |row|
  Category.seed do |s|
    s.id = row['id']
    s.name = row['name']
  end
end
