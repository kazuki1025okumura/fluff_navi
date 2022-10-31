module ApplicationHelper
  def default_meta_tags
    {
      site: '~FLUFF MAPS~',
      title: '東京、神奈川で動物とのふれあいに特化した検索サービス',
      reverse: true,
      charset: 'utf-8',
      description: 'FLUFF MAPSは動物とふれあうことができる施設を地域や動物名から簡単に探せるサービスです。',
      keywords: '東京,神奈川,動物,ふれあい',
      canonical: request.original_url,
      separator: '|',
      noindex: ! Rails.env.production?,
      icon: [
        { href: image_url('favicon.ico') },
        { href: image_url('phone_touch_icon.png'), rel: 'apple-touch-icon', sizes: '180x180' },
      ],
      og: {
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: request.original_url,
        image: image_url('top.jpg'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary_large_image',
        site: '@kazuki_okumura',
        image: image_url('top.jpg'),
      }
    }
  end
end
