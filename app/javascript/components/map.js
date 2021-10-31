import mapboxgl from '!mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');


  const fitMapToMarkers = (map, markers) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 70, maxZoom: 12, duration: 1500 });
  };

  if(mapElement) {
  // map injected into div#map
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    // markers
    console.log(mapElement);
    const markers = JSON.parse(mapElement.dataset.markers);
    if(markers.length > 0) {
      markers.forEach((marker) => {
        console.log(marker)
        const popup = new mapboxgl.Popup().setHTML(marker.info_window);

        new mapboxgl.Marker({ "color": "#A0A0ED" })
          .setLngLat([ marker.lng, marker.lat])
          .setPopup(popup)
          .addTo(map);
      })
    fitMapToMarkers(map, markers);}
  };
}



export { initMapbox };
