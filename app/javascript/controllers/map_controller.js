import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      maxZoom: 15,
      minZoom: 5,
      style: "mapbox://styles/mapbox/satellite-v9"
    })
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    this.#setMaxBounds()
  }
  
  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      // Custom marker icon
      const customMarker = document.createElement('div');
      customMarker.className = 'custom-marker';
      customMarker.style.backgroundImage = 'url(/assets/marker.png)';
      customMarker.style.width = '50px';
      customMarker.style.height = '50px';
      customMarker.style.backgroundSize = 'cover';

      new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .addTo(this.map);
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([marker.lng, marker.lat]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #setMaxBounds() {
    const maxBounds = new mapboxgl.LngLatBounds(
      [122.934570, 24.396308],
      [153.986672, 45.551483]
    );
  
    this.map.setMaxBounds(maxBounds);
  }
}
