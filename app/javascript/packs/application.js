import "bootstrap";
import { initPlane } from '../components/plane.js';
import flatpickr from "flatpickr";
import "flatpickr/dist/flatpickr.min.css";

flatpickr(".datepicker", {});

initPlane();
