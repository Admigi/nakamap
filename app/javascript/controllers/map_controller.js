import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';

export default class extends Controller {
  static values = {
    apiKey: String,
    pins: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue;

    this.map = new mapboxgl.Map({
      container: this.element,
      maxZoom: 15,
      minZoom: 5,
      style: "mapbox://styles/mapbox/satellite-v9",
      attributionControl: false,
      trackResize: true,
    });

    const japanCenter = [137.7261, 35.5649];
    this.map.setCenter(japanCenter);

    const northEast = [153.986672, 45.551483];
    const southWest = [122.934570, 24.396308];
    const boundingBox = new mapboxgl.LngLatBounds(southWest, northEast);

    // Utilisez fitBounds pour ajuster la carte aux limites spécifiées
    this.map.fitBounds(boundingBox, { padding: 70, maxZoom: 15, duration: 0 });

    this.#addPinsToMap();
    this.#setMaxBounds();
  }

  #addPinsToMap() {
    this.pinsValue.forEach((pin) => {
      const customPin = document.createElement('div');
      customPin.innerHTML = pin.marker_html;

      const popup = new mapboxgl.Popup().setHTML(pin.info_window_html);

      new mapboxgl.Marker(customPin)
        .setLngLat([pin.lng, pin.lat])
        .setPopup(popup)
        .addTo(this.map);
    });
  }

  #setMaxBounds() {
    const maxBounds = new mapboxgl.LngLatBounds(
      [122.934570, 24.396308],
      [153.986672, 45.551483]
    );

    this.map.setMaxBounds(maxBounds);
  }
}
