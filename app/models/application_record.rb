class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  scope :favo_animal, ->(animal) { Facility.joins(:managements).where('animal_id = ?', animal.id) }
  scope :favo_category, ->(category) { Facility.joins(:facility_categories).where('category_id = ?', category.id) }

  def suggest_to_login_user(user)
    animal = user.animal
    category = user.category
    facilities = Facility.offset(rand(Facility.count)).limit(100)
    suggest_animal_facilities = facilities.favo_animal(animal).to_a
    suggest_category_facilities = facilities.favo_category(category).to_a
    suggest_animal_facilities.concat(suggest_category_facilities).uniq.sample(3)
  end
end
