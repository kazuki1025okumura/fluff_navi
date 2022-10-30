module FacilityHelper
  def facility_image(facility)
    if facility.posts.present?
      image_tag facility.posts.first.image.url
    else
      select_image(facility)
    end
  end

  def select_image(facility)
    if facility.category_ids.include?(3)
      image_tag 'facilities/farm.jpg'
    elsif facility.category_ids.include?(5)
      image_tag 'facilities/dog.jpg'
    elsif facility.category_ids.include?(2)
      image_tag 'facilities/aquarium.jpg'
    elsif facility.category_ids.include?(4)
      image_tag 'facilities/cat.jpg'
    elsif facility.category_ids.include?(9)
      image_tag 'facilities/lizard.jpg'
    elsif facility.category_ids.include?(6)
      image_tag 'facilities/hedgehog.jpg'
    elsif facility.category_ids.include?(8)
      image_tag 'facilities/bird.jpg'
    elsif facility.category_ids.include?(7)
      image_tag 'facilities/owl.jpg'
    elsif facility.category_ids.include?(10)
      image_tag 'facilities/animal_cafe.jpg'
    elsif facility.category_ids.include?(1)
      image_tag 'facilities/zoo.jpg'
    elsif facility.category_ids.include?(12)
      image_tag 'facilities/rare.jpg'
    else
      image_tag 'no_image.jpg'
    end
  end
end
