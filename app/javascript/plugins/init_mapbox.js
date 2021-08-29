import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    // add API key to mapbox
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    // display map
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v10'
    });

    // add markers to map
    const markers = JSON.parse(mapElement.dataset.markers);
    console.log(markers);
    if (Array.isArray(markers)) {
      markers.forEach((marker) => {
        new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(map);
      });
    } else {
      new mapboxgl.Marker()
        .setLngLat([ markers.lng, markers.lat ])
        .addTo(map);
    }

    const fitMapToMarkers = (map, markers) => {
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
      map.fitBounds(bounds, { padding: 70, maxZoom: 13, duration: 0 });
    };

    fitMapToMarkers(map, markers);
  }
};

export { initMapbox };
