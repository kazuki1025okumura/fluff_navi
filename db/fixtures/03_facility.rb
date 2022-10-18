require 'csv'

CSV.read('lib/csv/tokyo.csv', headers: true).each do |row|
  Facility.seed do |s|
    s.name = row['name']
    s.description = row['description']
    s.animal_ids = row['animal_ids']
    s.category_ids = row['category_ids']
    s.address = row['address']
    s.longitude = row['longitude']
    s.latitude = row['latitude']
    s.tel_number = row['tel_number']
    s.opening_hours = row['opening_hours']
    s.web_site = row['web_site']
    s.prefecture_id = row['prefecture_id']
    s.id = row['id']
  end
end

CSV.read('lib/csv/kanagawa.csv', headers: true).each do |row|
  Facility.seed do |s|
    s.name = row['name']
    s.description = row['description']
    s.animal_ids = row['animal_ids']
    s.category_ids = row['category_ids']
    s.address = row['address']
    s.longitude = row['longitude']
    s.latitude = row['latitude']
    s.tel_number = row['tel_number']
    s.opening_hours = row['opening_hours']
    s.web_site = row['web_site']
    s.prefecture_id = row['prefecture_id']
    s.id = row['id']
  end
end