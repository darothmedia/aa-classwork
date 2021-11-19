import mapboxgl from "mapbox-gl";
import React from "react";
import { ReactDOM } from "react";
import MarkerManager from "../util/marker_manager";


class BenchMap extends React.Component {
  componentDidMount(){

    const map = new mapboxgl.Map({
      container: 'map-container',
      style: 'mapbox://styles/mapbox/outdoors-v11',
      center: [-73.965, 40.7758],
      zoom: 16,
      pitch: 45,
      bearing: -17.6,
      antialias: true
    })

    const nav = new mapboxgl.NavigationControl({
      showCompass: true,
      showZoom: true,
      visualizePitch: true
    })

    map.addControl(nav, 'bottom-right')

    map.on('load', () => {
      // Insert the layer beneath any symbol layer.
      const layers = map.getStyle().layers;
      const labelLayerId = layers.find(
        (layer) => layer.type === 'symbol' && layer.layout['text-field']
      ).id;

      // The 'building' layer in the Mapbox Streets
      // vector tileset contains building height data
      // from OpenStreetMap.
      map.addLayer(
        {
          'id': 'add-3d-buildings',
          'source': 'composite',
          'source-layer': 'building',
          'filter': ['==', 'extrude', 'true'],
          'type': 'fill-extrusion',
          'minzoom': 13,
          'paint': {
            'fill-extrusion-color': '#aaa',

            // Use an 'interpolate' expression to
            // add a smooth transition effect to
            // the buildings as the user zooms in.
            'fill-extrusion-height': [
              'interpolate',
              ['linear'],
              ['zoom'],
              15,
              0,
              15.05,
              ['get', 'height']
            ],
            'fill-extrusion-base': [
              'interpolate',
              ['linear'],
              ['zoom'],
              15,
              0,
              15.05,
              ['get', 'min_height']
            ],
            'fill-extrusion-opacity': 0.6
          }
        },
        labelLayerId
      );
    });

    // map.on('load', () => {
    //   map.addSource('mapbox-dem', {
    //     'type': 'raster-dem',
    //     'url': 'mapbox://mapbox.mapbox-terrain-dem-v1',
    //     'tileSize': 512,
    //     'maxzoom': 14
    //   });
    //   // add the DEM source as a terrain layer with exaggerated height
    //   map.setTerrain({ 'source': 'mapbox-dem', 'exaggeration': 2 });

    //   // add a sky layer that will show when the map is highly pitched
    //   map.addLayer({
    //     'id': 'sky',
    //     'type': 'sky',
    //     'paint': {
    //       'sky-type': 'atmosphere',
    //       'sky-atmosphere-sun': [0.0, 0.0],
    //       'sky-atmosphere-sun-intensity': 30
    //     }
    //   });
    // });


    const marker = new mapboxgl.Marker({
      draggable: true,
      color: '#000000'
    })
      .setLngLat([-73.965, 40.7758])
      .addTo(map);

    const popup = new mapboxgl.Popup({
      draggable: true,
      color: '#000000'
    })
      .setLngLat([-73.965, 40.7758 + 0.001])
      .setHTML('<h1>A popup!</h1>')
      .addTo(map);

    // const mapOptions = {
    //   center: { lat: 40.7758, lng: -73.965 }, // this is NY
    //   zoom: 13
    // };

    // this.map = new google.maps.Map(this.mapNode, mapOptions);
    // this.marker = new google.maps.Marker({
    //   position: { lat: 40.7758, lng: -73.965 },
    //   map: this.map,
    //   title: "I'm a marker!"
    // })
    // this.image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png'
    // this.marker2 = new google.maps.Marker({
    //   position: { lat: 40.77, lng: -73.965 },
    //   map: this.map,
    //   icon: this.image,
    //   title: "I'm a marker 2!"
    // })
    // this.MarkerManager = new MarkerManager(this.map)
    // this.MarkerManager.updateMarkers()
  }

  componentDidUpdate(){
    this.marker.setMap(this.map)
    this.marker2.setMap(this.map)
    this.MarkerManager.updateMarkers()
  }
  
  render(){
    return (
      <div id='map-container' ref={map => this.mapNode = map}>

      </div>
    )
  }
}

export default BenchMap