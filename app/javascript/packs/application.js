require("@rails/ujs").start()
require("@rails/activestorage").start()
require("turbolinks").start()
require("channels")

import "bootstrap";

import { autocompleteSearch } from "../components/autocomplete";
import { lessonModal } from "../components/lesson_modal";

document.addEventListener('turbolinks:load', () => {
  // Call your JS functions here
  autocompleteSearch();
  lessonModal();
});
