# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://www.fluff-maps.com"
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/fluff-maps"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
  'fluff-maps',
  aws_access_key_id: ENV['S3_ACCESS_KEY_ID'],
  aws_secret_access_key: ENV['S3_SECRET_ACCESS_KEY'],
  aws_region: 'ap-northeast-1',
)

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
    add root_path
    add facilities_path, :priority => 0.7, :changefreq => 'daily'

    Facility.find_each do |facility|
      add facility_path(facility), :lastmod => facility.updated_at
    end
end
