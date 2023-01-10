class Facility < FetchFacility
  require 'uri'
  require 'net/http'
  require 'fetch_facility'

  def execute
    csv_generate
  end

  private

  # 施設を単体で取得してcsvファイルに出力する
  def csv_generate
    CSV.open(Rails.root.join('lib/csv/tokyo.csv'), 'a', force_quotes: true) do |csv|
      detailed_search(13, 'mipig 原宿店').each do |d|
        csv << d
      end
    end
  end
end
