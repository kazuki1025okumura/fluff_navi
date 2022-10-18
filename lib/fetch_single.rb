class FetchSingle
  def detailed_search(prefecture, a)
    data = []

    # 検索結果の place_id を取り出しそれを元に詳細情報を検索する
    place = get_data(a).first['place_id']
    place_id = place

    place_id_query = URI.encode_www_form(
      place_id: place_id,
      language: 'ja',
      key: ENV['API_KEY']
    )

    id_search_url = URI("https://maps.googleapis.com/maps/api/place/details/json?#{place_id_query}")
    id_search_https = Net::HTTP.new(id_search_url.host, id_search_url.port)
    id_search_https.use_ssl = true

    id_search_request = Net::HTTP::Get.new(id_search_url)

    new_response = id_search_https.request(id_search_request)
    new_data = JSON.parse(new_response.read_body)

    name = new_data['result']['name']
    address = new_data['result']['formatted_address']
    longitude = new_data['result']['geometry']['location']['lng']
    latitude = new_data['result']['geometry']['location']['lat']

    if new_data['result']['formatted_phone_number'].present?
      tel_number = new_data['result']['formatted_phone_number']
    end

    if new_data['result']['opening_hours'].present?
      opening_hours = new_data['result']['opening_hours']['weekday_text']
    end

    if new_data['result']['website'].present?
      web_site = new_data['result']['website']
    end

    prefecture_id = prefecture

    # 空配列にデータを格納する
    data << [name, address, longitude, latitude, tel_number, opening_hours, web_site, prefecture_id]
    data
  end

  private

  # 検索ワードを指定して施設の情報を取得する
  def get_data(word)
    query = URI.encode_www_form(
      input: word,
      language: 'ja',
      key: ENV['API_KEY']
    )

    url = URI("https://maps.googleapis.com/maps/api/place/autocomplete/json?#{query}")

    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true

    request = Net::HTTP::Get.new(url)

    response = https.request(request)
    search_result = JSON.parse(response.read_body)
    search_result['predictions']
  end
end
