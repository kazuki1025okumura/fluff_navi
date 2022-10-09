class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :favo_animal, ->(animal) { Facility.joins(:managements).where('animal_id = ?', animal.id) }
  scope :favo_category, ->(category) { Facility.joins(:facility_categories).where('category_id = ?', category.id) }

  def suggest_to_login_user(user)
    animal = user.animal
    category = user.category
    hoge(animal, category)
  end

  def hoge(animal, category)
    facilities = Facility.limit(100).offset(rand(5))
    if !animal && !category
      facilities.where(suggest: 1).includes(%i[facility_categories categories managements animals]).sample(3)
    else
      suggest_animal_facilities = animal ? facilities.favo_animal(animal).to_a : []
      suggest_category_facilities = category ? facilities.favo_category(category).to_a : []
      suggest_animal_facilities.concat(suggest_category_facilities).uniq.sample(3)
    end
  end
end
