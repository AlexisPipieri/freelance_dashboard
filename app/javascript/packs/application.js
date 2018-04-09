import "bootstrap";
import "../plugins/flatpickr";

// Set Active class on item selected for design purpose
import { setActiveContact } from '../components/contact_show';
if (document.querySelectorAll(".contact-list-preview")) {
  setActiveContact();
};
