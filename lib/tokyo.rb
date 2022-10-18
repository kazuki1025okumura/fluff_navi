class Tokyo < FetchFacility
  require 'uri'
  require 'net/http'
  require 'fetch_facility'

  def execute
    csv_generate
  end

  private

  def csv_generate
    CSV.open(Rails.root.join('lib/csv/tokyo.csv'), 'a', force_quotes: true) do |csv|
      detailed_search(1, '東京 牧場', '東京 動物 ふれあい', '東京 動物カフェ').each do |d|
        csv << d
      end
    end
  end
end
