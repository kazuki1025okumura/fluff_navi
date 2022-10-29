let facilityLatLng;
let currentMarker;
let currentInfoWindow
const marker = [];
const infoWindow = [];

function initMap() {
  const map_center = { lat: gon.center_lat, lng: gon.center_lng };
  const zoom_level = gon.zoom_level;
  const map = new google.maps.Map(document.getElementById("map"), {
    center: map_center,
    zoom: zoom_level,
  })

  // 現在地を取得してマップ上にマーカーを表示する
  navigator.geolocation.getCurrentPosition(function (position) {
    LatLng = new google.maps.LatLng(position.coords.latitude, position.coords.longitude);
    currentMarker = new google.maps.Marker({
      map : map,         
      position : LatLng,
      icon: {
        url: '/assets/current_marker.png',
        scaledSize: new google.maps.Size(22, 22), 
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(11, 11),
      },
    });
  });

  // 施設の情報を配列で取得
  const facilities = gon.facilities;

  for (let i = 0; i < facilities.length; i++) {

    // LatLngで位置座標のインスタンスを生成していく
    facilityLatLng = new google.maps.LatLng({
      lat: facilities[i]['latitude'],
      lng: facilities[i]['longitude'],
    })

    marker[i] = new google.maps.Marker({
      position: facilityLatLng,
      map: map,
    })

    const id = facilities[i]['id']
    const c = facilities[i]['categories']

    var categoriesHtml = '<ul>'
    for (let j = 0; j < c.length; j++) {
      categoriesHtml += `<li>${c[j].name}</li>`
    };
    categoriesHtml += '</ul>'


    const infoContent = 
    `<div class="custom-link map">` +
    `<a href="/facilities/${id}" data-turbolinks="false"><u>${facilities[i]['name']}</u></a>` +
    `</div>` +
    `<p>${facilities[i]['address']}</p>` +
    categoriesHtml;

    infoWindow[i] = new google.maps.InfoWindow({
      content: infoContent
    })

    // マーカーをクリックしたら吹き出しを表示する処理
    marker[i].addListener('click', function () {
      if (currentInfoWindow) {
        currentInfoWindow.close();   // 吹き出しが表示されていた場合その吹き出しを閉じる
      }
      infoWindow[i].open(map, marker[i]);   // 吹き出しを開く

      // 開いた吹き出しを変数に代入して次回別のマーカーをクリックした際に変数に格納されている吹き出しを閉じる
      currentInfoWindow = infoWindow[i];
    });
  }
}

window.initMap = initMap;
