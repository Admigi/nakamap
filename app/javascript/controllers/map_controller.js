import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    pins: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      maxZoom: 15,
      minZoom: 5,
      style: "mapbox://styles/mapbox/satellite-v9",
      attributionControl: false,
      trackResize: true,
    })
    const japanCenter = [137.7261, 35.5649];
    this.map.setCenter(japanCenter);

    this.#addPinsToMap()
    this.#fitMapToPins()
    this.#setMaxBounds()
  }

  #addPinsToMap() {
    this.pinsValue.forEach((pin) => {
      // Custom pin icon
      const customPin = document.createElement('div');
      customPin.innerHTML = pin.marker_html;
      // customPin.style.width = '50px';
      // customPin.style.height = '50px';
      // customPin.style.backgroundSize = 'cover';

      const popup = new mapboxgl.Popup().setHTML(pin.info_window_html);

      new mapboxgl.Marker(customPin)
        .setLngLat([pin.lng, pin.lat])
        .setPopup(popup)
        .addTo(this.map);
    });
  }

  #fitMapToPins() {
    const bounds = new mapboxgl.LngLatBounds()
    this.pinsValue.forEach(pin => bounds.extend([pin.lng, pin.lat]))
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
