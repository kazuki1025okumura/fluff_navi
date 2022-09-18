let facilityLatLng;
const marker = [];

  window.initMap = () => {
  const map_center = { lat: gon.center_lat, lng: gon.center_lng };
  const zoom_level = gon.zoom_level;
  const map = new google.maps.Map(document.getElementById("map"), {
    center: map_center,
    zoom: zoom_level,
  })

  // 施設の情報を配列で取得
  const facility = gon.facility;

  for (let i = 0; i < facility.length; i++) {

    // LatLngで位置座標のインスタンスを生成していく
    facilityLatLng = new google.maps.LatLng({
      lat: facility[i]['latitude'],
      lng: facility[i]['longitude'],
    })

    marker[i] = new google.maps.Marker({
      position: facilityLatLng,
      map: map,
    })
  }
}
