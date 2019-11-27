import "bootstrap";

import 'mapbox-gl/dist/mapbox-gl.css';

import { initMapbox } from '../plugins/init_mapbox';

import { initUpdateNavbarOnScroll } from '../components/navbar';

initUpdateNavbarOnScroll();

initMapbox();
