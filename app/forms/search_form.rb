class SearchForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :name, :string
  attribute :address, :string
  attribute :description, :string
  attribute :prefecture_id, :integer
  attribute :category_id, :integer
  attribute :animal_id, :integer

  def search
    relation = Facility.distinct.includes(:managements, :animals, :facility_categories, :categories)

    relation = relation.by_prefecture(prefecture_id) if prefecture_id.present?
    relation = relation.by_category(category_id) if category_id.present?
    relation = relation.by_animal(animal_id) if animal_id.present?

    search_words.each do |search|
      relation = relation.search_contain(search)
    end

    relation
  end

  private

  def search_words
    name.present? ? name.split(/[[:blank:]]+/) : []
  end
end
