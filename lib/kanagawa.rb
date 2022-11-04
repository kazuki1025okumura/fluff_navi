class Kanagawa < FetchFacility
  require 'uri'
  require 'net/http'
  require 'fetch_facility'

  def execute
    csv_generate
  end

  private

  def csv_generate
    CSV.open(Rails.root.join('lib/csv/kanagawa.csv'), 'a', force_quotes: true) do |csv|
      detailed_search(14, '神奈川 牧場', '神奈川 動物 ふれあい', '神奈川 動物カフェ').each do |d|
        csv << d
      end
    end
  end
end
