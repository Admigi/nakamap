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
    })
    this.#addPinsToMap()
    this.#fitMapToPins()
    this.#setMaxBounds()
  }
  
  #addPinsToMap() {
    this.pinsValue.forEach((pin) => {
      // Custom pin icon
      const customPin = document.createElement('div');
      customPin.className = 'custom-pin';
      customPin.style.backgroundImage = 'url(/assets/marker.png)';
      customPin.style.width = '50px';
      customPin.style.height = '50px';
      customPin.style.backgroundSize = 'cover';

      const popup = new mapboxgl.Popup().setHTML(`<h3>${pin.name}</h3><p>${pin.description}</p><a href="/posts/${pin.post_id}">View Post</a>`);

      new mapboxgl.Marker(customPin)
        .setPopup(popup)
        .setLngLat([pin.longitude, pin.latitude])
        .addTo(this.map);
    });
  }

  #fitMapToPins() {
    const bounds = new mapboxgl.LngLatBounds()
    this.pinsValue.forEach(pin => bounds.extend([pin.longitude, pin.latitude]))
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
