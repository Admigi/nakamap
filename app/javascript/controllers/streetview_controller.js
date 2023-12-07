import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.initializeStreetView();
  }

  initializeStreetView() {
    // Customize the options as needed
    const options = {
      position: { lat: 34.6882437, lng: 135.8397568 },
      pov: { heading: 0, pitch: 15 }, // heading for horizontal rotation, pitch for vertical rotation
      zoom: 0.3,
    };

    const streetView = new google.maps.StreetViewPanorama(
      this.element,
      options
    );

    // You can update the street view dynamically if needed
    // streetView.setPosition({ lat: NEW_LATITUDE, lng: NEW_LONGITUDE });
  }
}
