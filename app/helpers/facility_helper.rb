module FacilityHelper
  def facility_image(facility)
    if facility.posts.present?
      image_tag facility.posts.first.image.url
    else
      select_image(facility)
    end
  end

  def select_image(facility)
    case facility.category_ids
    when [3]
      image_tag 'facilities/farm.jpg'
    when [5]
      image_tag 'facilities/dog.jpg'
    when [2]
      image_tag 'facilities/aquarium.jpg'
    when [4]
      image_tag 'facilities/cat.jpg'
    when [9]
      image_tag 'facilities/lizard.jpg'
    when [6]
      image_tag 'facilities/hedgehog.jpg'
    when [8]
      image_tag 'facilities/bird.jpg'
    when [7]
      image_tag 'facilities/owl.jpg'
    when [10]
      image_tag 'facilities/animal_cafe.jpg'
    when [1]
      image_tag 'facilities/zoo.jpg'
    when [12]
      image_tag 'facilities/rare.jpg'
    else
      image_tag 'no_image.jpg'
    end
  end
end
