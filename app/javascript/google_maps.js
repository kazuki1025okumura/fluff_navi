let facilityLatLng;
const marker = [];
const infoWindow = [];

function initMap() {
  const map_center = { lat: gon.center_lat, lng: gon.center_lng };
  const zoom_level = gon.zoom_level;
  const map = new google.maps.Map(document.getElementById("map"), {
    center: map_center,
    zoom: zoom_level,
  })

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
    `<div class="facility-link map">` +
    `<a href="/facilities/${id}" data-turbolinks="false"><u>${facilities[i]['name']}</u></a>` +
    `</div>` +
    `<p>${facilities[i]['address']}</p>` +
    categoriesHtml;

    infoWindow[i] = new google.maps.InfoWindow({
      content: infoContent
    })

    marker[i].addListener('click', function () {
      infoWindow[i].open(map, marker[i])
    })
  }
}

window.initMap = initMap;